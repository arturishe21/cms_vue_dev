<?php

namespace Arturishe21\Cms\Fields;

use Illuminate\Database\Eloquent\Builder;

class Text extends Field
{
    protected string $transliterationField = '';
    protected bool $transliterationOnlyEmpty = false;

    public function filterField(Builder &$query, mixed $value): void
    {
        $fieldName = $this->getNameField();
        $value = mb_convert_case($value, MB_CASE_TITLE, 'UTF-8');
        
        $query->where($fieldName, '=', $value)
            ->orWhereRaw('LOWER(`'.$fieldName.'`) LIKE ? ',['%'.trim(mb_strtolower($value)).'%']);
    }

    public function transliteration(string $field, bool $onlyEmpty = false): Field
    {
        $this->transliterationField = $field;
        $this->transliterationOnlyEmpty = $onlyEmpty;

        return $this;
    }

    protected function meta()
    {
        return [
            'transliterationField' => $this->transliterationField,
            'transliterationOnlyEmpty' => $this->transliterationOnlyEmpty
        ];
    }
}
