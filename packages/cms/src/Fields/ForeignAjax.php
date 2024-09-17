<?php

namespace Arturishe21\Cms\Fields;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Collection;

class ForeignAjax extends Foreign
{
    protected string $filterComponent = 'FilterForeignAjax';
    protected string $fastEditComponent = 'fast_foreign_ajax';

    public function getValue(): mixed
    {
        return $this->getRelation($this->model);
    }

    public function getValueForList(Model $model): mixed
    {
        $value = $this->getRelation($model);

        if ($this->isFastEdit) {
            return $value;
        }

        return $value['name'] ?? '';
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

    private function getRelation(?Model $model): mixed
    {
        $relation = $model->{$this->options->getRelation()}()
            ->select([ "id", "{$this->options->getKeyField()} as name"])
            ->first();

        return $relation ? : '';
    }
}
