<?php

namespace Arturishe21\Cms\Fields;

use Illuminate\Database\Eloquent\Model;

class Checkbox extends Field
{
    protected string $filterComponent = 'FilterSelect';
    protected string $fastEditComponent = 'fast_checkbox';

    public function getValueForList(Model $model): ?string
    {
        if ($this->isFastEdit) {
            return (bool) parent::getValueForList($model);
        }

        if (parent::getValueForList($model)) {
            return '<span class="glyphicon glyphicon-ok"></span>';
        }

        return '<span class="glyphicon glyphicon-minus"></span>';
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
        $value = parent::getValue();

        if ($value === '' && $this->defaultValue) {
            return true;
        }

        if ($value) {
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
