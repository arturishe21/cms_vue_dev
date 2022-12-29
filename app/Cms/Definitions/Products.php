<?php

namespace App\Cms\Definitions;

use Arturishe21\Cms\Services\Actions;
use App\Models\Product;
use Arturishe21\Cms\Fields\{Datetime, Id, Text};
use Arturishe21\Cms\Definitions\Resource;

class Products extends Resource
{
    public $model = Product::class;
    public $title = 'Product';
    protected $orderBy = 'priority asc';
    protected $isSortable = true;

    public function fields()
    {
        return [
            'test' => [
                Id::make('#', 'id')->sortable(),
                Text::make('Картинки111', 'title')->language(),
                Text::make('title', 'title')->filter()->sortable(),
                Textarea::make('description', 'description')->filter()->sortable(),
                
                Datetime::make('Дата создания', 'created_at')->filter()->sortable(),
            ],
        ];
    }


    public function actions()
    {
        return Actions::make()->insert()->update()->preview()->clone()->delete();
    }

}
