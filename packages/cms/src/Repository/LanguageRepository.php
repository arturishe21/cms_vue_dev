<?php

namespace Arturishe21\Cms\Repository;

use Arturishe21\Cms\Libs\GoogleTranslateForFree;
use Arturishe21\Cms\Models\Language;
use Illuminate\Support\Collection;

class LanguageRepository extends BaseRepository
{
    public function getModelName(): string
    {
        return Language::class;
    }

    public function getArrayLanguages(): Collection
    {
       return $this->model->getLanguages()->pluck('language');
    }

    public function createNewTranslate(string $language, ?string $phrase): string
    {
        if (!$phrase) {
            return '';
        }

        return (new GoogleTranslateForFree())->translate(
            defaultLanguage(),
            $language,
            $phrase,
            2
        );
    }

    public function transformField(array $fieldArray): string
    {
        $fieldWithLanguage = [];
        foreach ($fieldArray as $language => $value) {
            $fieldWithLanguage[$language] = $value ?: $this->createNewTranslate($language, $fieldArray[defaultLanguage()]);
        }

        return json_encode($fieldWithLanguage);
    }
}