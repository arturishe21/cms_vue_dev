<?php

namespace App\Cms\Definitions;

use Arturishe21\Cms\Services\Actions;
use App\Models\Article;
use Arturishe21\Cms\Fields\{Color,
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

class Comment extends Resource
{
    public string $model = \App\Models\Comment::class;
    public string $title = 'Комментарии';
    protected string $orderBy = 'priority asc';
    protected bool $isSortable = true;

    public function fields(): array
    {
        return [
            'test' => [
                Id::make('#', 'id')->sortable(),
                Text::make('Название', 'title'),
                Text::make('Описание', 'description'),
                Hidden::make('commentable_id', 'commentable_id')->onlyForm()->default(request('foreign_field_id')),
            ],
        ];
    }

    public function actions(): Actions
    {
        return Actions::make()->insert()->update()->preview()->delete()->clone();
    }

}
