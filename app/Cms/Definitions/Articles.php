<?php

namespace App\Cms\Definitions;

use Illuminate\Database\Eloquent\Model;
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
    SelectWithPicture,
    Password,
    ForeignAjax,
    Id,
    Checkbox,
    Datetime,
    Image,
    File,
    Text,
    Definition,
    ManyToManyMultiSelect,
    Textarea};
use Vis\Builder\Definitions\Resource;

class Articles extends Resource
{
    public $model = Article::class;
    public $title = 'Статьи';
    protected $orderBy = 'priority asc';
    protected $isSortable = true;

    public function cards()
    {
        return [
            \App\Cards\ChartOrders::class
        ];
    }

    public function fields(): array
    {
        return [
            'test' => [
                Id::make('#', 'id')->sortable(),

                Select::make('select2', 'select2')->options([
                    'tt' => 'tt',
                    'tt11' => 'tt11'
                ])->actionSelect('select'),

                SelectWithPicture::make('select', 'select')->options([
                    '' => [
                        'value' => 'Выбрать',
                    ],
                    'title2' => [
                        'value' => 'title2',
                        'data-img' => glide('/img/asdasdasd.jpeg', ['w'=> 700]),
                        'data-class' => 'tt'
                    ],
                    'picture' => [
                        'value' => 'picture',
                        'data-img' => '/img/test2.jpg',
                        'data-class' => 'tt11'
                    ],
                    'picture2' => [
                        'value' => 'picture',
                        'data-img' => '/img/test2.jpg',
                    ]
                ])->action(),

              //  File::make('файл', 'title'),

                MultiImage::make('picture', 'picture'),

            //    Froala::make('description', 'description')->language(),
              //  MultiFile::make('Картинки111', 'picture'),
           //     Checkbox::make('Checkbox', 'checkbox')->filter(),
                Datetime::make('Datetime', 'created_at')->filter()->sortable(),
                ManyToManyMultiSelect::make('Статьи')
                    ->options(
                        (new Options('trees'))
                            ->where('parent_id', '=', '1')
                            ->orderBy('created_at', 'asc')
                    ),
                ForeignAjax::make('Дерево', 'tree_id')
                    ->filter()
                    ->options(
                        (new Options('trees2'))
                            ->where('parent_id', '=', '1')
                            ->orderBy('created_at', 'asc')
                    ),

            ],
            'test2' => [
                Definition::make('Новости')->hasMany('news', News::class)
            ]

        ];
    }
    

    public function actions()
    {
        return Actions::make()->insert()->update()->preview()->revisions()->delete()->clone();
    }

}
