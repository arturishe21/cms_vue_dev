<?php

namespace App\Models;

use Cartalyst\Sentinel\Activations\EloquentActivation;
use Cartalyst\Sentinel\Users\EloquentUser;

class User extends UserBuilder
{
    //protected $visible = ['updated_at'];

   // protected $appends = ['is_admin'];

    public function activation()
    {
        return $this->hasOne(EloquentActivation::class);
    }

    public function getIsAdminAttribute()
    {
        return 'ddd';
    }

    public function articles()
    {
        return $this->belongsToMany(Article::class);
    }
}
