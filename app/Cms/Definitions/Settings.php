<?php

namespace App\Cms\Definitions;

use Arturishe21\Cms\Fields\{Checkbox, File, ForeignAjax, Froala, Hidden, Id, Select, Text, Relations\Options, Textarea};
use Arturishe21\Cms\Definitions\Resource;
use Illuminate\Validation\Rule;
use Arturishe21\Cms\Fields\Custom\TextSetting;
use App\Models\Setting;

class Settings extends Resource
{
    public string $model = Setting::class;
    public string $title = 'Настройки';
    protected string $orderBy = 'id desc';

    public function fields(): array
    {
        return [
            Id::make('#', 'id')->sortable(),
            Hidden::make('group', 'group')->default('general'),
            Text::make('Заголовок', 'title')->filter()->sortable()
                ->transliteration('slug', true),
            Text::make('Код для вставки', 'slug')->filter()->sortable()
                ->rules([
                    'required',
                    Rule::unique('settings')->ignore(request('id')),
                ])
            ,
            Select::make('Тип', 'type')
                ->options([
                    'text' => 'Текст',
                    'text_with_languages' => 'Текст с переводами',
                    'textarea_with_languages' => 'Большой текст с переводами',
                    'froala_with_languages' => 'Текстовый редактор с переводами',
                    'file' => 'Файл',
                    'checkbox' => 'Вкл/Выкл',
                ])->action(),

         /*   TextSetting::make('Значение', 'value')
                ->className('text'),*/

            Text::make('Значение', 'value')->language()
                ->className('text_with_languages'),

            Textarea::make('Значение', 'textarea')->language()->onlyForm()
                ->className('textarea_with_languages'),

            Froala::make('Значение', 'froala')
                ->onlyForm()
                ->language()
                ->className('froala_with_languages'),

            File::make('Значение', 'file')->onlyForm()
                ->className('file')
                ->noFileSelection()
            ,

            Checkbox::make('Значение', 'check')->onlyForm()
                ->className('checkbox'),
        ];
    }
}
