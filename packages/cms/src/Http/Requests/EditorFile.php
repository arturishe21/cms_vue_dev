<?php

namespace Arturishe21\Cms\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EditorFile extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'file'  => 'required'
        ];
    }
}
