<?php

namespace Arturishe21\Cms\Models;

use Illuminate\Support\Facades\Cache;
use Kalnoy\Nestedset\NodeTrait;
use Bkwld\Cloner\Cloneable;

class Tree extends BaseModel
{
    use Cloneable,
        NodeTrait;

    protected $table = 'tb_tree';

    public function getLftName(): string
    {
        return 'lft';
    }

    public function getRgtName(): string
    {
        return 'rgt';
    }

    public function getParentIdName(): string
    {
        return 'parent_id';
    }

    public function makeFirstChildOf($root): void
    {
        $this->appendToNode($root)->save();
    }

    public function makeChildOf($root): void
    {
        $this->appendToNode($root)->save();
    }

    public function children()
    {
        return $this->hasMany(get_class($this), $this->getParentIdName())
            ->setModel($this)->defaultOrder();
    }

    /**
     * @var array
     */
    protected $fillable = [];

    /**
     * @var string
     */
    protected $fileDefinition = 'tree';

    protected $_nodeUrl;

    public function checkUnicUrl()
    {
        $slug = $this->slug;
        if ($slug) {
            $slugCheck = $this->where('slug', 'like', $this->slug)
                ->where('parent_id', $this->parent_id)
                ->where('id', '!=', $this->id)->count();

            if ($slugCheck) {
                $slug = $this->slug.'_'.$this->id;
            }

            $slugCheckId = $this->where('slug', 'like', $slug)
                ->where('parent_id', $this->parent_id)
                ->where('id', '!=', $this->id)->count();

            if ($slugCheckId) {
                $slug = $slug.'_'.time();
            }

            $this->slug = $slug;
            $this->save();
        }
    }

    /**
     * @param $url
     */
    public function setUrl($url)
    {
        $this->_nodeUrl = $url;
    }

    public function getUrl(): string
    {
        if (! $this->_nodeUrl) {
            $this->_nodeUrl = $this->getGeneratedUrl();
        }

        if (strpos($this->_nodeUrl, 'http') !== false) {
            return $this->_nodeUrl;
        }

        return '/'. $this->_nodeUrl;
    }

    public function getUrlNoLocation(): string
    {
        if (! $this->_nodeUrl) {
            $this->_nodeUrl = $this->getGeneratedUrl();
        }

        return '/' . $this->_nodeUrl;
    }

    /**
     * @return mixed|string
     */
    public function getGeneratedUrl()
    {
        $tags = $this->getCacheTags();

        if ($tags && $this->fileDefinition) {
            return Cache::tags($tags)->rememberForever($this->fileDefinition.'_'.$this->id, function () {
                return $this->getGeneratedUrlInCache();
            });
        }

        return $this->getGeneratedUrlInCache();
    }

    public function getAncestorsAndSelf()
    {
        return self::defaultOrder()->ancestorsAndSelf($this->id);
    }

    private function getGeneratedUrlInCache()
    {
        $all = $this->getAncestorsAndSelf();
        $slugs = [];

        foreach ($all as $node) {
            if ($node->slug == '/') {
                continue;
            }

            $slugs[] = $node->slug;
        }

        return implode('/', $slugs);
    }

    public function isHasChildren()
    {
        return (bool) $this->children_count;
    }

    public function clearCache()
    {
        $tags = $this->getCacheTags();

        if (count($tags)) {
            Cache::tags($tags)->flush();
        }
    }

    /**
     * @return bool|mixed
     */
    protected function getCacheTags()
    {
        return ['tree'];
    }
}
