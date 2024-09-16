<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Arturishe21\Cms\Models\BaseModel;

class Comment extends BaseModel
{
    public function product(): BelongsTo
    {
        return $this->belongsTo(Product::class);
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function ratingPercent(): float
    {
        return ($this->rating / 5) * 100;
    }
}
