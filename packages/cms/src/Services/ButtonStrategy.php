<?php

namespace Arturishe21\Cms\Services;

use Arturishe21\Cms\Interfaces\Button;

class ButtonStrategy
{
   private $button;

   public function __construct(Button $button)
   {
       $this->button = $button;
   }

   public function render()
   {
       return $this->button->show();
   }
}