<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <title></title>
        <meta name="description" content="">
        <meta name="author" content="VIS-A-VIS">
        <meta name="HandheldFriendly" content="True">
        <meta name="csrf-token" content="{{ csrf_token() }}" />
        <meta name="MobileOptimized" content="320">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link rel="stylesheet" href="/packages/vis/builder/fontawesome-pro-5.12.0-web/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="/packages/vis/builder/css/all.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">
        <link rel="shortcut icon" href="/packages/vis/builder/img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="/packages/vis/builder/img/favicon/favicon.ico" type="image/x-icon">

        <style>
            .smart-style-4 .tb-pagination nav>ul>li>a {
                padding:6px 12px;
            }

            .smart-style-4 #header>:first-child {
                background: #313645;
            }
            .pagination {
                margin: 0;
            }

            #content, #main {
                position: static;
            }
            .modal-backdrop {
                z-index: 1905;
            }
            .multiselect {
                height: auto;
            }
            .alert-success{
                position: absolute;
                height: 40px;
                top: 40px;
                width: 300px;
                z-index: 10000;
                right: 50px;
            }

            .multiselect__tags {
                border-radius: 0 !important;
                border-color: #BDBDBD !important;
            }

            .multiselect, .multiselect__input, .multiselect__single {
                font-size: 14px !important;
            }

            .smart-form .label {
                padding: 0;
            }

            .dt-toolbar-footer>:first-child, .dt-toolbar>:first-child {
                padding-right: 0px;
            }
            .dt-toolbar-footer>:last-child, .dt-toolbar>:last-child {
                padding-left: 0px;
            }

        </style>
    </head>
    <body class=" smart-style-4">
        <div id="app">
            <app></app>
        </div>

        <script src="{{ mix('js/app.js') }}" type="text/javascript"></script>
    </body>
</html>
