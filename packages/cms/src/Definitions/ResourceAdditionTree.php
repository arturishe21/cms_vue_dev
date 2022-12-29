<?php

namespace Arturishe21\Cms\Definitions;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Pagination\LengthAwarePaginator;

class ResourceAdditionTree extends Resource
{
    public string $component = 'list_tree';

    public function fields(): array
    {
    }

    public function getListing($modelRelation = null): LengthAwarePaginator
    {
        $list = $this->getCollectionTree();
        $head = $this->head($modelRelation);

        $itemsTransformed = $list
            ->getCollection()
            ->map(function($item) use ($head) {
                $result = [];

                foreach ($head as $fieldModel) {
                    $result[$fieldModel->getNameField()] = [
                        'title' => $fieldModel->getValueForList($item),
                        'folder' => $item->isHasChildren(),
                    ];
                }

                $result['id'] = $item->id;

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

    public function getCollectionTree()
    {
        $current = $this->model()->findOrFail(request('node', 1));
        $children = $current->children();
        $collection = $children->withCount('children');
        $collection = $this->filterResource->process($collection, $this);

        return $collection->defaultOrder()->paginate($this->getPerPageThis());
    }

    public function getThisNode()
    {
        $page = $this->model()->find(request('node', 1));

        return [
            'page' => $page,
            'ancestors' => $page::defaultOrder()->ancestorsOf($page)
        ];
    }

    public function changePosition(Request $request): JsonResponse
    {
        $list = $request->get('ids');
        $itemMoved = $this->model()::find($request->get('element'));

        $key = array_search($itemMoved->id, $list);

        if ($key) {
            $idLeftSibling = $list[$key-1];
            $itemMoved->insertAfterNode($this->model()::find($idLeftSibling));
        } else {
            $idRightSibling = $list[$key+1];
            $itemMoved->insertBeforeNode($this->model()::find($idRightSibling));
        }

        return $this->returnSuccess('Порядок следования изменен');
    }

    public function saveAddForm($request, $relativeModel = null): JsonResponse
    {
        $record = $this->model();
        $result = parent::saveData($record, $request);

        $node = request('__node') ? : 1;
        $thisRecord = $this->model()->find($result['id']);

        $thisRecord->parent_id = $node;
        $thisRecord->save();

        $root = $this->model()->find($node);
        $thisRecord->prependToNode($root)->save();

        return $this->returnSuccess('Сохренено');
    }

    public function clone(int $id): JsonResponse
    {
        return $this->cloneTree($id);
    }
}
