<?php

namespace App\Cms\Definitions;

use App\Models\HasMany\NewsTest;
use Arturishe21\Cms\Definitions\Resource;
use Arturishe21\Cms\Fields\{Id, Text};
use Arturishe21\Cms\Services\Actions;

class NewsTestDeifition extends Resource
{
    public string $model = NewsTest::class;
    public string $title = 'test';
    protected string $orderBy = 'priority asc';
    protected bool $isSortable = true;

    public function fields(): array
    {
        return [
            'test' => [
                Id::make('#', 'id')->sortable(),
                Text::make('title' ,'title')->filter(),
            ],
        ];
    }


    public function actions(): Actions
    {
        return Actions::make();
    }

}
