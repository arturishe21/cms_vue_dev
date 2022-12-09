<?php

namespace App\Services;

use Illuminate\Support\Arr;
use Vis\Builder\Services\Export;

class ExportCustom extends Export
{

    public function headings(): array
    {
       $head = parent::headings();

       array_push($head, 'data');

       return $head;
    }

    public function collection()
    {
        $model = $this->listing->getDefinition()->model();
        $fields = request('b');
        $fieldsFilter = request('d');

        $fieldsExpectCompete = Arr::except($fields, 'completed');

        $results = $model::select(array_keys($fieldsExpectCompete));

        if ($fieldsFilter['from']) {
            $results->where('created_at', '>=', $fieldsFilter['from']);
        }

        if ($fieldsFilter['to']) {
            $results->where('created_at', '<=', $fieldsFilter['to']. " 23:59:59");
        }

        return $results->get();
    }
}