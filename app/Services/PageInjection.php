<?php

namespace App\Services;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;
use Vis\Builder\Definitions\Resource;

class PageInjection
{
    public Resource $definition;
    public Model $model;

    public function __construct(string $table, ?int $id)
    {
        $modelDefinitionClass = "App\\Cms\\Definitions\\" . ucfirst(Str::camel($table));

        $this->definition =  app($modelDefinitionClass);
        $this->model = $id ? $this->definition->model()->find($id) : $this->definition->model();
    }
}