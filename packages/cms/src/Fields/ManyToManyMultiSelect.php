<?php

namespace Arturishe21\Cms\Fields;

use Arturishe21\Cms\Definitions\Resource;
use Illuminate\Database\Eloquent\Collection;

class ManyToManyMultiSelect extends ManyToMany
{
    public function save($collectionArray, $model): void
    {
        $model->{$this->options->getRelation()}()->detach();

        if (is_array($collectionArray) && $collectionArray[0]) {
           $model->{$this->options->getRelation()}()->syncWithoutDetaching($collectionArray);
        }
    }

    public function getOptionsSelected(Resource $definition): Collection|array
    {
        if (request()->id) {

            $tableRelateModel = $definition->model()->find(request()->id)
                ->{$this->options->getRelation()}()->getRelated()->getTable();

            $selected = $definition->model()->find(request()->id)->{$this->options->getRelation()}()
                ->select(["{$tableRelateModel}.id", "{$tableRelateModel}.{$this->options->getKeyField()} as name"])
                ->get();

            $result = [];

            foreach ($selected as $item) {
                $result[$item->id] = $item->t('name');
            }

            return $result;
        }

        return [];
    }

}
