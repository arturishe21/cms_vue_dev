<?php

namespace Arturishe21\Cms\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\App;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;
use Arturishe21\Cms\Traits\{TranslateTrait, SeoTrait, ImagesTrait, QuickEditTrait, Rememberable};
use Venturecraft\Revisionable\RevisionableTrait;

class BaseModel extends Model
{
    use TranslateTrait,
        SeoTrait,
        ImagesTrait,
        QuickEditTrait,
        RevisionableTrait,
        Rememberable;

    protected $guarded = ['id'];

    protected array $revisionFormattedFieldNames = [
        'title'  => 'Название',
        'description'  => 'Описание',
        'is_active' => 'Активация',
        'picture' => 'Изображение',
        'short_description' => 'Короткий текст',
        'created_at' => 'Дата создания',
    ];
    protected array $revisionFormattedFields = [
        '1'  => 'string:<strong>%s</strong>',
        'public' => 'boolean:No|Yes',
        'deleted_at' => 'isEmpty:Active|Deleted',
    ];

    protected bool $revisionCleanup = true;
    protected bool $revisionCreationsEnabled = true;
    protected bool $revisionEnabled = true;
    protected int $historyLimit = 500;

    public function getSlug(): string
    {
        return Str::slug(strip_tags($this->title));
    }

    public function getUrl(): string
    {
        return geturl($this->getUri());
    }

    public function getUrlPreview(): string
    {
        return $this->getUrl() . '?show=1';
    }

    public function getUri(): string
    {
        return '/news/' . $this->getSlug() . '-' .$this->id;
    }

    public static function scopeActive(Builder $query): Builder
    {
        return $query->where('is_active', '1');
    }

    public static function scopeOrderPriority(Builder $query): Builder
    {
        return $query->orderBy('priority', 'asc');
    }
}
