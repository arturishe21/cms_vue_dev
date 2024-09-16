<?php

namespace Arturishe21\Cms\Fields;

class MultiSelect extends Select
{
    public bool $onlyForm = true;

    public function getValueForList($definition)
    {
        return '';
    }

    public function getValueArray()
    {
        return json_decode($this->getValue());
    }

    public function getValue()
    {
        return json_decode(parent::getValue()) ?? [];
    }

    public function prepareSave($request)
    {
        $nameField = $this->getNameField();

        return json_encode($request[$nameField] ?? []);
    }
}
