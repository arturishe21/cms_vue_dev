<?php

namespace App\Services;

use Illuminate\Support\Str;

class DefinitionFieldInjection
{
    public $definition;
    public $model;
    public $relativeDefinition;
    public $relativeModel;

    public function __construct($table, $id, $relative)
    {
        $modelDefinitionClass = "App\\Cms\\Definitions\\" . ucfirst(Str::camel($table));

        $this->definition =  new $modelDefinitionClass();
        $this->model = $id ? $this->definition->model()->find($id) : $this->definition->model();

        $this->relativeDefinition = $this->definition->getField($relative)->getDefinitionRelation();
        $this->relativeModel = $this->model->$relative();
    }
}