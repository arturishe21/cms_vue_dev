<?php

namespace App\Cms\Definitions;

use Litvin\Redirectmap\Models\RedirectMap;
use Arturishe21\Cms\Services\Actions;
use Arturishe21\Cms\Fields\{Id, Select, Text};
use Arturishe21\Cms\Definitions\Resource;
use Litvin\Redirectmap\Service\Import;

class Redirects extends Resource
{
    public $model = RedirectMap::class;
    public $title = 'Редиректы';
    protected $orderBy = 'id desc';
    public function fields()
    {
        return [
            Id::make('#', 'id')->sortable(),
            Text::make('Старая ссылка', 'old_link')->filter(),
            Text::make('Новая ссылка', 'new_link')->filter(),
            Select::make('Статус', 'status')
                ->options([
                    '301' => '301',
                    '302' => '302',
                ])
            ->filter(),
        ];
    }

    public function actions()
    {
        return Actions::make()->insert()->update()->delete();
    }
    public function buttons()
    {
        return [
            Import::class,
        ];
    }
}
