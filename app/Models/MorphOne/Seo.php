<?php

namespace App\Models\MorphOne;

use Illuminate\Database\Eloquent\Model;
use Vis\Builder\Fields\{Text, Textarea, Checkbox, Froala};
use Vis\Builder\Helpers\Traits\TranslateTrait;

class Seo extends Model
{
    use TranslateTrait;

    protected $table = 'seo';
    protected $guarded = [];
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
