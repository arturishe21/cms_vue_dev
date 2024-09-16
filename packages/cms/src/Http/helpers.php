<?php

use Arturishe21\Cms\Models\TranslationsCms;
use Arturishe21\Cms\Models\TranslationsPhrasesCms;
use Arturishe21\Cms\Models\Language;
use Illuminate\Support\Facades\Cache;
use App\Cms\Definitions\Settings;
use Illuminate\Support\Facades\App;
use Arturishe21\Cms\Services\Translate;

if (! function_exists('defaultLanguage')) {

    function defaultLanguage() : ?string
    {
        try {
            $defaultLanguage = Language::getDefaultLanguage();

            if ($defaultLanguage) {
                return Language::getDefaultLanguage()->language;
            }

        } catch (\Exception $e) {
            config('app.locale');
        }

        return config('app.locale');
    }
}

if (! function_exists('languagesOfSite')) {

    function languagesOfSite()
    {
        return (new Language())->getLanguages()->pluck('language');
    }
}

if (! function_exists('setting')) {

    function setting(string $slug)
    {
        return Cache::tags('settings')->rememberForever($slug . App::getLocale(), function() use ($slug) {
            return app(Settings::class)->model()->getValue($slug);
        });
    }
}


if (! function_exists('filesize_format')) {

    function filesize_format($bytes)
    {
        if ($bytes >= 1073741824) {
            $bytes = number_format($bytes / 1073741824, 1, '.', '').' Gb';
        } elseif ($bytes >= 1048576) {
            $bytes = number_format($bytes / 1048576, 1, '.', '').' Mb';
        } elseif ($bytes >= 1024) {
            $bytes = number_format($bytes / 1024, 1, '.', '').' Kb';
        } elseif ($bytes > 1) {
            $bytes = $bytes.' bytes';
        } elseif ($bytes == 1) {
            $bytes = $bytes.' byte';
        } else {
            $bytes = '0 bytes';
        }

        return $bytes;
    }
}

if (! function_exists('settingForMail')) {

    function settingForMail(string $value): array
    {
        return array_map('trim', explode(',', setting($value)));
    }
}

if (! function_exists('print_arr')) {
    function print_arr($array)
    {
        echo '<pre>';
        print_r($array);
        echo '</pre>';
    }
}

if (! function_exists('glide')) {

    function glide($source, array $options = [])
    {
        if (
            env('IMG_PLACEHOLDER', true)
            && (env('APP_ENV') === 'local' || env('APP_ENV') === 'testing')
        ) {
            $width = $options['w'] ?? 100;
            $height = $options['h'] ?? 100;

            return "//via.placeholder.com/{$width}x{$height}";
        }

        return (new Arturishe21\Cms\Libs\Img())->get($source, $options);
    }
}

if (! function_exists('geturl')) {
    function geturl( string $url, $locale = false, array $attributes = []) : string
    {
        if (! $locale) {
            $locale = App::getLocale();
        }

        return LaravelLocalization::getLocalizedURL($locale, $url, $attributes);
    }
}

if (! function_exists('__cms')) {
    function __cms($phrase): ?string
    {
        return $phrase;

        $thisLang = Cookie::get('lang_admin', config('builder.translations.cms.language_default'));

        $arrayTranslate = TranslationsPhrasesCms::fillCacheTrans();

        if (!isset($arrayTranslate[$phrase][$thisLang])) {
            if ($phrase) {
                (new TranslationsCms())->createNewTranslate($phrase);
            }
        }

        return $arrayTranslate[$phrase][$thisLang] ?? $phrase;
    }
}

if (! function_exists('__t')) {
    function __t(string $phrase, array $replacePhrase = []): ?string
    {
        return (new Translate())->returnPhrase($phrase, $replacePhrase);
    }
}