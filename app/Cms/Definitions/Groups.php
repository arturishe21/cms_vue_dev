<?php

namespace App\Cms\Definitions;

use App\Models\Group;
use Arturishe21\Cms\Services\Actions;
use Arturishe21\Cms\Fields\{
    Id,
    Text,
    Permissions
};

use Arturishe21\Cms\Definitions\Resource;

class Groups extends Resource
{
    public string $model = Group::class;
    public string $title = 'Группы';

    public function fields(): array
    {
        return [
            'Общая' => [
                Id::make('#', 'id')->sortable(),
                Text::make('Имя', 'slug')->filter(),
                Text::make('Название', 'name')->filter(),
            ],
            'Права доступа' => [
                Permissions::make('Доступы', 'permissions')->onlyForm(),
            ]
        ];
    }

    public function actions(): Actions
    {
        return Actions::make()->insert()->update()->delete();
    }
}
