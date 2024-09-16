<?php

namespace Arturishe21\Cms\Fields;

class Datetime extends Date
{
    public function getValue()
    {
        $value = $this->model->{$this->key} ?: $this->defaultValue;

        if ($value) {
            return $value->format('Y-m-d h:i:s');
        }
    }
}
