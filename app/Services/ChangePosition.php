<?php

namespace App\Services;

class ChangePosition
{
    public function __construct(private $definition, private array $listIds) {}

    public function handle()
    {
        $lowest = 0;
        foreach ($this->listIds as $id) {
            $lowest++;

            $this->definition->model()->where('id', $id)->update([
                'priority' => $lowest,
            ]);
        }

        return response()->json([
            'status' => 'success'
        ]);
    }

    public function handleTree()
    {
        $list = $this->listIds['ids'];
        $model = $this->definition->model();

        $itemMoved = $model::find($this->listIds['element']);

        $key = array_search($itemMoved->id, $list);

        if ($key) {
            $idLeftSibling = $list[$key-1];
            $itemMoved->insertAfterNode($model::find($idLeftSibling));
        } else {
            $idRightSibling = $list[$key+1];
            $itemMoved->insertBeforeNode($model::find($idRightSibling));
        }

        return response()->json([
            'status' => 'success'
        ]);
    }
}