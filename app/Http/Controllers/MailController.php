<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Mail;
use App\Mail\SuccessRegister;
use App\Mail\PasswordChanged;

class MailController extends Controller 
{
    public static function registered($to)
    {
        $domain = url('/');
        if ($domain != env('AWARDSPACE_API_HOST')) {
            Mail::to($to)->send(new SuccessRegister());
        }
    }

    public static function passwordChanged($to)
    {
        $domain = url('/');
        if ($domain != env('AWARDSPACE_API_HOST')) {
            Mail::to($to)->send(new PasswordChanged());
        }
    }
}
