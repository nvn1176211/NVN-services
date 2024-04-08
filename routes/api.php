<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::post('register', 'RegisterController@apiRegist')->name('api.users.regist');
Route::post('login', 'LoginController@login')->name('api.login');

Route::middleware('auth:api')->group(function(){
    Route::post('articles', 'ArticlesController@store');
    Route::post('articles/{id}', 'ArticlesController@update');
    Route::post('discussions', 'DiscussionsController@store');
    Route::post('opinions', 'OpinionsController@store');
    Route::post('discussion_votes/toggle', 'DiscussionsController@toggleVote');
    Route::post('opinion_votes/toggle', 'OpinionsController@toggleVote');
    Route::post('article_votes/toggle', 'ArticlesController@toggleVote');
    Route::get('user', 'UserController@index')->name('api.user');
    Route::get('register_history', 'UserController@registerHistory');
    Route::post('logout', 'LoginController@logout')->name('api.logout');
});

Route::middleware('auth:admin_api')->group(function(){
    Route::get('events/{id}/delete', 'EventController@delete');
});

Route::get('pages', 'PagesController@index');
Route::get('articles/{id}', 'ArticlesController@show');
Route::get('discussions/{id}', 'DiscussionsController@show');
Route::get('cors_img', 'FilesController@corsImg')->name('api.cors_img')->middleware('cors');
Route::post('ckeditor_image_upload', 'FilesController@ckImgUpload')->middleware('ckfinderUpload');
Route::get('cdn/{file}', 'FilesController@cdn')->middleware('cors');