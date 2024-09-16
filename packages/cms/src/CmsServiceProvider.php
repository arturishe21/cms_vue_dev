<?php

namespace Arturishe21\Cms;

use Cartalyst\Sentinel\Laravel\Facades\Sentinel;
use Illuminate\Routing\Router;
use Illuminate\Support\ServiceProvider;
use Arturishe21\Cms\Console\{InstallCommand, GeneratePassword, CreateConfig, CreateImgWebp};
use Arturishe21\Cms\Http\Middleware\{Authenticate, AuthenticateFrontend, LocalizationMiddlewareRedirect};
use Arturishe21\Cms\Services\{PageInjection,TranslationInjection, DefinitionFieldInjection};
use Illuminate\Contracts\Http\Kernel;

class CmsServiceProvider extends ServiceProvider
{
    private string $commandAdminInstall = 'command.admin.install';
    private string $commandAdminGeneratePass = 'command.admin.generatePassword';
    private string $commandAdminCreateConfig = 'command.admin.createConfig';
    private string $commandAdminCreateImgWebp = 'command.admin.createImgWebp';

    public function boot(Router $router): void
    {
        require __DIR__ . '/../vendor/autoload.php';
        require __DIR__ . '/Http/helpers.php';

        $this->app->setLocale(defaultLanguage());

        $router->middleware('auth.admin', Authenticate::class);
        $router->middleware('auth.user', AuthenticateFrontend::class);

        $this->setupRoutes();

        $this->loadViewsFrom(realpath(__DIR__. '/resources/views'), 'admin');

        $this->publishes([
            __DIR__ . '/published' => public_path('packages/cms'),
        ], 'public');

        $this->publishes([
            realpath(__DIR__ . '/Migrations') => $this->app->databasePath() . '/migrations',
        ]);

        \App::singleton('user', function () {
            return Sentinel::check();
        });

    }

    public function provides(): array
    {
        return [
            $this->commandAdminInstall,
            $this->commandAdminGeneratePass,
            $this->commandAdminCreateConfig,
            $this->commandAdminCreateImgWebp,
        ];
    }

    public function register(): void
    {
        $this->app->bind('Arturishe21\Cms\Services\PageInjection', function($params)
        {
            $table = $this->app->make('router')->input('table');
            $id = $this->app->make('router')->input('id');

            return new PageInjection($table, $id);
        });

        $this->app->bind('Arturishe21\Cms\Services\DefinitionFieldInjection', function($params)
        {
            $table = $this->app->make('router')->input('table');
            $id = $this->app->make('router')->input('id');
            $relative = $this->app->make('router')->input('relative');

            return new DefinitionFieldInjection($table, $id, $relative);
        });

        $this->app->bind('Arturishe21\Cms\Services\TranslationInjection', function($params)
        {
            $table = $this->app->make('router')->input('translations');
            $id = $this->app->make('router')->input('id');

            return new TranslationInjection($table, $id);
        });

        $this->app[Kernel::class]->pushMiddleware(LocalizationMiddlewareRedirect::class);

        if (method_exists(Router::class, 'aliasMiddleware')) {
            $this->app[Router::class]
                ->aliasMiddleware('auth.admin', Authenticate::class);
            $this->app[Router::class]
                ->aliasMiddleware('auth.user', AuthenticateFrontend::class);
        }

        $this->registerCommands();
    }

    private function registerCommands(): void
    {
        $this->app->singleton($this->commandAdminInstall, function () {
            return new InstallCommand();
        });

        $this->app->singleton($this->commandAdminGeneratePass, function () {
            return new GeneratePassword();
        });

        $this->app->singleton($this->commandAdminCreateConfig, function () {
            return new CreateConfig();
        });

        $this->app->singleton($this->commandAdminCreateImgWebp, function () {
            return new CreateImgWebp();
        });

        $this->commands($this->commandAdminInstall);
        $this->commands($this->commandAdminGeneratePass);
        $this->commands($this->commandAdminCreateConfig);
        $this->commands($this->commandAdminCreateImgWebp);
    }

    private function setupRoutes(): void
    {
        require __DIR__. '/Routes/web.php';
    }
}
