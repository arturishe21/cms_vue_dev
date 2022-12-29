<?php

namespace Arturishe21\Cms\Http\Controllers;

use App\Cms\Admin;
use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;

class AdminController extends Controller
{
    public function init(Admin $admin): JsonResponse
    {
        return response()->json([
            'menu'=> $admin->menu(),
            'languages' => [
                'site' => [
                    'default' => defaultLanguage(),
                    'all' => languagesOfSite()
                ],
                'cms' => [
                    'default' => 'ru',
                    'all' => ['ru', 'en']
                ]
            ],
        ]);
    }
}
