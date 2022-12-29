<?php

namespace Arturishe21\Cms\Fields;

use Illuminate\Support\Arr;
use Arturishe21\Cms\Definitions\Resource;

class Foreign extends Field
{
    protected $options = [];

    public function options($model)
    {
        $this->options = $model;

        return $this;
    }

    public function getOptions($definition)
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

    public function getDataWithWhereAndOrder($definition)
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

   /* public function getValueForList(): string
    {
        $value = $this->getValue();
        $definition = $this->getDefinition($definition);
        $modelRelated = $definition->model()->{$this->options->getRelation()}()->getRelated();
        $record = $modelRelated::select(['id', $this->options->getKeyField() . ' as name']);

        $recordThis = $record->find($value);

        return optional($recordThis)->name;
    }*/

    public function getValueForExel()
    {
        return $this->getValueForList();
    }

    protected function getCacheArray($definition, $modelRelated)
    {
        $cacheArray[] = $definition->getCacheKey();
        $cacheArray[] = $modelRelated->getTable();

        return $cacheArray;
    }

    protected function meta()
    {
        return [
            'options' => $this->getOptions($this->definition),
            'relation' => $this->options->getRelation(),
        ];
    }
}
