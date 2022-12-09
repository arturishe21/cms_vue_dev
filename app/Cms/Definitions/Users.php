<?php

namespace App\Cms\Definitions;

use App\Models\User;
use Vis\Builder\Services\Actions;
use Vis\Builder\Fields\{ManyToMany, ManyToManyAjax,  Relations\Options, Password, Checkbox, Id, Text};
use Illuminate\Validation\Rule;
use App\Fields\Virtual;
use Vis\Builder\Definitions\Resource;
use Vis\Builder\Services\ButtonExample;
use Vis\Builder\Services\Import;
use App\Services\ExportCustom;
use App\Cards\ChartUser;

class Users extends Resource
{
    public string $model = User::class;
    public string $title = 'Пользователи';

    public function fields(): array
    {
        return [
            'Общая' => [
                Id::make('#', 'id')->sortable(),
                Virtual::make('Test'),
                Text::make('Email', 'email')->sortable()->filter()
                    ->rules([
                        'required',
                        Rule::unique('users')->ignore(request('id')),
                    ]),
                Password::make('Пароль', 'password')->onlyForm(),

                Text::make('Имя', 'first_name')->sortable()->filter(),
                Checkbox::make('Активен', 'completed')->hasOne('activation')->filter(),
          //      Readonly::make('Дата регистрации', 'created_at')->default(Carbon::now())->sortable(),
           //     Readonly::make('Дата последнего входа', 'last_login')->sortable()
            ],

            'Группа' => [
                ManyToMany::make('Группа')->options(
                    (new Options('groups'))->keyField('name')
                ),
                Text::make('Фамилия', 'last_name')->sortable()->filter(),
            ],

        ];
    }

    public function cards(): array
    {
        return [
            ChartUser::class,
            ChartUser::class
        ];
    }

    public function actions(): Actions
    {
        return Actions::make()->insert()->update()->delete();
    }

    public function buttons(): array
    {
        return [
             ExportCustom::class,
             Import::class,
             ButtonExample::class
        ];
    }
}