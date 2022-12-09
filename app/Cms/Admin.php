<?php

namespace App\Cms;

use Vis\Builder\Setting\AdminBase;

class Admin extends AdminBase
{
    public function menu(): array
    {
        return [

            [
                'title' => 'Структура сайта',
                'icon'  => 'sitemap',
                'link'  => '/tree',
            ],

            array(
                'title' => "Меню Хедер",
                'link'  => '/menu_header',
            ),

            array(
                'title' => 'Слова',
                'icon'  => 'music',
                'link'  => '/words',
            ),

            array(
                'title' => 'Новости',
                'link'  => '/news',
            ),

            array(
                'title' => 'Автора',
                'icon'  => 'users',
                'link'  => '/authors',
            ),

            [
                'title' => 'Настройки',
                'icon'  => 'cog',
                'link'  => '/settings_block',
                'submenu' => [
                    [
                        'title' => 'Управление',
                        'link'  => '/settings',
                    ],
                    [
                        'title' => 'Языки сайта',
                        'link' => '/languages'
                    ],
                    [
                        'title' => 'Переводы CMS',
                        'link'  => '/translations-cms',
                    ],
                    [
                        'title' => 'Контроль изменений',
                        'link'  => '/revisions',
                    ],
                ],
            ],
            array(
                'title'   => 'Медиахранилище',
                'icon'    => 'images',
                'link'    => 'image_storage',
                'submenu' => array(
                    array(
                        'title' => "Изображения",
                        'link'  => '/image_storage/images',
                    ),
                    array(
                        'title' => "Галереи",
                        'link'  => '/image_storage/galleries',
                    ),
                    array(
                        'title' => "Видео",
                        'link'  => '/image_storage/videos',
                    ),
                    array(
                        'title' => "Видеогалереи",
                        'link'  => '/image_storage/video_galleries',
                    ),
                    array(
                        'title' => "Документы",
                        'link'  => '/image_storage/documents',
                    ),
                    array(
                        'title' => "Теги",
                        'link'  => '/image_storage/tags',
                    ),
                )
            ),


            array(
                'title' => 'Переводы',
                'icon'  => 'language',
                'link'  => '/translations',
            ),

            [
                'title' => 'Упр. пользователями',
                'icon'  => 'user',
                'link'  => '/users_group',
                'submenu' => [
                    [
                        'title' => 'Пользователи',
                        'link'  => '/users',
                        'submenu' => [
                            [
                                'title' => 'Пользователи2',
                                'link'  => '/users',
                            ],

                            [
                                'title' => 'Группы2',
                                'link'  => '/groups',
                            ],

                        ],
                    ],

                    [
                        'title' => 'Группы',
                        'link'  => '/groups',
                    ],

                ],
            ],
        ];
    }

}
