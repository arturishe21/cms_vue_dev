<?php
namespace App\Fields;

use Vis\Builder\Fields\Foreign;

class ForeignTree extends Foreign
{

    public function getFieldForm($definition)
    {
        $field = $this;
        $nameField = $this->getClassNameString();

        if ($this->getLanguage()) {
            $nameField .= '_lang';
        }

        return view('new.form.fields.' . $nameField, compact('definition', 'field'))->render();
    }

    public function getOptions($definition)
    {
        $modelRelated = $definition->model()->{$this->options->getRelation()}()->getRelated();
        $nodes = $modelRelated::defaultOrder()->get()->toTree();
        $data = [];

        $traverse = function ($categories, $prefix = '-') use (&$traverse, &$data) {
            foreach ($categories as $category) {
                $data[$category->id] = $prefix . ' ' . $category->title;
                $traverse($category->children, $prefix . '-');
            }
        };

        $traverse($nodes);

        return $data;
    }

    public function getValueForList($definition)
    {
        $modelRelated = $definition->model()->{$this->options->getRelation()}()->getRelated();

        if (!$this->value) {
            return;
        }

        $treeValueThis = $modelRelated::find($this->value);

        $recurce = $treeValueThis->getAncestorsAndSelf();

        $collection = [];
        foreach ($recurce as $tree) {
            $collection[] = $tree->title ;
        }

        return implode(' / ', $collection);
    }
}
