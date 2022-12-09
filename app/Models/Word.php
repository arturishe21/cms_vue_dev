<?php

namespace App\Models;

class Word extends BaseModel
{
    use \Bkwld\Cloner\Cloneable;

    protected $table = 'words';
    protected $fillable = [];

    protected $cloneable_relations = ['definitionTest', 'groups'];

    public function author()
    {
        return $this->belongsTo(Author::class);
    }

    public function author2()
    {
        return $this->hasMany(Author::class);
    }

    public function definitionTest()
    {
        return $this->hasMany(WordsDefinition::class)->orderBy('priority', 'asc');
    }

    public function groups()
    {
        return $this->belongsToMany(Group::class, 'role_words',  'word_id', 'role_id');
    }

    public function scopeFilter($q)
    {
        return $q->where('id', '>', '7');
    }
}
