<?php

namespace App\Models;

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
