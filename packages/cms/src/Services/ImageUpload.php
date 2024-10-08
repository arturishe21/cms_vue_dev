<?php

namespace Arturishe21\Cms\Services;

use Arturishe21\Cms\Definitions\Resource;
use Arturishe21\Cms\Fields\Image;
use Arturishe21\Cms\Models\StorageImage;

class ImageUpload
{
    protected Resource $definition;
    protected $file;
    protected string $path = '/storage/editor/fotos/';

    public function __construct(Image $imageField)
    {
        $this->definition = $imageField->getDefinition();
        $this->file = request()->file('file');
    }

    public function handle(): array
    {
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

    private function getExtension(string $guessExtension): string
    {
        return $guessExtension == 'html' || $guessExtension == 'txt' ? 'svg' : $guessExtension;
    }

    private function saveInImageStore(string $path): void
    {
        StorageImage::create([
            'path' => $path,
            'size' => $this->getSizeImage($path)
        ]);
    }

    private function getSizeImage(string $path): string
    {
        try {
            $size = getimagesize(public_path($path));

            return $size[0].'x'.$size[1];

        } catch (\Exception $e) {
            return '';
        }
    }
}
