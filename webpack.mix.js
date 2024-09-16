const mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.js('packages/cms/src/resources/js/app.js', 'public/js')
    .vue();

mix.styles([
        'packages/cms/src/published/css/jquery-ui.css',
        'packages/cms/src/published/css/codemirror.min.css',
        'packages/cms/src/published/css/bootstrap.min.css',
        'packages/cms/src/published/css/smartadmin-production-plugins.min.css',
        'packages/cms/src/published/css/smartadmin-production.min.css',
        'packages/cms/src/published/css/smartadmin-skins.min.css',
        'packages/cms/src/published/css/smartadmin-rtl.min.css',
        'packages/cms/src/published/css/demo.min.css',
        'packages/cms/src/published/css/table-builder.css',
        'packages/cms/src/published/css/cropper.min.css',
        'packages/cms/src/published/css/your_style.css',
    ],
    'packages/cms/src/published/css/all.css')
    .copy('packages/cms/src/published/css/all.css','public/packages/cms/css/all2.css');