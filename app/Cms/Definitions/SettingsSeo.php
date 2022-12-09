<?php

namespace App\Cms\Definitions;

use App\Models\Setting;
use Vis\Builder\Services\Actions;
use App\Models\Article;
use Vis\Builder\Fields\{Color,
    Froala,
    Hidden,
    ManyToManyAjax,
    MultiFile,
    MultiImage,
    Relations\Options,
    Select,
    Password,
    ForeignAjax,
    Id,
    Checkbox,
    Datetime,
    Image,
    File,
    Text,
    Definition,
    Textarea};
use Vis\Builder\Definitions\Resource;

class SettingsSeo extends Resource
{
    public $model = Setting::class;
    public $title = 'Настройки';
    protected $orderBy = 'id';

    public function fields()
    {
        return [
            Id::make('#', 'id')->sortable(),
            Text::make('Заголовок', 'title')->language(),
            Text::make('Slug', 'slug')->language(),
            Froala::make('Значение', 'value')->language()
        ];
    }
}
