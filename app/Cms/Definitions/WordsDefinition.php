<?php

namespace App\Cms\Definitions;

use App\Models\WordsDefinition as WordsDefinitionModel;
use Vis\Builder\Fields\{
    Id,
    Text};
use Vis\Builder\Definitions\Resource;

class WordsDefinition extends Resource
{
    public string $model = WordsDefinitionModel::class;
    public string $title = 'Описания';
    protected string $orderBy = 'priority asc';
    protected bool $isSortable = true;
    protected array $perPage = [3, 100, 1000];

    public function fields(): array
    {
        return [
            Id::make('#', 'id')->sortable(),
            Text::make('Заголовок1', 'title'),
            Text::make('description', 'description'),
        ];
    }

}
