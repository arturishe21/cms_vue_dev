<?php

namespace App\Cards;

use App\Models\User;
use Vis\Builder\Services\Value;

class AvgUsers extends Value
{
    public $title = 'Average performance';

    public function calculate()
    {
        return $this->avg(User::class, 'id');
    }
}
