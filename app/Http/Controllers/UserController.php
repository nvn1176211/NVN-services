<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;
use DB;

class UserController extends Controller 
{
    /**
     * @param  \Illuminate\Http\Request  $request
     * @return Array
     */
    public function index()
    {
        $user = Auth::user();
        return [
            "id" => $user->id,
            "username" => $user->username,
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
    
}
