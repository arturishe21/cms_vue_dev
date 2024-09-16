<?php

namespace Arturishe21\Cms\Definitions;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Arturishe21\Cms\Fields\Field;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Validator;
use Arturishe21\Cms\Services\Actions;
use Arturishe21\Cms\Definitions\Traits\CacheResource;
use Illuminate\Support\Str;
use Illuminate\Http\JsonResponse;
use Arturishe21\Cms\Services\FilterResource;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Pagination\LengthAwarePaginator;

abstract class Resource
{
    use CacheResource;

    public string $title;
    public string $model = '';
    public Model $resolvedModel;
    protected string $orderBy = 'created_at desc';
    protected bool $isSortable = false;
    protected array $perPage = [20, 50, 100];
    protected string $cacheTag = '';
    protected array $relations = [];
    public $filterScope;
    public string $component = 'list';
    private $relativeModel;

    public function __construct(protected FilterResource $filterResource)
    {
    }

    public function actions(): Actions
    {
        return Actions::make()->insert()->update()->clone()->revisions()->delete();
    }

    public function model(): Model
    {
        return new $this->model;
    }

    public function setModelRelation($relativeModel)
    {
        $this->relativeModel = $relativeModel;

        return $this;
    }

    public function buttons(): array
    {
        return [];
    }

    public function cards(): array
    {
        return [];
    }

    public function getFields()
    {
        return $this->fields();
    }

    public function getTitle(): string
    {
        return __cms($this->title);
    }

    public function getPerPage(): array
    {
        return $this->perPage;
    }

    public function getIsSortable(): bool
    {
        return $this->isSortable;
    }

    public function getOrderBy(): string
    {
        $sessionOrder = session($this->getSessionKeyOrder());

        if ($sessionOrder) {
            return $sessionOrder['field'] . ' ' . $sessionOrder['direction'];
        }

        return $this->orderBy;
    }

    public function getOrderByJson(): ?array
    {
        $sessionOrder = session($this->getSessionKeyOrder());

        if ($sessionOrder) {
            return [
                $sessionOrder['field'] => $sessionOrder['direction']
            ];
        }

        return [];
    }

    public function getFilter(): array
    {
        $filterData = session($this->getSessionKeyFilter()) ?? [];

        return array_filter($filterData, function ($v) { return $v !== null; });
    }

    public function getPerPageThis(): int
    {
        $perPage = session($this->getSessionKeyPerPage());

        return $perPage['per_page'] ?? $this->perPage[0];
    }

    public function getNameDefinition(): string
    {
        return Str::snake(class_basename($this));
    }

    public function getSessionKeyOrder(): string
    {
        return "table_builder.{$this->getNameDefinition()}.order";
    }

    public function getSessionKeyFilter(): string
    {
        return "table_builder.{$this->getNameDefinition()}.filter";
    }

    public function getSessionKeyPerPage(): string
    {
        return "table_builder.{$this->getNameDefinition()}.per_page";
    }

    public function getFieldsForUpdateInsert(): Collection
    {
        return collect($this->getFieldsFlatten())->filter->isAccessForUpdateCreate();
    }

    public function getFieldsForUpdatingRelations(): Collection
    {
        return collect($this->getFieldsFlatten())->filter->isAccessForUpdateCreate(false);
    }

    public function getAllFields(): array
    {
        $fieldsResults = [];
        foreach ($this->getFieldsFlatten() as $field) {

            $fieldsResults[$field->getNameField()] = $field->setDefinition($this);

            if ($field->getHasOne()) {
                $this->relations[] = $field->getHasOne();
            }

            if ($field->getMorphOne()) {
                $this->relations[] = $field->getMorphOne();
            }
        }

        return $fieldsResults;
    }

    public function getField($key): ?Field
    {
        $allFields = $this->getAllFields();

        return $allFields[$key] ?? null;
    }

    public function remove(): JsonResponse
    {
        $this->resolvedModel->delete();
        $this->clearCache();

        return $this->returnSuccess('Запись удалена');
    }

    public function saveAddForm(array $data, $relativeModel = null): JsonResponse
    {
        $record = $this->model();

        if ($relativeModel) {
            $record = $relativeModel;
        }

        $this->saveData($record, $data);

        return $this->returnSuccess('Сохренено');
    }

    public function saveEditForm($request): JsonResponse
    {
        $this->saveData($this->resolvedModel, $request);

        return $this->returnSuccess('Сохренено');
    }

