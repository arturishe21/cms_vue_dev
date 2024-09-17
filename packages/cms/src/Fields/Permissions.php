<?php

namespace Arturishe21\Cms\Fields;

use App\Cms\Admin;

class Permissions extends Field
{
    protected array $actions = [
        'view' => 'Просмотр',
        'insert' => 'Создание',
        'update' => 'Редактирование',
        'save' => 'Сохранение',
        'clone' => 'Клонирование',
        'revisions' => 'История',
        'delete' => 'Удаление'
    ];

    private function generatePermissions(): array
    {
        $permissionsMenu = (new Admin())->menu();

        $permissions['Дооступ в cms'] = [
            "admin.access" => "Да"
        ];

        foreach ($permissionsMenu as $permission) {
            if (isset($permission['link']) && isset($permission['title'])) {
                $slug = $this->prepareSlug($permission['link']);

                foreach ($this->actions as $slugAction => $titleAction) {
                    $permissions[$permission['title']][$slug.'.'. $slugAction] = $titleAction;
                }
            }

            if (isset($permission['submenu'])) {
                foreach ($permission['submenu'] as $subMenu) {
                    if (isset($subMenu['link'])) {
                        $slug = $this->prepareSlug($subMenu['link']);
                        if (isset($subMenu['link']) && isset($subMenu['title'])) {
                            $permissions[$permission['title']][$subMenu['title']][$slug.'.view'] = 'Просмотр';

                            foreach ($this->actions as $slugAction => $titleAction) {
                                $permissions[$permission['title']][$subMenu['title']][$slug.'.'.$slugAction] = $titleAction;
                            }

                            if (isset($subMenu['submenu'])) {
                                foreach ($subMenu['submenu'] as $subMenuLevel2) {
                                    $slug = $this->prepareSlug($subMenuLevel2['link']);

                                    foreach ($this->actions as $slugAction => $titleAction) {
                                        $permissions[$permission['title']][$subMenu['title']][$subMenuLevel2['title']][$slug.'.'. $slugAction] = $titleAction;
                                    }

                                }
                            }

                        }
                    }
                }
            }
        }

        return $permissions;
    }

    private function prepareSlug(string $link): string
    {
        return str_replace(['/'], [''], $link);
    }

    protected function meta(): array
    {
        return [
            'permissions' => $this->generatePermissions()
        ];
    }
}
