<?php

namespace App\Models;

use Arturishe21\Cms\Models\Tree as TreeBuilder;

class MenuHeader extends TreeBuilder
{
    protected $table = 'menu_header';
    protected $fillable = [];
    public $timestamps = false;
    protected $guarded = [];

    public function tree()
    {
        return $this->belongsTo(Tree::class, 'tb_tree_id');
    }

    public function getUrl()
    {
        if ($this->tree) {
            return $this->tree->getUrl();
        }

        if ($this->url) {
            return geturl($this->url);
        }

        if ($this->t('url_external')) {
            return $this->t('url_external');
        }

        return null;
    }

    public static function getMenu()
    {
        $menuAll = self::with('tree', 'children')
            ->defaultOrder()
            ->get()
            ->toTree();

        if (isset($menuAll[0])) {
            return $menuAll[0]->children;
        }

        return [];
    }
}
