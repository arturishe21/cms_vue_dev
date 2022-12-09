<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Services\DefinitionFieldInjection;
use App\Services\PageInjection;

class DefinitionFieldController extends Controller
{
    public function index(DefinitionFieldInjection $modelDefinition)
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
            'node' => $modelDefinition->relativeDefinition->getThisNode()
        ]);
    }

    public function store(DefinitionFieldInjection $modelDefinition)
    {
        $modelDefinition->relativeDefinition->saveAddForm(request()->all(), $modelDefinition->relativeModel);

        //dd($modelDefinition->relativeDefinition);
    }
}
