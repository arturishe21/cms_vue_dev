<?php

namespace App\Services;

use Illuminate\Support\Str;
use Illuminate\Support\Facades\File;
use Vis\Builder\Fields\Image;
use Vis\Builder\StorageImage;

class ImageUpload
{
    protected $definition;
    protected $file;
    protected $path = '/storage/editor/fotos/';

    public function __construct(Image $imageField)
    {
        $this->definition = $imageField->getDefinition();
        $this->file = request()->file('file');
    }

    public function handle() : array
    {
        $model = $this->definition->model();
        $extension = $this->getExtension($this->file->guessExtension());

        $rawFileName = md5_file($this->file->getRealPath()).'_'.time();
        $fileName = $rawFileName.'.'.$extension;

        $fullFileName = $this->path . $fileName;

        $this->file->move(public_path($this->path), $fileName);

        $preview = $extension == 'svg' ? $fullFileName : glide($fullFileName, ['w' => 200, 'h' => 200]);

        $this->saveInImageStore($fullFileName);

        return [
            'status' => 'success',
            'image' => [
                'path' => $fullFileName,
                'preview' => $preview
            ],
        ];
    }

    private function getExtension($guessExtension)
    {
        return $guessExtension == 'html' || $guessExtension == 'txt' ? 'svg' : $guessExtension;
    }

    private function saveInImageStore($path)
    {
        StorageImage::create([
            'path' => $path,
            'size' => $this->getSizeImage($path)
        ]);
    }

    private function getSizeImage($path)
    {
        try {
            $size = getimagesize(public_path($path));

            return $size[0].'x'.$size[1];

        } catch (\Exception $e) {
            return '';
        }
    }
}
