<?php

namespace Arturishe21\Cms\Services;

use Illuminate\Database\Eloquent\Builder;
use Arturishe21\Cms\Definitions\Resource;
use Illuminate\Database\Eloquent\Relations\HasMany;

class FilterResource
{
    public function process(Builder|HasMany $collection, Resource $resource)
    {
        $collection = $this->getFilterScope($collection, $resource);

        foreach ($resource->getFilter() as $fieldName => $value) {

            $field = $resource->getField($fieldName);
            if ($field) {
                $collection = $collection->where(function ($query) use ($field, $value) {
                    $field->filterField($query, $value);
                });
            }
        }

        return $collection;
    }

    private function getFilterScope($collection, Resource $resource)
    {
        if (!$resource->filterScope) {
            return $collection;
        }

        return $collection->{$resource->filterScope}();
    }

}