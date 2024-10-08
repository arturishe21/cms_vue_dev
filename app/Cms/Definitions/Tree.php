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
            Select::make('Шаблон1', 'template')->options($this->getTemplates())->filter()->fastEdit(),
            Text::make('slug', 'slug')->transliteration('title', false),
            Checkbox::make('Активный', 'is_active')->fastEdit(),
        ];
    }

    public function templates(): array
    {
        return [
            'main' => Node::class,
            'contacts' => Contacts::class
        ];
    }
}
