<?php

namespace Arturishe21\Cms\Services;

use Arturishe21\Cms\Definitions\Resource;
use Arturishe21\Cms\Fields\File;
use Arturishe21\Cms\Models\StorageFile;
use Illuminate\Support\Str;

class FileUpload
{
    protected Resource $definition;
    protected $file;
    protected string $path = '/storage/files/';

    public function __construct(File $fileField)
    {
        $this->definition = $fileField->getDefinition();
        $this->file = request()->file('file');

        if (!file_exists(public_path($this->path))) {
            if (!mkdir($concurrentDirectory = public_path($this->path), 0755, true) && !is_dir($concurrentDirectory)) {
                throw new \RuntimeException(sprintf('Directory "%s" was not created', $concurrentDirectory));
            }
        }
    }

    public function handle(): array
    {
        $extension = $this->file->getClientOriginalExtension();
        $nameFileArray = explode('.', $this->file->getClientOriginalName());
        $nameFile = Str::slug($nameFileArray[0]);

        $fileName = $nameFile . '.' . $extension;

        if (file_exists(public_path($this->path . $fileName))) {
            $fileName = $nameFile . '_' . time() . '.' . $extension;
        }

        $fullPathFile = $this->path . $fileName;

        $this->file->move(public_path($this->path), $fileName);
        $this->saveInStorage($fullPathFile);

        return [
            'status'     => 'success',
            'link'       => asset($fullPathFile),
            'short_link' => $fileName,
            'long_link'  => $fullPathFile,
        ];
    }

    private function saveInStorage(string $path): void
    {
        StorageFile::create([
            'path' => $path,
            'size' => filesize_format(filesize(public_path($path)))
        ]);
    }
}