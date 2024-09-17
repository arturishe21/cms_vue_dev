<?php

namespace Arturishe21\Cms\Fields;

use Illuminate\Database\Eloquent\Collection;

class Foreign extends Field
{
    protected $options = [];

    public function options($model): self
    {
        $this->options = $model;

        return $this;
    }

    public function getOptions($definition): array
    {
        $collection = $this->getDataWithWhereAndOrder($definition);
        $data = [];

        if ($this->defaultValue) {
            $data = [
                '' => $this->defaultValue
            ];
        }

        foreach ($collection as $item) {
            $data[] =  [
                'id' => $item->id,
                'name' => $item->name
            ];
        }

        return $data;
    }

    public function prepareSave($request)
    {
        $nameField = $this->getNameField();

        if (isset($request[$nameField]) && $request[$nameField]) {
            return $request[$nameField];
        }

        return null;
    }

    public function getDataWithWhereAndOrder($definition): Collection
    {
        $modelRelated = $definition->model()->{$this->options->getRelation()}()->getRelated();

        $collection = $modelRelated::select(['id', $this->options->getKeyField() . ' as name']);

        $where = $this->options->getWhereCollection();
        $order = $this->options->getOrderCollection();

        if (count($where)) {
            foreach ($where as $param) {
                $collection = $collection->where($param['field'], $param['eq'], $param['value']);
            }
        }

        if (count($order)) {
            foreach ($order as $param) {
                $collection = $collection->orderBy($param['field'], $param['order']);
            }
        }

        return $collection->get();
    }

    protected function getCacheArray($definition, $modelRelated): array
    {
        $cacheArray[] = $definition->getCacheKey();
        $cacheArray[] = $modelRelated->getTable();

        return $cacheArray;
    }

    protected function meta(): array
    {
        return [
            'options' => $this->getOptions($this->definition),
            'relation' => $this->options->getRelation(),
        ];
    }
}
