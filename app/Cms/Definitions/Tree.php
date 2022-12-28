<?php

namespace App\Cms\Definitions;

use App\Cms\Definitions\TemplatesTree\{Node, Contacts};
use Vis\Builder\Definitions\ResourceTree;
use Vis\Builder\Fields\Checkbox;
use Vis\Builder\Fields\File;
use Vis\Builder\Fields\Hidden;
use Vis\Builder\Fields\Select;
use Vis\Builder\Fields\Text;

class Tree extends ResourceTree
{
    public function fields(): array
    {
        return [
            Hidden::make('#', 'id'),
            Text::make('Заголовок', 'title')->language()->filter(),
            Select::make('Шаблон', 'template')->options($this->getTemplates())->filter(),
            Text::make('slug', 'slug')->transliteration('title', false),
            Checkbox::make('Активный', 'is_active'),
            //File::make('Картинка', 'picture_en')
        ];
    }

    public function templates()
    {
        return [
            'main' => Node::class,
            'contacts' => Contacts::class
        ];
    }
}
