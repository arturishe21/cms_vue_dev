<?php

namespace App\Cards;

use App\Models\User;
use Vis\Builder\Services\Value;

class NewUsers extends Value
{
    public $title = 'New users';

    public function calculate()
    {
        return $this->count(User::class);
    }
}
