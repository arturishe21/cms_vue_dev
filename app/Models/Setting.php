<?php

namespace App\Models;

use Arturishe21\Cms\Models\BaseModel;

class Setting extends BaseModel
{
    protected $table = 'settings';
    protected $fillable = [];
    public $timestamps = false;

    public function getValue(string $slug)
    {
        $setting = $this->whereSlug($slug)->first();

        if ($setting) {

            switch ($setting->type) {
                case 'text':
                    return $setting->value;
                case 'text_with_languages':
                    return $setting->t('value_languages');
                case 'file':
                    return $setting->file;
                case 'check':
                    return $setting->check;
            }

        }
    }
}
