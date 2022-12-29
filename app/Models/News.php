<?php

namespace App\Models;

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

    public function banners()
    {
        return $this->hasMany(Banner::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
