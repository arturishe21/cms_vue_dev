<?php

namespace App\Cms\Definitions;

use Arturishe21\Cms\Definitions\Resource;
use Arturishe21\Cms\Fields\{Checkbox,
    Custom,
    Datetime,
    Definition,
    ForeignAjax,
    Froala,
    Id,
    Image,
    Relations\Options,
    Text};
use Arturishe21\Cms\Services\Actions;

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
                Text::make('Заголовок', 'title')->language()->sortable()->filter(),

                ForeignAjax::make('Пользователь', 'user_id')
                    ->options(
                        (new Options('user'))->keyField('email'))
                    ->filter()->fastEdit()
                ,

                Datetime::make('created', 'created_at')->filter(),

                Checkbox::make('Активно', 'is_active')->sortable()->filter()->fastEdit(),
                Froala::make('text', 'text')->filter(),
                Custom::make('Заголовок55'),
                Image::make('picture', 'picture'),
                Definition::make('test')->hasMany('params', NewsTestDeifition::class)

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
