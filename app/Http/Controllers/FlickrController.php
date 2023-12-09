<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Http;

class FlickrController extends Controller 
{
    private const API_KEY = "5a0a79df41719e3aa3616b99770af87b";
    public const O_SIZE = 'o';//original
    
    public static function testLogin(){
        $response = Http::get('https://www.flickr.com/services/rest?method=flickr.test.login&format=json&oauth_consumer_key=5a0a79df41719e3aa3616b99770af87b&oauth_token=72157720902088765-be1004c0721483bc&oauth_signature_method=HMAC-SHA1&oauth_timestamp=1701927386&oauth_nonce=MGBUgmCBM9R&oauth_version=1.0&oauth_callback=http%3A%2F%2Fexample.com&oauth_verifier=74a8c3ac088a820b&oauth_signature=5QUGZMrx%2FeeR1aYRv2aCUfKsj0s%3D');
        dd($response->body());
    }

    public static function uploadPhoto($img){
        $filename = strtotime('now').'.'.$img->getClientOriginalExtension();
        $response = Http::withHeaders([
            'Authorization' => 'OAuth oauth_consumer_key="5a0a79df41719e3aa3616b99770af87b",oauth_token="72157720902088765-be1004c0721483bc",oauth_signature_method="HMAC-SHA1",oauth_timestamp="1701927541",oauth_nonce="pZa314KURHJ",oauth_version="1.0",oauth_signature="CsOYWBQ4WcbvGQ%2FtPUweJrvd%2F7A%3D"',
        ])->attach(
            'photo', file_get_contents($img), $filename
        )->post('https://up.flickr.com/services/upload/');
        if($response->status() != 200) return false;
        $stringXml = $response->body();
        $objXml = simplexml_load_string($stringXml);
        $photoId = (String) $objXml->photoid;
        $imgUrl = self::generateImgUrl($photoId);
        return $imgUrl;
    }
    
    /**
     * @param String $photoId
     *
     * @return String
     */
    protected static function generateImgUrl(String $photoId){
        $response = Http::get('https://www.flickr.com/services/rest/?method=flickr.photos.getInfo', [
            'method' => 'flickr.photos.getInfo',
            'api_key' => self::API_KEY,
            'photo_id' => $photoId,
        ]);
        if($response->status() != 200) return false;
        $stringXml = $response->body();
        $objXml = simplexml_load_string($stringXml);
        $originalsecret = (String) $objXml->photo['originalsecret'];
        $server = (String) $objXml->photo['server'];
        $imgUrl = "https://live.staticflickr.com/".$server."/".$photoId."_".$originalsecret."_".self::O_SIZE.".jpg";
        return $imgUrl;
    }
}