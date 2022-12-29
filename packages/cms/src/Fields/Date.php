<?php

namespace Arturishe21\Cms\Fields;

use Illuminate\Database\Eloquent\Builder;

class Date extends Field
{
    protected string $filterType = 'FilterDate';

    public function getValue()
    {
        $date = $this->value;

        if ($date) {
            return $this->value->format('Y-m-d');
        }
    }

    public function filterField(Builder &$query, mixed $value): void
    {
        if (isset($value[0]) && $value[0] !== null) {

            $fieldName = $this->getNameField();

            $query->whereBetween($fieldName, $value);
        }
    }
}
