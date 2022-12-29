<?php

namespace Arturishe21\Cms\Fields;

use Illuminate\Database\Eloquent\Model;

class MultiFile extends File
{
    public function getValueForList(Model $model): ?string
    {
        $collections = json_decode($model->{$this->key});
        $result = [];

        if (count($collections)) {
            $result = array_map(function ($file) {
                return "<a href='{$file}'>". basename($file). "<a>";
            }, $collections);
        }

        return implode('<br>', $result);
    }
}


