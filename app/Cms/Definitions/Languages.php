<?php

namespace App\Cms\Definitions;

use Arturishe21\Cms\Services\Actions;
use Arturishe21\Cms\Models\Language;
use Arturishe21\Cms\Fields\{Checkbox, Id, Select};
use Arturishe21\Cms\Definitions\Resource;

class Languages extends Resource
{
    public string $model = Language::class;
    public string $title = 'Языки сайта';
    protected string $orderBy = 'priority asc';
    protected bool $isSortable = true;

    public function fields(): array
    {
        return [
            Id::make('#', 'id')->sortable(),
            Select::make('Язык', 'language')
                ->options($this->model()->supportedLocales()),
            Checkbox::make('Активен', 'is_active'),
        ];
    }

    public function actions(): Actions
    {
        return Actions::make()->insert();
    }

}
