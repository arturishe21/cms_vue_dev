<?php

namespace Arturishe21\Cms\Models;

use Illuminate\Database\Eloquent\Model;

class TranslationsCms extends Model
{
    protected $table = 'translations_cms';
    public $timestamps = false;
    protected $guarded = ['id'];
}
