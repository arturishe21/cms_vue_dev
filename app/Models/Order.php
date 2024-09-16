<?php

namespace App\Models;

use App;
use Arturishe21\Cms\Models\BaseModel;

class Order extends BaseModel
{
    protected $table = 'orders';

    public function getUrl(): string
    {
        return asset('/admin/orders?id=' . $this->id);
    }

}
