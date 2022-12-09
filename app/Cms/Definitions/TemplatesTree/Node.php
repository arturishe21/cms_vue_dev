<?php

namespace App\Cms\Definitions\TemplatesTree;

use App\Cms\Definitions\Tree;
use Vis\Builder\Fields\{Definition, File, Froala, Id, Image, Text, Checkbox, Select};
use Vis\Builder\Services\ButtonExample;
use Vis\Builder\Services\Export;
use Vis\Builder\Services\Import;

class Node extends Tree
{
    public string $title = 'Главный';
    public string $action = 'ContactsController@showPage';

    public function fields(): array
    {
        return [
            'test' => [
                Id::make('#', 'id')->sortable(),
                Text::make('Заголовок', 'title')->language(),
                Select::make('Шаблон', 'template')->options($this->getTemplates()),
                Text::make('slug', 'slug'),
                Checkbox::make('Активный', 'is_active'),
                File::make('Картинка', 'picture')->uploadPath('/')
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
