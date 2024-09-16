<?php

namespace App\Cms\Definitions;

use App\Models\User;
use Carbon\Carbon;
use Arturishe21\Cms\Definitions\ResourceCustom;
use Illuminate\Support\Facades\DB;
use App\Models\Order;
use App\Models\OrderProducts;
use App\Models\Comment;

class Dashboard extends ResourceCustom
{
    public string $title = 'Рабочий стол';

    public function getHtml(): string
    {
        $lastUsers = User::orderBy("created_at", "desc")->limit(5)->get();

        return view(
            'cms.dashboard',
            compact(
                'lastUsers',
            )
        )->render();
    }
}
