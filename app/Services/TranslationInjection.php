<?php

namespace App\Services;

use Vis\Builder\Models\{TranslationsPhrasesCms, TranslationsPhrases};

class TranslationInjection
{
    public $model;

    public function __construct($table, $id = null)
    {
        $this->model = match ($table) {
            'translations-cms' => $id ? TranslationsPhrasesCms::find($id) : new TranslationsPhrasesCms(),
            'translations' => $id ? TranslationsPhrases::find($id) : new TranslationsPhrases(),
        };
    }
}