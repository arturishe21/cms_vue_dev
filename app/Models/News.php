<?php

namespace App\Models;

use App\Models\HasMany\NewsTest;
use Illuminate\Database\Eloquent\Relations\MorphOne;
use App\Models\MorphOne\Seo;
use Arturishe21\Cms\Models\BaseModel;

class News extends BaseModel
{
    protected $table = 'news';
    protected $fillable = [];

    public function seo(): MorphOne
    {
        return $this->morphOne(Seo::class, 'seo');
    }

    public function params()
    {
        return $this->hasMany(NewsTest::class, 'news_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

}
