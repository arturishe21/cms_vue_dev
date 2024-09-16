<?php

namespace App\Models;

use Cartalyst\Sentinel\Users\EloquentUser;
use DB;
use Cartalyst\Sentinel\Activations\EloquentActivation;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

/**
 * Class User.
 */
class UserBuilder extends EloquentUser
{
    public function groups(): BelongsToMany
    {
        return $this->belongsToMany(Group::class, 'role_users',  'user_id', 'role_id');
    }

    public function activation(): HasOne
    {
        return $this->hasOne(EloquentActivation::class);
    }

    /**
     * @var string
     */
    protected $table = 'users';

    /**
     * @param array $params
     */
    public function setFillable(array $params)
    {
        $this->fillable = $params;
    }

    /**
     * @param array $imgParam
     *
     * @return mixed|string
     */
    public function getAvatar(array $imgParam): string
    {
        $image = $this->picture ?? '/packages/vis/builder/img/blank_avatar.gif';

        return glide($image, $imgParam);
    }

    /**
     * @return string
     */
    public function getFullName(): string
    {
        return $this->first_name.' '.$this->last_name;
    }

    public function hasAccessForCms($link, $action = 'view')
    {
        $link = str_replace(['/'], [''], $link).'.'. $action;

        return $this->hasAccess([$link]);
    }

    public function hasAccessActionsForCms($action)
    {
        $urlArray =  explode('/', request()->path());

        $url = last($urlArray);

        return $this->hasAccessForCms($url, $action);
    }

    public function getUrlPreview(): string
    {
        return '';
    }
}
