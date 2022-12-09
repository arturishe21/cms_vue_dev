<?php

namespace App\Cards;

use App\Models\User;
use Vis\Builder\Services\Value;

class SumUsers extends Value
{
    public $title = 'Total';

    public function calculate()
    {
        return $this->sum(User::class, 'id');
    }
}
