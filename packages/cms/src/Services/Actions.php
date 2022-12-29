<?php

namespace Arturishe21\Cms\Services;

class Actions
{
    protected array $actionsList = [];

    public static function make(...$arguments)
    {
        return new static(...$arguments);
    }

    public function getActionsList(): array
    {
        return $this->actionsList;
    }

    public function insert(): self
    {
        $this->checkAccess('insert');

        return $this;
    }

    public function update(): self
    {
        $this->checkAccess('update');

        return $this;
    }

    public function preview(): self
    {
        $this->checkAccess('preview');

        return $this;
    }

    public function delete(): self
    {
        $this->checkAccess('delete');

        return $this;
    }

    public function clone(): self
    {
        $this->checkAccess('clone');

        return $this;
    }

    public function revisions(): self
    {
        $this->checkAccess('revisions');

        return $this;
    }

    private function checkAccess($action): void
    {
       // if (app('user')->hasAccessActionsForCms($action)) {
            $this->actionsList[$action] = $action;
       // }
    }
}
