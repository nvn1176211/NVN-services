<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;
use Illuminate\Http\Request;
use App\Http\Requests\UpdatePasswordUserRequest;
use DB;
use Illuminate\Support\Str;

class UserController extends Controller 
{
    /**
     * @return Array
     */
    public function index()
    {
        $user = Auth::user();
        return [
            "id" => $user->id,
            "username" => $user->username,
            "email" => $user->email,
            "api_token" => $user->api_token,
            "is_admin" => $this->isAdmin($user),
        ];
    }

    /**
     * @param  Model object $user
     * @return Number
     */
    public static function isAdmin($user){
        $isAdmin = DB::table('roles_users')->where([
            ['user_id', $user->id],
            ['role_id', config('constants.admin_id')],
        ])->count();
        return $isAdmin ? true : false;
    }

    /**
     * @param  Model object $user
     * @return Array
     */
    public static function registerHistory(){
        if(Gate::denies('request-register-history')) return response(['message' => 'Unauthorized.'], 401);
        $registerHistory = DB::table('user')->select('username', 'created_at')->orderBy('created_at', 'desc')->get();
        return $registerHistory;
    }

    /**
     * @return Object
     */
    public function changePassword(UpdatePasswordUserRequest $request){
        $user = Auth::user();
        $user->password = bcrypt($request->new_password);
        $user->api_token = Str::random(60);
        $user->updated_at = date(config('constants.standard_datetime_format'));
        $user->save();
        return response()->json([
            "username" => $user->username,
            "api_token" => $user->api_token,
            "is_admin" => UserController::isAdmin($user),
        ], 200);
    }
    
}
