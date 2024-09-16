<?php

namespace App\Models;

use Illuminate\Support\Facades\App;
use Arturishe21\Cms\Models\Tree as TreeBuilder;
use Illuminate\Support\Facades\Request;
use App\Models\MorphOne\Seo;

class Tree extends TreeBuilder
{
    public function words()
    {
        return $this->morphToMany(Word::class, 'words', 'tb_tree_word');
    }

    public function test()
    {
        return $this->hasMany(TestDefinition::class, 'tb_tree_id')->orderBy('priority');
    }

    public function seo()
    {
        return $this->morphOne(Seo::class, 'seo');
    }

    public static function getFirstDepthNodes()
    {
        return self::where('depth', '1')->get();
    }

    // end getFirstDepthNodes

    public function scopeIsMenu($query)
    {
        return $query->where('is_show_in_menu', 1)->where('is_active', '1')->orderBy('lft', 'asc');
    }

    public function scopeIsMenuFooter($query)
    {
        return $query->where('is_show_in_footer_menu', 1)->where('is_active', '1')->orderBy('lft', 'asc');
    }


    public function scopePriorityAsc($query)
    {
        return $query->orderBy('lft', 'asc');
    }

    // end getDate

    //url page
    public function getUrl(): string
    {
        return geturl(parent::getUrl(), App::getLocale());
    }

    public function checkActiveMenu()
    {
        $pathUrl = str_replace(Request::root().'/', '', $this->getUrl());

        //if main page
        if ($this->id == 1 && $this->slug == '/') {
            return true;
        } else {
            if (Request::is($pathUrl) || Request::is($pathUrl.'/*')) {
                return true;
            }
        }
    }

    public function articles()
    {
        return $this->belongsToMany(Article::class);
    }
}
