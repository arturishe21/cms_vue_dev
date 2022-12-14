<?php

namespace Arturishe21\Cms\Fields;

use Arturishe21\Cms\Services\PageInjection;
use Arturishe21\Cms\Repository\LanguageRepository;
use Arturishe21\Cms\Definitions\Resource;
use Arturishe21\Cms\Models\Language;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;
use JsonSerializable;
use Illuminate\Database\Eloquent\Builder;

class Field implements JsonSerializable
{
    protected $name;
    protected $key;
    protected $onlyForm = false;
    public $value = '';
    protected $isSortable = false;
    protected $isFilterable = false;
    protected $defaultValue;
    protected array $rules = [];
    protected $language;
    protected $isManyToMany = false;
    protected $filter;
    protected $relationHasOne;
    protected $relationMorphOne;
    protected $classNameField;
    protected $allData;
    protected $locale;
    protected $isSaveOnChange = false;
    protected Resource $definition;
    protected bool $isFieldForUpdateCreate = true;
    protected LanguageRepository $languageRepository;
    protected string $filterType = 'FilterText';
    protected PageInjection $classPageInjection;
    protected ?Model $model = null;

    public function __construct(string $name, $key = null)
    {
        $this->name = $name;
        $this->key = $key ?? str_replace(' ', '_', Str::lower($name));
        $this->locale = config('app.locale');
        $this->languageRepository = app(LanguageRepository::class);
        $this->classPageInjection = app(PageInjection::class);

        $this->definition = $this->classPageInjection->definition;
        $this->model = $this->classPageInjection->model;
    }

    public static function make(...$arguments): self
    {
        return new static(...$arguments);
    }

    public function getComponentName(): string
    {
        $componentName = mb_strtolower(class_basename($this));

        if ($this->language) {
            $componentName .= 'Language';
        }

        return $componentName;
    }

   /* public function setValue($value)
    {
        dd('s');
        $this->allData = $this->classPageInjection->model;

        if ($this->getHasOne()) {
            $relation = $value->{$this->getHasOne()};

            if ($this->getLanguage()) {
                if ($relation) {
                    $this->valueLanguage = json_decode($relation->{$this->key});
                }

                return;
            }

            $this->value = $relation ? $relation->{$this->key} : '';

            return;
        }

        if ($this->getMorphOne()) {
            $relation = $value->{$this->getMorphOne()};

            if ($this->getLanguage()) {
                if ($relation) {
                    $this->valueLanguage = json_decode($relation->{$this->key});
                }

                return;
            }

            $this->value = $relation ? $relation->{$this->getNameField()} : $relation;

            return;
        }

        if ($this->getLanguage()) {
            $this->valueLanguage = json_decode($value[$this->key]);
        }

        $this->value = $value[$this->key];
    }*/

    public function isAccessForUpdateCreate($flag = true): bool
    {
        return $flag ? $this->isFieldForUpdateCreate : !$this->isFieldForUpdateCreate;
    }

    public function setDefinition(Resource $definition): self
    {
        $this->definition = $definition;

        return $this;
    }

    public function getDefinition()
    {
        return $this->definition;
    }

    public function className($class)
    {
        if (is_null($this->classNameField)) {
            $this->classNameField = $class;
        } else {
            $this->classNameField .= " $class";
        }

        return $this;
    }

    public function getClassName()
    {
        return $this->classNameField ? 'section_field '. $this->classNameField : '';
    }

    public function getValue()
    {
        $value = $this->model->{$this->key} ?: $this->defaultValue;

        if ($this->getMorphOne()) {

            if ($relation = $this->model->{$this->getMorphOne()}) {
                $value = $relation->{$this->getNameField()};
            } else {
                $value = '';
            }
        }

        if ($this->language) {
            return json_decode($value);
        }

        return $value;
    }

    public function isOnlyForm()
    {
        return $this->onlyForm;
    }

    public function getName()
    {
        return __cms($this->name);
    }

    public function getNameField()
    {
        return $this->key;
    }

    public function getValueForList(Model $model): ?string
    {
        $value = $model->{$this->key};

        if ($this->language) {
            return json_decode($value)->{$this->locale} ?? null;
        }

        return $value;
    }

    public function getFilter($list)
    {
        $filter = session($list->getDefinition()->getSessionKeyFilter());

        return $filter && isset($filter['filter'][$this->getNameField()]) ?
            $filter['filter'][$this->getNameField()] : '';
    }

    public function filter()
    {
        $this->isFilterable = true;

        return $this;
    }

    public function isFilterable()
    {
        return $this->isFilterable;
    }

    public function default(string $value): self
    {
        $this->defaultValue = $value;

        return $this;
    }

    public function sortable(): self
    {
        $this->isSortable = true;

        return $this;
    }

    public function isSortable()
    {
        return $this->isSortable;
    }

    public function onlyForm(bool $flag = true): self
    {
        $this->onlyForm = $flag;

        return $this;
    }

    public function language(): self
    {
        $this->language = (new Language())->getLanguages();

        return $this;
    }

    public function getLanguage()
    {
        return $this->language;
    }

    public function rules(array $rules): self
    {
        $this->rules = $rules;

        return $this;
    }

    public function getRules(): array
    {
        return $this->rules;
    }

    protected function convertQuery($query) : ?string
    {
        return mb_convert_case($query, MB_CASE_TITLE, "UTF-8");
    }

    public function isManyToMany()
    {
        return $this->isManyToMany;
    }

    public function hasOne($relation)
    {
        $this->relationHasOne = $relation;
        $this->isFieldForUpdateCreate = false;

        return $this;
    }

    public function getHasOne()
    {
        return $this->relationHasOne;
    }

    public function morphOne($relation)
    {
        $this->relationMorphOne = $relation;
        $this->isFieldForUpdateCreate = false;

        return $this;
    }

    public function getMorphOne()
    {
        return $this->relationMorphOne;
    }

    public function prepareSave($request)
    {
        $nameField = $this->getNameField();

        if ($this->language) {
            return $this->languageRepository->transformField($request[$nameField]);
        }

        return $request[$nameField];
    }

    public function updateHasOne(Model $model, array $request): void
    {
        $value = $this->prepareSave($request);
        $relation = $this->getHasOne();
        $nameField = $this->getNameField();

        $model->$relation()->updateOrCreate([], [$nameField => $value]);
    }

    public function updateMorphOne(Model $model, array $request): void
    {
        $value = $this->prepareSave($request);
        $relation = $this->getMorphOne();
        $nameField = $this->getNameField();

        $model->$relation()->updateOrCreate([], [$nameField => $value]);
    }

    public function filterField(Builder &$query, mixed $value): void
    {
        $query->where($this->getNameField(), '=', $value);
    }

    protected function meta()
    {
        return [];
    }

    public function jsonSerialize()
    {
        return array_merge([
            'component' => $this->getComponentName(),
            'key' => $this->getNameField(),
            'title' => $this->name,
            'is_sortable' => $this->isSortable(),
            'is_filterable' => $this->isFilterable(),
            'filterType' => $this->filterType,
            'value' => $this->getValue(),
            'languages' => $this->getLanguage(),

        ], $this->meta());
    }

}

