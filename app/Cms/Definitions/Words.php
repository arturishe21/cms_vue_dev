<?php

namespace App\Cms\Definitions;

use App\Models\Word;
use Carbon\Carbon;
use Vis\Builder\Services\Actions;
use Vis\Builder\Fields\{Date,
    Foreign,
    Froala,
    Id,
    Checkbox,
    Image,
    File,
    MultiFile,
    Select,
    Text,
    MultiSelect,
    Definition,
    ManyToManyMultiSelect};
use Vis\Builder\Definitions\Resource;
use Vis\Builder\Fields\Relations\Options;
use Vis\Builder\Services\Export;

class Words extends Resource
{
    public string $model = Word::class;
    public string $title = 'Слова';

    public function fields(): array
    {
        return [
            Id::make('#', 'id')->sortable(),
/*
            Text::make('Заголовок', 'title')
                ->filter()
                ->language()
                ->transliteration('link', true)
            ,*/
          //  Froala::make('Описание', 'description')->filter()->language(),
            MultiFile::make('Файл mp3', 'sound'),
            File::make('Картинка', 'title_ru')->accept('ss'),
            Image::make('Картинка', 'sound_en'),

            Select::make('Select', 'link')
                ->options([
                    'test' => 'тест',
                    'test1' => 'test1'
                ])
                ->sortable()->filter(),

            Checkbox::make('Активно', 'is_active')->filter()->fastEdit()->hide(true),
            Date::make('created_at', 'created_at')->filter()->default(Carbon::now()),

            Definition::make('Дефинишен')
                ->hasMany('definitionTest', WordsDefinition::class),

          /*  ManyToManyMultiSelect::make('Группа')->options(
                (new Options('groups'))->keyField('slug')
            ),*/
           /* Foreign::make('User', 'author_id')
                ->saveOnChange()
                ->options((new Options('author')))*/
                    /*->keyField('full_name')->isJson())*/
        ];
    }

    public function buttons(): array
    {
        return [
            Export::class,
        ];
    }


}
