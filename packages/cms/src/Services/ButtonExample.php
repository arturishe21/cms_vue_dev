<?php

namespace Arturishe21\Cms\Services;

use Illuminate\Contracts\View\View;
use Arturishe21\Cms\Interfaces\Button;

class ButtonExample extends ButtonBase implements Button
{
    public function show():View
    {
        return view('admin::list.buttons.button_example');
    }
}