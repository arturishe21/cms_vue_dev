<?php

namespace Arturishe21\Cms\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class TranslationsPhrases extends Model
{
    protected $table = 'translations_phrases';
    protected $guarded = ['id'];
    public $timestamps = false;

    protected $with = 'translations';

    public function translations(): HasMany
    {
        return $this->hasMany(Translations::class, 'id_translations_phrase');
    }
}
