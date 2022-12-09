<?php

namespace App\Cms\Definitions;

use App\Models\WordsDefinition as WordsDefinitionModel;
use Vis\Builder\Fields\{Color,
    Datetime,
    ForeignAjax,
    Froala,
    Id,
    Hidden,
    Foreign,
    Image,
    File,
    Readonly,
    Text,
    Definition};
use Vis\Builder\Definitions\Resource;

class WordsDefinition extends Resource
{
    public $model = WordsDefinitionModel::class;
    public $title = 'Описания';
    protected $orderBy = 'priority desc';
    protected $perPage = [10, 100, 1000];

    public function fields()
    {
        return [
            Id::make('#', 'id')->sortable(),
            Text::make('Заголовок', 'title'),
            Text::make('description', 'description'),
        ];
    }

}
