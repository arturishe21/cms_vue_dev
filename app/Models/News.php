<?php

namespace App\Models;

class News extends BaseModel
{
    protected $table = 'news';
    protected $fillable = [];

    public function banners()
    {
        return $this->hasMany(Banner::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
