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

class Authors extends Resource
{
    public $model = \App\Models\Author::class;
    public $title = 'Новости';

    protected $isSortable = true;
    protected $orderBy = 'priority asc';

    public function fields()
    {
        return [
            'test' => [
                Id::make('#', 'id')->sortable(),
                Text::make('ИМя', 'full_name')->language(),
            ],
        ];
    }


    public function actions()
    {
        return Actions::make()->insert()->update()->preview()->delete()->clone();
    }

}
