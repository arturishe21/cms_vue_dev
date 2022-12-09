<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Setting extends Model
{
    use \Vis\Builder\Helpers\Traits\TranslateTrait;

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
