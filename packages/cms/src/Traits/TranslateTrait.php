<?php

namespace Arturishe21\Cms\Traits;

use Illuminate\Support\Facades\App;

trait TranslateTrait
{
    public function t($ident)
    {
        $fieldArray = json_decode($this->$ident);
        $lang = App::getLocale();

        return $fieldArray->$lang ?? '';
    }
}
