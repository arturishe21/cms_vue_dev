<?php

namespace App\Services;

class Import
{
    private $definition;

    public function __construct($definition)
    {
        $this->definition = (new $definition()) ;
    }

    public function show($list)
    {
        return view('admin::new.list.buttons.export', compact('list'));
    }
}
