<?php

namespace App\Models\HasMany;

use Illuminate\Database\Eloquent\Relations\MorphOne;
use App\Models\MorphOne\Seo;
use Arturishe21\Cms\Models\BaseModel;

class NewsTest extends BaseModel
{
    protected $table = 'news_test';
    protected $guarded = [];
}
