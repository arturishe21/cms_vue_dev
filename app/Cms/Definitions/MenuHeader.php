<?php

namespace App\Cms\Definitions;

use Arturishe21\Cms\Definitions\ResourceAdditionTree;
use App\Models\MenuHeader as MenuHeaderModel;
use Arturishe21\Cms\Fields\{Hidden, Text, Relations\Options, Checkbox};
use App\Fields\ForeignTree;

class MenuHeader extends ResourceAdditionTree
{
    public string $model = MenuHeaderModel::class;
    public string $title = 'Меню Хеадер';
    protected string $cacheTag = 'menu_header';

    public function fields(): array
    {
        return [
            Hidden::make('#', 'id'),
            Text::make('Заголовок', 'title')->language(),
           
            Text::make('Внутренняя ссылка', 'url'),
         //   Text::make('Внешняя ссылка', 'url_external')->language(),
          //  Checkbox::make('Открывать в новой вкладке', 'is_target_blank')
        ];
    }
}
