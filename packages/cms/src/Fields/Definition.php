<?php

namespace Arturishe21\Cms\Fields;

use Illuminate\Support\Str;

class Definition extends Field
{
    protected $definitionRelation;
    protected $relation;
    protected $onlyForm = true;
    protected $typeRelative;
    protected bool $isFieldForUpdateCreate = false;

    public function getNameField() : string
    {
        return $this->relation;
    }

    public function hasMany($relation, $classDefinitionRelation = null)
    {
        $this->relation = $relation;
        $this->definitionRelation = $classDefinitionRelation;
        $this->typeRelative = 'hasMany';

        return $this;
    }

    public function getDefinitionRelation()
    {
        return  app($this->definitionRelation);
    }

    public function morphMany($relation, $classDefinitionRelation = null)
    {
        $this->relation = $relation;
        $this->definitionRelation = $classDefinitionRelation;
        $this->typeRelative = 'morphMany';

        return $this;
    }

    public function getListOfDefinition()
    {
        $arrayName = Str::ucsplit(class_basename($this->definitionRelation));

        $arrayName = array_map('mb_strtolower', $arrayName);

        return implode('_', $arrayName);
    }

    protected function meta()
    {
        return [
            'urlLoadDefinition' => $this->getListOfDefinition(),
            'key' => $this->getNameField(),
        ];
    }

}
