<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
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
    
}
