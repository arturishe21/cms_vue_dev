<?php

namespace App\Cards;

use App\Models\Order;
use App\Models\User;
use Vis\Builder\Services\Trend;

class ChartUser extends Trend
{
    public $title = 'Count new users';
    protected $defaultCountDays = 1000;

    public function calculate()
    {
        return $this->countByDays(Order::class, 'id');
    }
}
