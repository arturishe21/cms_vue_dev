<?php

namespace Arturishe21\Cms\Fields;

use Arturishe21\Cms\Definitions\Resource;
use Illuminate\Support\Str;

class Definition extends Field
{
    protected string $definitionRelation;
    protected string $relation;
    protected bool $onlyForm = true;
    protected string $typeRelative;
    protected bool $isFieldForUpdateCreate = false;

    public function getNameField(): string
    {
        return $this->relation;
    }

    public function hasMany($relation, $classDefinitionRelation = null): self
    {
        $this->relation = $relation;
        $this->definitionRelation = $classDefinitionRelation;
        $this->typeRelative = 'hasMany';

        return $this;
    }

    public function getDefinitionRelation(): Resource
    {
        return app($this->definitionRelation);
    }

    public function morphMany($relation, $classDefinitionRelation = null): self
    {
        $this->relation = $relation;
        $this->definitionRelation = $classDefinitionRelation;
        $this->typeRelative = 'morphMany';

        return $this;
    }

    public function getListOfDefinition(): string
    {
        $arrayName = Str::ucsplit(class_basename($this->definitionRelation));

        $arrayName = array_map('mb_strtolower', $arrayName);

        return implode('_', $arrayName);
    }

    protected function meta(): array
    {
        return [
            'urlLoadDefinition' => $this->getListOfDefinition(),
            'key' => $this->getNameField(),
        ];
    }

}
