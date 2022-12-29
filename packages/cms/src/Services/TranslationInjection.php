<?php

namespace Arturishe21\Cms\Services;

use Illuminate\Database\Eloquent\Model;
use Arturishe21\Cms\Models\{TranslationsPhrasesCms, TranslationsPhrases};

class TranslationInjection
{
    public Model $model;

    public function __construct($table, $id = null)
    {
        $this->model = match ($table) {
            'translations-cms' => $id ? TranslationsPhrasesCms::find($id) : new TranslationsPhrasesCms(),
            'translations' => $id ? TranslationsPhrases::find($id) : new TranslationsPhrases(),
        };
    }
}