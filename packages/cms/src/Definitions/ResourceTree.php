<?php

namespace Arturishe21\Cms\Definitions;

use Arturishe21\Cms\Fields\{Hidden, Text, Checkbox, Select};
use App\Models\Tree;

class ResourceTree extends ResourceAdditionTree
{
    public string $model = Tree::class;
    public string $title = 'Структура сайта';

    public function fields(): array
    {
        return [
            Hidden::make('#', 'id'),
            Text::make('Заголовок', 'title')->language(),
            Select::make('Шаблон', 'template')->options($this->getTemplates()),
            Text::make('slug', 'slug'),// ->transliteration('title.ru', true),
            Checkbox::make('Активный', 'is_active'),
        ];
    }

    public function getTemplates(): array
    {
        $templatesModels = $this->templates();

        $templates = [
          //  '' => 'Выбрать'
        ];
        foreach ($templatesModels as $slug => $template) {
            $templates[$slug] = app($template)->title;
        }

        return $templates;
    }

    public function getFields(): array
    {
        return $this->getDefinitionThisTemplate()->fields();
    }

    protected function getDefinitionThisTemplate(): Resource|self
    {
        $template = $this->resolvedModel->template;

        if (!$template) {
            return $this;
        }

        return app($this->templates()[$template]);
    }

    public function getAction(): string
    {
        return $this->action;
    }

}
