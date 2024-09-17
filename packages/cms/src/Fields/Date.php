<?php

namespace Arturishe21\Cms\Fields;

use Illuminate\Database\Eloquent\Builder;

class Date extends Field
{
    protected string $filterComponent = 'FilterDate';
    protected string $fastEditComponent = 'fast_date';

    public function getValue(): mixed
    {
        $value = $this->model->{$this->key} ?: $this->defaultValue;

        if ($value) {
            return $value->format('Y-m-d');
        }
        return '';
    }

    public function filterField(Builder &$query, mixed $value): void
    {
        if (isset($value[0]) && $value[0] !== null) {

            $fieldName = $this->getNameField();

            $query->whereBetween($fieldName, $value);
        }
    }
}
