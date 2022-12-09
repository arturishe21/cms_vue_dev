<?php

namespace App\Providers;

use App\Services\{PageInjection, ChangePosition, TranslationInjection, DefinitionFieldInjection};
use Illuminate\Support\ServiceProvider;
use Cartalyst\Sentinel\Laravel\Facades\Sentinel;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->bind('App\Services\PageInjection', function($params)
        {
            $table = $this->app->make('router')->input('table');
            $id = $this->app->make('router')->input('id');

            return new PageInjection($table, $id);
        });

        $this->app->bind('App\Services\DefinitionFieldInjection', function($params)
        {
            $table = $this->app->make('router')->input('table');
            $id = $this->app->make('router')->input('id');
            $relative = $this->app->make('router')->input('relative');

            return new DefinitionFieldInjection($table, $id, $relative);
        });

        $this->app->bind('App\Services\TranslationInjection', function($params)
        {
            $table = $this->app->make('router')->input('translations');
            $id = $this->app->make('router')->input('id');

            return new TranslationInjection($table, $id);
        });
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        \App::singleton('user', function () {
            return Sentinel::check();
        });
    }
}
