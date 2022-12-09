<?php

return [
    //default language
    'def_locale' => 'ua',

    //other language
    'alt_langs'  => ['Укр'=>'ua', 'Рус'=>'ru',  'Eng'=>'en'],
    'show_count' => ['20', '40', '60', '100'],

    'languages' => [
        [
            'caption'     => 'ua',
            'postfix'     => '',
            'placeholder' => 'Текст на украинском',
        ],
        [
            'caption'     => 'ru',
            'postfix'     => '_ru',
            'placeholder' => 'Текст на русском',
        ],
        [
            'caption'     => 'en',
            'postfix'     => '_en',
            'placeholder' => 'Текст на английском',
        ],
    ],
];
