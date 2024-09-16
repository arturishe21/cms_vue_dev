<?php

namespace App\Cms\Definitions;

use App\Models\HasMany\NewsTest;
use App\Models\TestDefinition;
use Arturishe21\Cms\Definitions\Resource;
use Arturishe21\Cms\Fields\{Id, Text};
use Arturishe21\Cms\Revision;
use Arturishe21\Cms\Services\Actions;

class NewsTestDeifition extends Resource
{
    public string $model = NewsTest::class;
    public string $title = 'test';
    protected string $orderBy = 'priority asc';
    protected bool $isSortable = true;

    public function fields()
    {
        return [
            'test' => [
                Id::make('#', 'id')->sortable(),
               // Hidden::make('news_id', 'news_id')->onlyForm()->default(request('foreign_field_id')),
                Text::make('title' ,'title')->filter(),
            ],
        ];
    }


    public function actions(): Actions
    {
        return Actions::make();
    }

}