    public function fastEdit(Request $request): JsonResponse
    {
        $record = $this->resolvedModel;
        $record->{$request->get('key')} = $request->get('value');
        $record->save();

        return $this->returnSuccess('Сохренено');
    }

    protected function saveData(Model|HasMany $model, array $request): Model
    {
        $model = $this->saveDataInTable($model, $request);
        $this->updateRelations($model, $request);

        $this->clearCache();

        return $model;
    }

    private function getRules($fields): array
    {
        $rules = [];
        foreach ($fields as $field) {
            if ($field->getRules()) {
                $rules[$field->getNameField()] = $field->getRules();
            }
        }

        return $rules;
    }

    private function saveDataInTable(Model|HasMany $record, array $request): Model
    {
        $fields = $this->getFieldsForUpdateInsert();
        Validator::make($request, $this->getRules($fields))->validate();

        if ($record instanceof HasMany) {

            $arrayForSave = [];
            foreach ($fields as $field) {
                $arrayForSave[$field->getNameField()] = $field->prepareSave($request);
            }

            $record->create($arrayForSave);

            return $record->getModel();
        }

        foreach ($fields as $field) {
            $record->{$field->getNameField()} = $field->prepareSave($request);
        }

        $record->save();

        return $record->getModel();
    }

    private function updateRelations(Model $model, array $request): void
    {
        $fields = $this->getFieldsForUpdatingRelations();

        foreach ($fields as $field) {

            if ($field->getHasOne()) {
                $field->updateHasOne($model, $request);
            }

            if ($field->getMorphOne()) {
                $field->updateMorphOne($model, $request);
            }

            if ($field->isManyToMany()) {
                $field->saveManyToMany($model, $request);
            }
        }
    }

    public function getListing($modelRelation = null): LengthAwarePaginator
    {
        $this->checkPermissions();

        $head = $this->head($modelRelation);
        $list = $this->getCollection();

        $itemsTransformed = $list
            ->getCollection()
            ->map(function($item) use ($head) {

                $result = [];
                foreach ($head as $fieldModel) {
                    $result[$fieldModel->getNameField()] = $fieldModel->getValueForList($item);
                }

                $result['url_preview'] = $item->getUrlPreview();

                return $result;

            })->toArray();

        return new LengthAwarePaginator(
            $itemsTransformed,
            $list->total(),
            $list->perPage(),
            $list->currentPage(), [
                'path' => \Request::url(),
                'query' => [
                    'page' => $list->currentPage()
                ]
            ]
        );
    }

    public function changePosition(Request $request): JsonResponse
    {
        $pageThisCount = $request->get('number_page', 1);
        $perPage = $request->get('per_page');

        $priority = ($pageThisCount * $perPage) - $perPage;

        foreach ($request->get('ids') as $id) {
            $priority++;

            $this->model()->where('id', $id)->update([
                'priority' => $priority,
            ]);
        }

        return $this->returnSuccess('Порядок следования изменен');
    }

    public function clone(): JsonResponse
    {
        $this->resolvedModel->duplicate();

        return $this->returnSuccess('Запись склонирована');
    }

    protected function checkPermissions()
    {
       return;
        if (!app('user')->hasAccess([$this->getNameDefinition(). '.view'])) {
            abort(403);
        }
    }

    public function getCollection($getAllRecords = false)
    {
        $collection = $this->relativeModel ?? $this->model()->with($this->relations);

        $collection = $this->filterResource->process($collection, $this);

        if ($getAllRecords) {
           return $collection->orderByRaw($this->getOrderBy())->get();
        }

        return $collection->orderByRaw($this->getOrderBy())->paginate($this->getPerPageThis());
    }

    public function filterScope($scope)
    {
        $this->filterScope = $scope;
    }

    public function head(?Resource $model = null): Collection
    {
        $model = $model ?? $this;

        $fields = $model->getAllFields();

        return collect($fields)->reject->isOnlyForm();
    }

    public function getThisNode(): array
    {
        return [];
    }

    protected function returnSuccess(string $message): JsonResponse
    {
        return response()->json([
            'status' => 'success',
            'message' => $message
        ]);
    }

    private function getFieldsFlatten(): array
    {
        $fields = $this->getFields();

        return isset($fields[0]) ? $fields : Arr::flatten($fields);
    }
}
