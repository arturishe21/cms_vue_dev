<?php

namespace App\Models\MorphOne;

use Arturishe21\Cms\Models\BaseModel;
use Vis\Builder\Fields\{Text, Textarea, Checkbox, Froala};

class Seo extends BaseModel
{
    protected $table = 'seo';
    protected $guarded = ['id'];
    public $timestamps = false;

    public static function fieldsForDefinitions()
    {
        return [
            Text::make('Seo title', 'seo_title')
                ->language()
                ->morphOne('seo')
                ->onlyForm(),
            Textarea::make('Seo description', 'seo_description')
                ->language()
                ->morphOne('seo')
                ->onlyForm(),
            Froala::make('Seo текст', 'seo_text')
                ->language()
                ->morphOne('seo')
                ->onlyForm(),
            Text::make('Seo keywords', 'seo_keywords')
                ->language()
                ->morphOne('seo')
                ->onlyForm(),
            Checkbox::make('Seo noindex', 'is_seo_noindex')
                ->onlyForm()
                ->morphOne('seo'),
        ];
    }
}
