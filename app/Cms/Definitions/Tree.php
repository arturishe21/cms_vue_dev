<?php

namespace App\Cms\Definitions;

use App\Cms\Definitions\TemplatesTree\{Node, Contacts};
use Arturishe21\Cms\Definitions\ResourceTree;
use Arturishe21\Cms\Fields\Checkbox;
use Arturishe21\Cms\Fields\Hidden;
use Arturishe21\Cms\Fields\Select;
use Arturishe21\Cms\Fields\Text;

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
