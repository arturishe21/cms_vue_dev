<?php

namespace App\Cms\Definitions;

use Vis\Builder\Services\Actions;
use App\Models\Article;
use Vis\Builder\Fields\{Color,
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
use Vis\Builder\Definitions\Resource;

class Comment extends Resource
{
    public $model = \App\Models\Comment2::class;
    public $title = 'Комментарии';
    protected $orderBy = 'priority asc';
    protected $isSortable = true;

    public function fields()
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


    public function actions()
    {
        return Actions::make()->insert()->update()->preview()->delete()->clone();
    }

}
