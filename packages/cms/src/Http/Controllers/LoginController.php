<?php

namespace Arturishe21\Cms\Http\Controllers;

use Arturishe21\Cms\Http\Requests\Login;
use Cartalyst\Sentinel\Checkpoints\NotActivatedException;
use Cartalyst\Sentinel\Checkpoints\ThrottlingException;
use Cartalyst\Sentinel\Laravel\Facades\Sentinel;
use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;

class LoginController extends Controller
{
    public function index(): View|RedirectResponse
    {
        if (Sentinel::check()) {
            return redirect()->to('cms');
        }

        return view('admin::app');
    }

    public function login(Login $request): JsonResponse
    {
        try {
            $user = Sentinel::authenticate($request->all());

            if (! $user) {
                return $this->returnError('Пользователь не найден');
            }

            return $this->returnSuccess('');

        } catch (ThrottlingException $e) {

            return $this->returnError('Превышено количество возможных попыток входа');

        } catch (NotActivatedException $e) {

            return $this->returnError('Пользователь не активирован');
        }
    }

    public function logout()
    {
        Sentinel::logout();
        session()->forget('table_builder');

        return redirect()->route('cms.login.page');
    }

    protected function returnSuccess(string $message): JsonResponse
    {
        return response()->json([
            'status' => 'success',
            'message' => $message
        ]);
    }

    protected function returnError(string $message): JsonResponse
    {
        return response()->json([
            'status' => 'error',
            'message' => $message
        ]);
    }
}
