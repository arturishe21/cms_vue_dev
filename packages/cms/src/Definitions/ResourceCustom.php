<?php

namespace Arturishe21\Cms\Definitions;

abstract class ResourceCustom extends Resource
{
    public string $component = 'resource_custom';

    abstract public function getHtml(): string;
}