<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\FileUploads;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class FilesController extends Controller
{
    /**
     * @param Object $file
     * @return String
     */
    public static function storeImage($file)
    {
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

    public function corsImg()
    {
        $imgPath = storage_path('app/public/uploads/' . request('img_name'));
        return response()->file($imgPath);
    }

    /**
     * @param Request $request
     * @return Response
     */
    public function ckImgUpload(Request $request)
    {
        $messages = [
            'max' => 'The image upload failed because the image was too big (max :maxKB).',
        ];
        $validator = Validator::make($request->all(), [
            'upload' => 'required|image|max:1500',
        ], $messages);
        if($validator->stopOnFirstFailure()->fails()){
            return response()->json([
                'error' => [
                    'message' => $validator->errors()->first('upload')
                ]
            ], 422);
        }
        $imgUrl = FilesController::storeImage($request->upload);
        $api_token = $request->api_token;
        $user =  User::whereNotNull('api_token')->where('api_token', $api_token)->first();
        $fileUpload = new FileUploads();
        $fileUpload->created_by = $user->id;
        $fileUpload->updated_by = $user->id;
        $fileUpload->save();
        return response()->json([
            'url' => $imgUrl,
        ]);
    }

    /**
     * @param String $idfileName
     * @return Response
     */
    public function cdn($fileName)
    {
        return response()->file(public_path($fileName), [
            'Content-Type' => 'application/javascript; charset=utf-8'
        ]);
    }
}
