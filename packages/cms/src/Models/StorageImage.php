<?php

namespace Arturishe21\Cms\Models;

use Illuminate\Database\Eloquent\Model;

class StorageImage extends Model
{
    protected $guarded = [];

    public function getPreviewAttribute($value)
    {
        return glide($this->path, ['w' => 150, 'h' => 120]);
    }
}
