<?php

namespace Arturishe21\Cms\Services;

use Illuminate\Database\Eloquent\Collection;

class ExportUsers extends Export
{
    public function headings(): array
    {
        return parent::headings();
    }

    public function collection(): Collection
    {
        $model = $this->listing->getDefinition()->model();
        $fieldsFilter = request('d');

        $results = $model::select($this->prepareFields())->leftJoin('activations', 'activations.user_id', '=', 'users.id');

        if ($fieldsFilter['from']) {
            $results->where('created_at', '>=', $fieldsFilter['from']);
        }

        if ($fieldsFilter['to']) {
            $results->where('created_at', '<=', $fieldsFilter['to']. " 23:59:59");
        }

        return $results->get();
    }

    private function prepareFields(): array
    {
        $fields = request('b');

        $collectFields = collect(array_keys($fields));

        return $collectFields->map(function ($field)  {

            if ($field == 'completed') {
                return 'activations.completed';
            }

            return 'users.'. $field;
        })->toArray();
    }
}