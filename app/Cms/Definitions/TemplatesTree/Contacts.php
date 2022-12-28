<?php

namespace App\Cms\Definitions\TemplatesTree;

use App\Cms\Definitions\Tree;
use Vis\Builder\Fields\{
    Select,
    Froala,
    Id,
    Text
};
use Vis\Builder\Fields\Textarea;

class Contacts extends Tree
{
    public string $title = 'Контакты';
    protected string $action = 'ContactsController@showPage';

    public function fields(): array
    {
        return [
            'test2' => [
                Id::make('#', 'id')->sortable(),

                Text::make('11', 'slug')
                    ->sortable(),

                Select::make('Шаблон', 'template')->options($this->getTemplates()),

                Textarea::make('Заголовок', 'description')
                    ->language()
                    ->sortable(),

            ],
        ];
    }
}
