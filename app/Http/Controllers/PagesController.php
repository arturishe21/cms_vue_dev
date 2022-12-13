<?php

namespace App\Http\Controllers;

use App\Services\PageInjection;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Collection;

class PagesController extends Controller
{
    public function index(PageInjection $modelDefinition): JsonResponse
    {
        return response()->json([
            'data' => $modelDefinition->definition->getListing(),
            'title' => $modelDefinition->definition->getTitle(),
            'fields' => $modelDefinition->definition->head(),
            'isSortable' => $modelDefinition->definition->getIsSortable(),
            'order' => $modelDefinition->definition->getOrderByJson(),
            'filter' => $modelDefinition->definition->getFilter(),
            'component' => $modelDefinition->definition->component,
            'node' => $modelDefinition->definition->getThisNode()
        ]);
    }

    public function edit(PageInjection $modelDefinition): JsonResponse
    {
        return $this->getDataForForm($modelDefinition);
    }

    public function store(PageInjection $modelDefinition): void
    {
        $modelDefinition->definition->saveAddForm(request()->all());
    }

    public function create(PageInjection $modelDefinition)
    {
        return $this->getDataForForm($modelDefinition);
    }

    public function update(PageInjection $modelDefinition)
    {
        $modelDefinition->definition->saveEditForm(request()->all(), $modelDefinition->model);
    }

    public function destroy(PageInjection $modelDefinition): JsonResponse
    {
        $modelDefinition->model->delete();

        return response()->json('The post successfully deleted');
    }

    public function changePosition(PageInjection $modelDefinition)
    {
       return $modelDefinition->definition->changePosition(request()->all());
    }

    public function setOrder(PageInjection $modelDefinition): void
    {
        session()->put($modelDefinition->definition->getSessionKeyOrder(), request()->all());
    }

    public function clearOrder(PageInjection $modelDefinition): void
    {
        session()->forget($modelDefinition->definition->getSessionKeyOrder());
    }

    public function filter(PageInjection $modelDefinition): void
    {
        session()->put($modelDefinition->definition->getSessionKeyFilter(), request()->all());
    }

    public function search(PageInjection $modelDefinition): Collection
    {
        $field = $modelDefinition->definition->getAllFields()[request('key')];

        return $field->search(request()->get('query'));
    }

    private function getDataForForm(PageInjection $modelDefinition): JsonResponse
    {
        $fields = $modelDefinition->definition->getFields($modelDefinition);

        if (isset($fields[0])) {
            $this->setValueField($fields, $modelDefinition);
        } else {
            foreach ($fields as $fieldBlock) {
                $this->setValueField($fieldBlock, $modelDefinition);
            }
        }

        return response()->json($fields);
    }

    private function setValueField($fields, $modelDefinition): void
    {
        foreach ($fields as $field) {
            $field->setDefinition($modelDefinition->definition)->setValue($modelDefinition->model);
        }
    }
}
