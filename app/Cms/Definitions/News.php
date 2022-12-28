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
    public string $model = \App\Models\News::class;
    protected bool $isSortable = true;
    public string $title = 'Новости';
    protected string $orderBy = 'id desc';

    public function fields(): array
    {
        return [
            'main' => [
                Id::make('#', 'id')->sortable(),
                Text::make('Заголовок', 'title')->sortable()->filter(),

                ForeignAjax::make('Пользователь', 'user_id')
                    ->options(
                        (new Options('user'))->keyField('email'))
                    ->filter()
                ,

                Datetime::make('created', 'created_at')->filter(),

                Checkbox::make('Активно', 'is_active')->sortable()->filter(),
                Froala::make('Заголовок2', 'picture')->filter()
            ],

            'SEO' => [
                Text::make('Seo title', 'seo_title')
                    ->language()
                    ->morphOne('seo')
                    ->onlyForm(),
               /* Textarea::make('Seo description', 'seo_description')
                 //   ->language()
                    ->morphOne('seo')
                    ->onlyForm(),
                Text::make('Seo keywords', 'seo_keywords')
                  //  ->language()
                    ->morphOne('seo')
                    ->onlyForm(),*/
                /*Checkbox::make('Seo noindex', 'is_seo_noindex')
                    ->onlyForm()
                    ->morphOne('seo'),*/
            ]
        ];
    }

    public function actions(): Actions
    {
        return Actions::make()->insert()->update()->preview()->revisions()->delete()->clone();
    }

}
