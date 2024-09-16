<?php

namespace App\Models;

use Arturishe21\Cms\Models\BaseModel;

class OrderProducts extends BaseModel
{
    protected $table = 'order_products';
    protected $fillable = [];
    protected $guarded = [];
    public $timestamps = false;

    public function order()
    {
        return $this->belongsTo(Order::class);
    }

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function options()
    {
        return $this->hasMany(OrderProductOption::class);
    }
}
