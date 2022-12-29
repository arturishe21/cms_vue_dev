<?php

namespace App\Cms\Definitions;

use Arturishe21\Cms\Services\Actions;
use App\Models\Article;
use Arturishe21\Cms\Fields\{Color,
    Date,
    Froala,
    Hidden,
    ManyToManyAjax,
    MultiFile,
    MultiImage,
    Relations\Options,
    Select,
    Password,
    ForeignAjax,
    Id,
    Checkbox,
    Datetime,
    Image,
    File,
    Text,
    Definition,
    Textarea};
use Arturishe21\Cms\Definitions\Resource;

class Authors extends Resource
{
    public string $model = \App\Models\Author::class;
    public string $title = 'Новости';

    protected bool $isSortable = true;
    protected string $orderBy = 'priority asc';

    public function fields(): array
    {
        return [
            'test' => [
                Id::make('#', 'id')->sortable(),
                Text::make('ИМя', 'full_name')->language()->filter(),
                Date::make('created_at', 'created_at')->filter()
            ],
        ];
    }


    public function actions(): Actions
    {
        return Actions::make()->insert()->update()->preview()->delete()->clone();
    }

}
