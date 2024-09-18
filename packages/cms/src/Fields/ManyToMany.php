<?php

namespace Arturishe21\Cms\Fields;

use Arturishe21\Cms\Definitions\Resource;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Collection;
use Arturishe21\Cms\Fields\Relations\Options;

class ManyToMany extends Field
{
    protected bool $isFieldForUpdateCreate = false;
    protected bool $onlyForm = true;
    protected bool $isManyToMany = true;
    protected Options $options;

    public function options(Options $model): self
    {
        $this->options = $model;

        return $this;
    }

    public function getNameField(): string
    {
        return $this->options->getRelation();
    }

    public function getOptions(Resource $definition): array
    {
        $collection = $this->getDataWithWhereAndOrder($definition);

        $data = [];

        foreach ($collection as $item) {
            $data[] = [
                'id' => $item->id,
                'name' => $item->t('name')
            ] ;
        }

        return $data;
    }

    public function getDataWithWhereAndOrder(Resource $definition): Collection
    {
        $modelRelated = $definition->model()->{$this->options->getRelation()}()->getRelated();
        $collection = $modelRelated::select(['id', $this->options->getKeyField().' as name']);
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

        if (request()->q) {
            $collection = $collection->where($this->options->getKeyField(), 'like', request()->q . '%');
        }

        return $collection->get();
    }

    public function getOptionsSelected(Resource $definition): Collection|array
    {
        if (request()->id) {
            return $definition->model()->find(request()->id)->{$this->options->getRelation()}()->get(['id', 'name']);
        }

        return [];
    }

    public function saveManyToMany(Model $model, array $request): void
    {
        $relation = $this->getNameField();
        $listForSaving = $request[$relation] ?? [];
        $listForSavingIds = array_column($listForSaving, 'id');

        $model->{$relation}()->sync($listForSavingIds);
    }

    public function getValue(): mixed
    {
        return $this->getOptionsSelected($this->definition);
    }

    protected function meta(): array
    {
        return [
            'options' => $this->getOptions($this->definition),
            'relation' => $this->options->getRelation(),
        ];
    }
}
