<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Mail;
use App\Mail\SuccessRegister;
use App\Models\User;
use App\Models\RolesUsers;
use App\Models\Roles;
use App\Http\Requests\StoreUserRequest;
use Illuminate\Support\Str;

class RegisterController extends Controller 
{
    public function index()
    {
        return view('pages.register');
    }

    public function regist(StoreUserRequest $request)
    {
        $data = [
            'username' => $request->username,
            'password' => bcrypt($request->password),
        ];
        $users_tb = new User();
        $users_tb->fill($data);
        $users_tb->save();
        Mail::to($request->email)->send(new SuccessRegister());
        return redirect()->route('home')->with('regist_status', __('messages.success_regist'));
    }

    public function apiRegist(StoreUserRequest $request)
    {
        $data = [
            'username' => $request->username,
            'password' => bcrypt($request->password),
        ];
        $user = new User();
        $user->fill($data);
        $user->api_token = Str::random(60);
        $user->save();
        $roleUser = new RolesUsers();
        $roleUser->user_id = $user->id;
        $roleUser->role_id = Roles::$userRoleId;
        $roleUser->created_by = $user->id;
        $roleUser->updated_by = $user->id;
        $roleUser->save();

        $domain = url('/');
        if ($domain != env('AWARDSPACE_API_HOST')) {
            Mail::to($request->email)->send(new SuccessRegister());
        }
        return response()->json([
            "username" => $user->username,
            "api_token" => $user->api_token,
            "is_admin" => UserController::isAdmin($user),
        ], 201);
    }
}
