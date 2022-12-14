<?php

namespace App\Services;

use Vis\Builder\Fields\File;
use Vis\Builder\StorageFile;
use Illuminate\Support\Str;

class FileUpload
{
    protected $definition;
    protected $file;
    protected $path = '/storage/files/';

    public function __construct(File $fileField)
    {
        $this->definition = $fileField->getDefinition();
        $this->file = request()->file('file');

        if (!file_exists(public_path($this->path))) {
            mkdir(public_path($this->path), 0755, true);
        }
    }

    public function handle() : array
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

    private function saveInStorage($path)
    {
        StorageFile::create([
            'path' => $path,
            'size' => filesize_format(filesize(public_path($path)))
        ]);
    }
}