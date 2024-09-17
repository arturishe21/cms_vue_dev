<?php

namespace Arturishe21\Cms\Fields\Custom;

use Arturishe21\Cms\Fields\Text;
use Arturishe21\Cms\Setting;
use Illuminate\Support\Facades\View;

class TextSetting extends Text
{
    public function getValueForList($definition)
    {
        $setting = Setting::find($this->getId());

        switch ($setting->type) {
            case 'text':
                return $setting->value;
            case 'text_with_languages':
                return $setting->t('value_languages');
            case 'textarea_with_languages':
                return __cms('Тектовое поле');
            case 'froala_with_languages':
                return __cms('Тектовое поле');;
            case 'file':
                $basename = basename($setting->file);
                return "<a href='{$setting->file}' target='_blank'>{$basename}</a>";
            case 'checkbox':
                return $setting->check ? __cms('Да') : __cms('Нет');
        }
    }

    public function getFieldForm($definition): View
    {
        $field = $this;

        return view('admin::form.fields.text', compact('definition', 'field'))->render();
    }
}
