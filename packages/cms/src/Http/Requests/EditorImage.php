<?php

namespace Arturishe21\Cms\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EditorImage extends FormRequest
{
    public function authorize(): bool
    {
        return app('user')->hasAccess(['admin.access']);
    }

    public function rules(): array
    {
        return [
            'file'  => ['required', 'image']
        ];
    }
}
