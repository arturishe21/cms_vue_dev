<?php

namespace Arturishe21\Cms\Http\Controllers;

use App\Services\FileUpload;
use Vis\Builder\StorageFile;
use App\Http\Controllers\Controller;

class FilesController extends Controller
{
    public function upload(FileUpload $fileUpload)
    {
        return $fileUpload->upload();
    }

    public function loadStorage(StorageFile $storageFile)
    {
        $files = $storageFile->orderBy('created_at', 'desc')->paginate(12);

        $itemsTransformed = $files
            ->getCollection()
            ->map(function($item)  {
                return [
                    'id' => $item->id,
                    'path' => $item->path,
                    'size' => $item->size,
                    'date' => $item->created_at->format('d-m-Y H:i:s'),
                    'name' => basename($item->path)
                ];
            })->toArray();

        $filesPaginate =  new \Illuminate\Pagination\LengthAwarePaginator(
            $itemsTransformed,
            $files->total(),
            $files->perPage(),
            $files->currentPage(), [
                'path' => \Request::url(),
                'query' => [
                    'page' => $files->currentPage()
                ]
            ]
        );

        return response()->json([
            'files'=> $filesPaginate
        ]);
    }
}
