<?php

namespace App\Cms\Definitions;

use Vis\Builder\Fields\Date;
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
    Number,
    Textarea};
use Vis\Builder\Definitions\Resource;
use Carbon\Carbon;

class News extends Resource
{
    public $model = \App\Models\News::class;
    public string $title = 'Новости';

    public function fields(): array
    {
        return [
            Id::make('#', 'id')->sortable(),
            Textarea::make('Заголовок', 'title')->sortable(),

            ForeignAjax::make('Пользователь', 'user_id')
                ->options(
                    (new Options('user'))->keyField('email')),

            Checkbox::make('Активно', 'is_active')->sortable(),
           // Froala::make('Заголовок2', 'description2')->language()
        ];
    }

    public function actions(): Actions
    {
        return Actions::make()->insert()->update()->preview()->delete()->clone();
    }

}
