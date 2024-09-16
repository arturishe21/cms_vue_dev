<?php

namespace Arturishe21\Cms\Fields;

use Illuminate\Database\Eloquent\Model;

class Select extends Field
{
    private array $options = [];
    private bool $isAction = false;
    private bool $actionSelect = false;
    protected string $filterComponent = 'FilterSelect';
    protected string $fastEditComponent = 'fast_select';

    public function options($arrayList): self
    {
        $this->options = $arrayList;

        return $this;
    }

    public function optionsWithAttributes($arrayList): self
    {
        foreach ($arrayList as $key => $arrayValues) {
            if (is_array($arrayValues) && isset($arrayValues['value'])) {
                $this->options[$key] = $arrayValues['value'];
                unset($arrayList[$key]['value']);
            }
        }

        $this->attributes = $arrayList;

        return $this;
    }

    public function getOptions(): array
    {
        return $this->options;
    }

    public function action(bool $isAction = true): self
    {
        $this->isAction = $isAction;

        return $this;
    }

    public function actionSelect($nameSelect): self
    {
        $this->actionSelect = $nameSelect;

        return $this;
    }

    public function getActionSelect()
    {
        return $this->actionSelect;
    }

    public function getAction(): bool
    {
        return $this->isAction;
    }

    public function getValueForList(Model $model): ?string
    {
        $value = parent::getValueForList($model);

        if ($this->isFastEdit) {
            return $value;
        }

        $optionsArray = $this->getOptions();

        return $optionsArray[$value] ?? '';
    }

    protected function meta(): array
    {
        return [
            'options' => $this->getOptions(),
        ];
    }

}
