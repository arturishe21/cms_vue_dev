<?php

namespace App\Cms\Definitions\TemplatesTree;

use App\Cms\Definitions\Tree;
use Arturishe21\Cms\Fields\{Definition, File, Froala, Id, Image, Text, Checkbox, Select};
use Arturishe21\Cms\Services\ButtonExample;
use Arturishe21\Cms\Services\Export;
use Arturishe21\Cms\Services\Import;

class Node extends Tree
{
    public string $title = 'Главный';
    public string $action = 'ContactsController@showPage';

    public function fields(): array
    {
        return [
            'test1' => [
                Id::make('#', 'id')->sortable(),
                Text::make('Заголовок', 'title')->language(),
                Select::make('Шаблон', 'template')->options($this->getTemplates()),
                Text::make('slug', 'slug'),
                Checkbox::make('Активный', 'is_active'),
                File::make('Картинка', 'picture_en')
            ],
        ];
    }

    public function buttons(): array
    {
        return [
            Export::class,
            Import::class,
            ButtonExample::class
        ];
    }
}
