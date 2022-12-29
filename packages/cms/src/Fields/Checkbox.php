<?php

namespace Arturishe21\Cms\Fields;

use Illuminate\Database\Eloquent\Model;

class Checkbox extends Field
{
    protected string $filterType = 'FilterSelect';

    public function getValueForList(Model $model): ?string
    {
        if (parent::getValueForList($model) === '1') {
            return '<span class="glyphicon glyphicon-ok"></span>';
        }

        return '<span class="glyphicon glyphicon-minus"></span>';
    }

    public function getValueForExel(): string
    {
        return $this->value;
    }

    public function getOptions(): array
    {
        return [
            '0' => __cms('Нет'),
            '1' => __cms('Да')
        ];
    }

    public function getValue()
    {
        if ($this->value === '' && $this->defaultValue) {
            return true;
        }

        if ($this->value) {
            return true;
        }

        return false;
    }

    protected function meta(): array
    {
        return [
            'options' => $this->getOptions()
        ];
    }
}
