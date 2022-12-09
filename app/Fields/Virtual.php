<?php

namespace App\Fields;

class Virtual extends \Vis\Builder\Fields\Virtual
{
    public function setValue($value)
    {
        $this->value = 'sss';
    }
}