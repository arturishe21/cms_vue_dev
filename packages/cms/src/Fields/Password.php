<?php

namespace Arturishe21\Cms\Fields;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Hash;

class Password extends Field
{
    private string $defaultPassword = '******';

    public function getValueForList(Model $model): ?string
    {
        return $this->defaultPassword;
    }

    public function getValue()
    {
       return $this->defaultPassword;
    }

    public function prepareSave($request)
    {
        $nameField = $this->getNameField();

        return Hash::make($request[$nameField]);
    }
}
