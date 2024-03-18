<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;

class FilesController extends Controller
{
    /**
     * @param Object $file
     * @return String
     */
    public static function storeImage($file){
        $domain = url('/');
        if (
            $domain == env('AWARDSPACE_API_HOST')
            || $domain == env('LOCAL_API_HOST')
        ) {
            $requestTime = getdate()[0];
            $filename = $requestTime . '.' . $file->getClientOriginalExtension();
            $imgUrl = route('api.cors_img', ['img_name' => $filename]);
            $file->storeAs('public/uploads', $filename);
        } else {
            $imgUrl = FlickrController::uploadPhoto($file);
        }
        return $imgUrl;
    }
}
