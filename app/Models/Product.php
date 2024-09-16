<?php

namespace App\Models;

use Arturishe21\Cms\Models\BaseModel;

class Product extends BaseModel
{
    protected $table = 'products';
    protected $guarded = [];
    protected $with = ['labels', 'status'];
}
