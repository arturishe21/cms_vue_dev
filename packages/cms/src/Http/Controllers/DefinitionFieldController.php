<?php

namespace Arturishe21\Cms\Http\Controllers;

use App\Http\Controllers\Controller;
use Arturishe21\Cms\Services\DefinitionFieldInjection;
use Illuminate\Http\JsonResponse;

class DefinitionFieldController extends Controller
{
    public function index(DefinitionFieldInjection $modelDefinition): JsonResponse
    {
        return response()->json([
            'data' => $modelDefinition->definition->setModelRelation($modelDefinition->relativeModel)->getListing(
                $modelDefinition->relativeDefinition
            ),
            'title' => $modelDefinition->relativeDefinition->getTitle(),
            'fields' => $modelDefinition->relativeDefinition->head(),
            'isSortable' => $modelDefinition->relativeDefinition->getIsSortable(),
            'order' => $modelDefinition->relativeDefinition->getOrderByJson(),
            'component' => $modelDefinition->relativeDefinition->component,
        ]);
    }

    public function store(DefinitionFieldInjection $modelDefinition): void
    {
        $modelDefinition->relativeDefinition->saveAddForm(request()->all(), $modelDefinition->relativeModel);
    }
}
