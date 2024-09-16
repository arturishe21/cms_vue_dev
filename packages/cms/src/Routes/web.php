<?php

use Illuminate\Support\Facades\Route;
use Arturishe21\Cms\Http\Controllers\{TranslationsController, PagesController,
    AdminController,ImagesController, FilesController, DefinitionFieldController, LoginController};
use App\Cms\Admin;

Route::pattern('translations', 'translations|translations-cms');

Route::group(['prefix' => Admin::PATH], function () {

    Route::group(['middleware' => ['web']], function () {
        Route::get('/login', [LoginController::class, 'index'])->name('cms.login.page');
        Route::post('login', [LoginController::class, 'login'])->name('cms.login');
    });

    Route::group(['middleware' => ['web', 'auth.admin']], function () {
        Route::get('/logout', [LoginController::class, 'logout'])->name('cms.logout');

        Route::get('{translations}/list', [TranslationsController::class, 'index']);
        Route::delete('{translations}/delete/{id}', [TranslationsController::class, 'delete']);
        Route::get('{translations}/search', [TranslationsController::class, 'search']);
        Route::post('{translations}/update/{id}', [TranslationsController::class, 'update']);

        Route::get('{table}/list', [PagesController::class, 'index']);
        Route::get('{table}/edit/{id}', [PagesController::class, 'edit']);
        Route::get('{table}/create', [PagesController::class, 'create']);
        Route::delete('{table}/delete/{id}', [PagesController::class, 'destroy']);

        Route::post('{table}/save/{id}', [PagesController::class, 'update']);
        Route::post('{table}/save', [PagesController::class, 'store']);
        Route::post('{table}/fast-edit/{id}', [PagesController::class, 'fastEdit']);

        Route::post('{table}/clone/{id}', [PagesController::class, 'clone']);
        Route::post('{table}/revisions/{id}', [PagesController::class, 'revisions']);

        Route::post('{table}/change-position', [PagesController::class, 'changePosition']);
        Route::post('{table}/set-order', [PagesController::class, 'setOrder']);
        Route::post('{table}/clear-order', [PagesController::class, 'clearOrder']);
        Route::post('{table}/set-per-page', [PagesController::class, 'setPerPage']);

        Route::get('{table}/list/{id}/{relative}', [DefinitionFieldController::class, 'index']);
        Route::post('{table}/{id}/{relative}/save', [DefinitionFieldController::class, 'store']);

        Route::post('{table}/filter', [PagesController::class, 'filter']);
        Route::post('{table}/search', [PagesController::class, 'search']);

        Route::get('init', [AdminController::class, 'init']);

        Route::post('{table}/file/upload', [ImagesController::class, 'upload']);
        Route::post('load-storage-images', [ImagesController::class, 'loadStorage']);
        Route::post('load-storage-files', [FilesController::class, 'loadStorage']);

        Route::view('', 'admin::app');
        Route::view('{any}', 'admin::app')->where('any', '.*');
    });
});





