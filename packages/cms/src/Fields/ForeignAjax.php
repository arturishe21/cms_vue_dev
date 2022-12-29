<?php

namespace Arturishe21\Cms\Fields;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Collection;

class ForeignAjax extends Foreign
{
    protected string $filterType = 'FilterForeignAjax';

    public function getValue()
    {
        $relation = $this->model->{$this->options->getRelation()}()
            ->select([ "id", "{$this->options->getKeyField()} as name"])
            ->first();

        return $relation ? : '';
    }

    public function getValueForList(Model $model): string
    {
        $relation = $model->{$this->options->getRelation()}()
            ->select([ "id", "{$this->options->getKeyField()} as name"])
            ->first();

        $value = $relation ? : '';

        return $value['name'] ?? '';
    }

    public function getValueForExel()
    {
        return $this->getValueForList();
    }

    public function search(string $query): Collection
    {
        $keyField = $this->options->getKeyField();
        $modelRelated = $this->definition->model()->{$this->options->getRelation()}()->getRelated();
        $where = $this->options->getWhereCollection();

        $modelRelated = $modelRelated->where($keyField, 'like', $this->convertQuery($query) . "%");

        if (count($where)) {
            foreach ($where as $param) {
                $modelRelated = $modelRelated->where($param['field'], $param['eq'], $param['value']);
            }
        }

        return $modelRelated->take(10)->get(['id', $keyField . ' as name']);
    }

    protected function meta()
    {
        return [];
    }
}
