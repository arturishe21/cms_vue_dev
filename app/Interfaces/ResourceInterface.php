<?php

namespace App\Interfaces;

use Illuminate\Database\Eloquent\Model;

interface ResourceInterface
{
    public function fields(): array;
}
