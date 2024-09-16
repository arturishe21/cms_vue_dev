<?php

namespace Arturishe21\Cms\Models;

use Arturishe21\Cms\Traits\Rememberable;

class Language extends BaseModel
{
    use Rememberable;

    protected $table = 'languages';
    public $timestamps = false;
    private array $supportedLocales;

    public function __construct()
    {
        $this->supportedLocales = config('laravellocalization.supportedLocales');
    }

    public function getName(): string
    {
        return $this->supportedLocales[$this->language]['name'] ?? '';
    }

    public function supportedLocales(): array
    {
        $result = [];

        foreach ($this->supportedLocales as $key => $info) {
            $result[$key] = $info['name'];
        }

        return $result;
    }

    public static function getDefaultLanguage(): self
    {
        return self::active()->orderPriority()
            ->rememberForever()->cacheTags(['languages'])
            ->first();
    }

    public function getLanguages()
    {
        return $this->active()->orderPriority()
            ->rememberForever()->cacheTags(['languages'])
            ->get();
    }
}
