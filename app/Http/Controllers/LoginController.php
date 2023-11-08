<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use App\Http\Requests\LoginRequest;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;

class LoginController extends Controller 
{
    public function index()
    {
        return view('pages.login');
    }

    //api
    public function login(LoginRequest $request)
    {
        $credentials = [
            'username' => $request->username,
            'password' => $request->password,
        ];
        if(Auth::attempt($credentials)) {
            $user = Auth::user();
            $user->generateToken();
            return [
                'status' => 'Authorised',
                'api_token' => $user->api_token,
            ];       
        }else{
            return response()->json(['status'=>'Unauthorised'], 401);
        }
    }
    
    // public function login(LoginRequest $request)
    // {
    //     $credentials = [
    //         'username' => $request->username,
    //         'password' => $request->password,
    //     ];
    //     if(Auth::attempt($credentials)) {
    //         return redirect()->route('home');       
    //     }
    //     return 'Failure'; 
    // }

    public function logout()
    {
        $user = Auth::user();
        $user->api_token = null;
        $user->save();
        return ['data' => 'User logged out.'];
    }
}
