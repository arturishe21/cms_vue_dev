<?php

namespace Arturishe21\Cms\Http\Controllers;

use Arturishe21\Cms\Services\PageInjection;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Collection;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Arturishe21\Cms\Definitions\ResourceCustom;

class PagesController extends Controller
{
    public function index(PageInjection $modelDefinition): JsonResponse
    {
        if (is_subclass_of($modelDefinition->definition, ResourceCustom::class)) {
            return response()->json([
                'title' => $modelDefinition->definition->getTitle(),
                'component' => $modelDefinition->definition->component,
                'html' =>  $modelDefinition->definition->getHtml()
            ]);
        }

        return response()->json([
            'data' => $modelDefinition->definition->getListing(),
            'title' => $modelDefinition->definition->getTitle(),
            'fields' => $modelDefinition->definition->head(),
            'is_sortable' => $modelDefinition->definition->getIsSortable(),
            'order' => $modelDefinition->definition->getOrderByJson(),
            'filter' => $modelDefinition->definition->getFilter(),
            'component' => $modelDefinition->definition->component,
            'node' => $modelDefinition->definition->getThisNode(),
            'per_page_list' => $modelDefinition->definition->getPerPage(),
            'actions' => $modelDefinition->definition->actions()->getActionsList()
        ]);
    }

    public function edit(PageInjection $modelDefinition): JsonResponse
    {
        return $this->getDataForForm($modelDefinition);
    }

    public function store(PageInjection $modelDefinition, Request $request): JsonResponse
    {
        return $modelDefinition->definition->saveAddForm($request->all());
    }

    public function create(PageInjection $modelDefinition): JsonResponse
    {
        return $this->getDataForForm($modelDefinition);
    }

    public function update(PageInjection $modelDefinition, Request $request): JsonResponse
    {
        return $modelDefinition->definition->saveEditForm($request->all());
    }

    public function destroy(PageInjection $modelDefinition): JsonResponse
    {
        return $modelDefinition->definition->remove();
    }

    public function clone(PageInjection $modelDefinition): JsonResponse
    {
        return $modelDefinition->definition->clone();
    }

    public function changePosition(PageInjection $modelDefinition, Request $request): JsonResponse
    {
        return $modelDefinition->definition->changePosition($request);
    }

    public function fastEdit(PageInjection $modelDefinition, Request $request): JsonResponse
    {
        return $modelDefinition->definition->fastEdit($request);
    }

    public function setOrder(PageInjection $modelDefinition, Request $request): void
    {
        session()->put($modelDefinition->definition->getSessionKeyOrder(), $request->all());
    }

    public function setPerPage(PageInjection $modelDefinition, Request $request): void
    {
        session()->put($modelDefinition->definition->getSessionKeyPerPage(), $request->all());
    }

    public function filter(PageInjection $modelDefinition, Request $request): void
    {
        session()->put($modelDefinition->definition->getSessionKeyFilter(), $request->all());
    }

    public function clearOrder(PageInjection $modelDefinition): void
    {
        session()->forget($modelDefinition->definition->getSessionKeyOrder());
    }

    public function search(PageInjection $modelDefinition, Request $request): Collection
    {
        $field = $modelDefinition->definition->getAllFields()[$request->get('key')];

        return $field->search($request->get('query'));
    }

    private function getDataForForm(PageInjection $modelDefinition): JsonResponse
    {
        return response()->json([
            'definition' => $modelDefinition->definition->getNameDefinition(),
            'fields' => $modelDefinition->definition->getFields()
        ]);
    }
}
