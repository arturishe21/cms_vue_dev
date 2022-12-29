<?php

namespace Arturishe21\Cms\Fields;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;
use phpDocumentor\Reflection\Types\Parent_;

class Froala extends Field
{
    private $toolbar = "fullscreen, bold, italic, underline, strikeThrough, subscript, superscript, fontFamily, fontSize,  color, emoticons, inlineStyle, paragraphStyle,  paragraphFormat, align, formatOL, formatUL, outdent, indent, quote, insertHR, insertLink, insertImage, insertVideo, insertFile, insertTable, undo, redo, clearFormatting, selectAll, html";
    private $options = '';

    public function toolbar($value)
    {
        $this->toolbar = $value;

        return $this;
    }

    public function options($collection)
    {
        $this->options = $collection;

        return $this;
    }

    public function getToolbar()
    {
        return $this->toolbar;
    }

    public function getOptions()
    {
        return json_encode($this->options);
    }

    public function getValueForList(Model $model): ?string
    {
        $value = parent::getValueForList($model);
        /*$value = json_decode(parent::getValueForList($model));

        $value = $value->{$this->locale} ?? $this->getValue();*/

        return  Str::limit(strip_tags($value), 70);
    }
}
