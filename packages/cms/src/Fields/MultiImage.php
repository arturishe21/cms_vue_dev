<?php

namespace Arturishe21\Cms\Fields;

class MultiImage extends Image
{
    public $onlyForm = true;

    public function getValue()
    {
        $images = json_decode($this->value);

        return collect($images)->map(function ($item) {
            return [
                'path' => $item,
                'preview' => glide($item, ['w'=> 120, 'h' => 120])
            ];
        });
    }
}
