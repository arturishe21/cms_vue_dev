<?php

namespace App\Cms\Definitions\HasMany;

use App\Models\TestDefinition3 as TestDefinition3Model;
use Vis\Builder\Services\Actions;
use Vis\Builder\Revision;
use Vis\Builder\Fields\{Hidden, Id, Datetime, Text, SelectWithPicture, Definition};
use Vis\Builder\Definitions\Resource;

class TestDefinition3 extends Resource
{
    public $model = TestDefinition3Model::class;
    public $title = 'test2';
    protected $orderBy = 'priority asc';
    protected $isSortable = true;

    public function fields()
    {
        return [
            'test' => [
                Id::make('#', 'id')->sortable(),
                Hidden::make('test_definition_id', 'test_definition_id')->onlyForm()->default(request('foreign_field_id')),
                Text::make('title' ,'title')->filter(),
            ],
        ];
    }


    public function actions()
    {
        return Actions::make();
    }

}
