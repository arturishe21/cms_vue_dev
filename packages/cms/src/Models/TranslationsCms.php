<?php

namespace Arturishe21\Cms\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;
use Arturishe21\Cms\Libs\GoogleTranslateForFree;

class TranslationsCms extends Model
{
    protected $table = 'translations_cms';
    public $timestamps = false;
    protected $guarded = ['id'];
}
