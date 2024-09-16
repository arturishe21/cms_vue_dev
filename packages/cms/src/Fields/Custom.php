<?php

namespace Arturishe21\Cms\Fields;

class Custom extends Field
{
    protected bool $onlyForm = true;
    protected bool $isFieldForUpdateCreate = false;

    protected function getHtml(): string
    {
        return view('custom')->render();
    }

    protected function meta(): array
    {
        return [
            'html' => $this->getHtml(),
        ];
    }
}
