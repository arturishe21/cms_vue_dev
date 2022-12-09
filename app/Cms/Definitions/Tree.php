<?php

namespace App\Cms\Definitions;

use App\Cms\Definitions\TemplatesTree\{Node, Contacts};
use Vis\Builder\Definitions\ResourceTree;

class Tree extends ResourceTree
{
    public function templates()
    {
        return [
            'main' => Node::class,
            'contacts' => Contacts::class
        ];
    }
}
