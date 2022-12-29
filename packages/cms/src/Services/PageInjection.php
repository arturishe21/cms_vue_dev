<?php

namespace Arturishe21\Cms\Services;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;
use Arturishe21\Cms\Definitions\Resource;

class PageInjection
{
    public Resource $definition;
    public Model $model;
    private string $pathToDefinition = "App\\Cms\\Definitions\\";

    public function __construct(string $table, ?int $id)
    {
        $modelDefinitionClass = $this->pathToDefinition . ucfirst(Str::camel($table));

        $this->definition = app($modelDefinitionClass);
        $this->model = $id ? $this->definition->model()->find($id) : $this->definition->model();
        $this->definition->resolvedModel = $this->model;
    }
}