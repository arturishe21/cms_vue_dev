<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Services\TranslationInjection;
use Vis\Builder\Models\Translations;
use Vis\Builder\Models\TranslationsCms;

class TranslationsController extends Controller
{
    private $perPage = 20;

    public function index(TranslationInjection $translation)
    {
        $data = $translation->model->orderBy('id', 'desc')->paginate($this->perPage);

        return response()->json([
            'data' => $data
        ]);
    }

    public function delete(TranslationInjection $translation)
    {
        $translation->model->delete();

        return response()->json([
            'status' => 'success'
        ]);
    }

    public function search(TranslationInjection $translation)
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
            ->paginate($this->perPage);

        return response()->json([
            'data' => $data
        ]);
    }

    public function update($table, $id)
    {
        $model = $table == 'translations-cms' ? TranslationsCms::find($id) : Translations::find($id);

        $model->update(request()->only('translate'));

        return response()->json([
           'status' => 'success'
        ]);
    }
}
