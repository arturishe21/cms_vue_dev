<?php

namespace Arturishe21\Cms\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class Translate extends FormRequest
{
    public function authorize(): bool
    {
        return app('user')->hasAccess(['admin.access']);
    }

    public function rules(): array
    {
        return [
            'phrase' => ['required', 'unique:translations_phrases'],
        ];
    }
}
