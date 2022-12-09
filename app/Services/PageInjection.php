<?php

namespace App\Services;

use Illuminate\Support\Str;

class PageInjection
{
    public $definition;
    public $model;

    public function __construct($table, $id)
    {
        $modelDefinitionClass = "App\\Cms\\Definitions\\" . ucfirst(Str::camel($table));

        $this->definition =  new $modelDefinitionClass();
        $this->model = $id ? $this->definition->model()->find($id) : $this->definition->model();
    }
}