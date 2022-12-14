<?php

namespace Arturishe21\Cms\Fields;

use App\Services\ImageUpload;
use Illuminate\Database\Eloquent\Model;

class Image extends Field
{
    protected $isAutoTranslate = false;
    private string $path;

    public function getValue()
    {
        $image = $this->value;

        if ($image) {
            return [
                'path' => $image,
                'preview' => glide($image, ['w'=> 200, 'h' => 200])
            ];
        }
    }

    public function uploadPath(string $path): self
    {
        $this->path = $path;

        return $this;
    }

    public function getValueForList(Model $model): ?string
    {
        $value = parent::getValueForList($model);

        if ($value) {
            $previewForList = glide($value, ['w' => 60, 'h' => 60]);

            return "<img src='{$previewForList}'>";
        }

        return null;
    }

    public function upload()
    {
        return (new ImageUpload($this))->handle();
    }

}
