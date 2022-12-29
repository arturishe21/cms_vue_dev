<?php

namespace Arturishe21\Cms\Definitions;

use App\Models\Tree;
use Illuminate\Support\Arr;
use Arturishe21\Cms\Fields\{Hidden, Text};

class BaseTree extends ResourceAdditionTree
{
    protected $model = Tree::class;
    public $title = 'Структура сайта';
    public $component = 'tree';

    public function fields()
    {
        return [
            Hidden::make('#', 'id'),
            Text::make('Заголовок', 'title')->language(),

            Text::make('Внутренняя ссылка', 'url'),
            //   Text::make('Внешняя ссылка', 'url_external')->language(),
            //  Checkbox::make('Открывать в новой вкладке', 'is_target_blank')
        ];
    }

    public function getTemplates() : array
    {
        $templatesModels = $this->filterTemplates($this->templates());

        $templates = [];
        foreach ($templatesModels as $slug => $template) {
            $templates[$slug] = (new $template())->getTitleDefinition();
        }

        return $templates;
    }

    public function getTitleDefinition(string $template)
    {
        if (isset($this->templates()[$template])) {

            $classDefinition = $this->templates()[$template];

            return (new $classDefinition())->getTitleDefinition();
        }
    }

    private function filterTemplates($templatesModels)
    {
        $idNode = request('node', 1);
        $info = $this->model::find($idNode);
        $thisTemplate = $info->template;

        $showTemplateForThisNode = (new $templatesModels[$thisTemplate]())->showTemplate();

        if ($showTemplateForThisNode) {
            $templatesModels = Arr::only($templatesModels, $showTemplateForThisNode);
        }

        return $templatesModels;
    }

    public function clearCache()
    {
        $this->model()->clearCache();
    }

}
