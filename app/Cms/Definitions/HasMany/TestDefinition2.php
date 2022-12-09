<?php

namespace App\Cms\Definitions\HasMany;

use App\Models\TestDefinition;
use Vis\Builder\Services\Actions;
use Vis\Builder\Revision;
use Vis\Builder\Fields\{Hidden, Id, Datetime, Text, SelectWithPicture, Definition, Textarea};
use Vis\Builder\Definitions\Resource;

class TestDefinition2 extends Resource
{
    public $model = TestDefinition::class;
    public $title = 'test';
    protected $orderBy = 'priority asc';
    protected $isSortable = true;

    public function fields()
    {
        return [
            'test' => [
                Id::make('#', 'id')->sortable(),
                Hidden::make('tb_tree_id', 'tb_tree_id')->onlyForm()->default(request('foreign_field_id')),
                Text::make('title' ,'title')->filter(),
                SelectWithPicture::make('Шаблон', 'type')->options([
                    'banner' => [
                        'value' => 'Баннер',
                        'data-img' => glide('/img/blocks_with_img.png',['w' => 700 ,'h' => 400])
                    ],
                    'breadcrumbs' => [
                        'value' => 'Хлебные крошки',
                        'data-img' => '/img/test2.jpg'
                    ]
                ])->action(),
                Definition::make('ddd222')->hasMany('test2', TestDefinition3::class),
                Textarea::make('description', 'description')->className('breadcrumbs'),
            ],
        ];
    }


    public function actions()
    {
        return Actions::make();
    }

}
