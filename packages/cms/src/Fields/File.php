<?php

namespace Arturishe21\Cms\Fields;

use App\Services\FileUpload;
use Illuminate\Database\Eloquent\Model;

class File extends Field
{
    protected string $accept;
    protected string $path = '/storage/files/';
    protected $isAutoTranslate = false;
    protected $selectWithUploaded = true;

    public function getAccept()
    {
        return $this->accept;
    }

    public function getValueForList(Model $model): ?string
    {
        $value = parent::getValueForList($model);

        if ($value) {
            return "<a href='{$value}' target='_blank'>" . __cms('Скачать') . "</a>";
        }

        return null;
    }

    public function accept(string $value): self
    {
        $this->accept = 'accept="'. $value .'"';

        return $this;
    }

    public function noFileSelection(): self
    {
        $this->selectWithUploaded = false;

        return $this;
    }

    public function checkSelectionFiles()
    {
        return $this->selectWithUploaded;
    }

    public function uploadPath(string $path): self
    {
        $this->path = $path;

        return $this;
    }

    public function upload(): array
    {
        return (new FileUpload($this))->handle();
    }

}
