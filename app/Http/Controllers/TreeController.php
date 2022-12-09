<?php

namespace App\Http\Controllers;

use App\Cms\Tree\Tree;

class TreeController extends Controller
{
    public function index(Tree $tree)
    {
        return response()->json([
            'data' => $tree->getListing(),
            'title' => $tree->getTitle(),
            'node' => $tree->getThisNode()
            /*'fields' => $modelDefinition->definition->head(),
            'isSortable' => $modelDefinition->definition->getIsSortable(),
            'order' => $modelDefinition->definition->getOrderByJson(),
            'component' => $modelDefinition->definition->component,
            */
        ]);
    }
}
