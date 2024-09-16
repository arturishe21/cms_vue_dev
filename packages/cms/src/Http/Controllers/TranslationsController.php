<?php

namespace Arturishe21\Cms\Http\Controllers;

use App\Http\Controllers\Controller;
use Arturishe21\Cms\Services\TranslationInjection;
use Arturishe21\Cms\Models\Translations;
use Arturishe21\Cms\Models\TranslationsCms;
use Illuminate\Http\JsonResponse;

class TranslationsController extends Controller
{
    protected array $perPage = [20, 50, 100];

    public function index(TranslationInjection $translation): JsonResponse
    {
        $data = $translation->model->orderBy('id', 'desc')->paginate($this->thisPerPage());

        return response()->json([
            'data' => $data,
            'per_page_list' => $this->perPage,
        ]);
    }

    public function delete(TranslationInjection $translation): JsonResponse
    {
        $translation->model->delete();

        return response()->json([
            'status' => 'success'
        ]);
    }

    public function search(TranslationInjection $translation): JsonResponse
    {
        $querySearch = request()->get('query');

        $data = $translation->model->leftJoin('translations', 'translations.id_translations_phrase', '=', 'translations_phrases.id')
            ->select('translations_phrases.*')
            ->where(function ($query) use ($querySearch) {
                $query->where('phrase', 'like', '%'.$querySearch.'%')
                    ->orWhere('translations.translate', 'like', '%'.$querySearch.'%');
            })
            ->groupBy('translations_phrases.id')
            ->orderBy('translations_phrases.id', 'desc')
            ->paginate($this->thisPerPage());

        return response()->json([
            'data' => $data
        ]);
    }

    public function update(string $table, int $id): JsonResponse
    {
        $model = $table == 'translations-cms' ? TranslationsCms::find($id) : Translations::find($id);

        $model->update(request()->only('translate'));

        return response()->json([
           'status' => 'success'
        ]);
    }

    private function thisPerPage(): int
    {
        return $this->perPage[0];
    }
}
