<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;
use Illuminate\Http\Request;
use DB;

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
    public function changePassword(Request $request){
        $user = Auth::user();
        $this->authorize('update', [$user, $request->password]);
        // $this->authorize('update', [$user, 22]);
        // $this->authorize('update', $request->password);
        // try {
        //     // dd(1, $request->password);
        //     // $this->authorize('update');
        //     $this->authorize('update', $request->password);
        // } catch (\Exception $e) {
        //     return response([
        //         'message' => 'Forbidden.'
        //     ], 403);
        // }
    }
    
}
