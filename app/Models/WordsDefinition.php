<?php

namespace App\Models;

use Arturishe21\Cms\Models\BaseModel;

class WordsDefinition extends BaseModel
{
    protected $table = 'words_definition';
    protected $fillable = [];
    public $timestamps = FALSE;

    public function word()
    {
        return $this->belongsTo(Word::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
