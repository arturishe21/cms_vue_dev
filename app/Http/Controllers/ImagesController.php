<?php

namespace App\Http\Controllers;

use App\Services\PageInjection;
use Vis\Builder\StorageImage;

class ImagesController extends Controller
{
    public function upload(PageInjection $modelDefinition)
    {
        return $modelDefinition->definition->getField(request('key'))->upload();
    }

    public function loadStorage(StorageImage $storageImage)
    {
        $images = $storageImage->orderBy('created_at', 'desc')->paginate(15);

        $itemsTransformed = $images
            ->getCollection()
            ->map(function($item)  {

                return [
                    'id' => $item->id,
                    'path' => $item->path,
                    'preview' => $item->preview,
                    'size' => $item->size
                ];

            })->toArray();

        $imagesPaginate =  new \Illuminate\Pagination\LengthAwarePaginator(
            $itemsTransformed,
             $images->total(),
             $images->perPage(),
             $images->currentPage(), [
                'path' => \Request::url(),
                'query' => [
                    'page' => $images->currentPage()
                ]
            ]
        );

       return response()->json([
           'images'=> $imagesPaginate
       ]);
    }
}
