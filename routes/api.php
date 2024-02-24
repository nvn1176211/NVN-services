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
    Route::post('events', 'EventController@store')->name('api.events.store');
    Route::post('votes/toggle', 'EventController@toggleVote');
    Route::post('event_tags', 'EventTagsController@store')->name('api.event_tags.store');
    Route::get('user', 'UserController@index')->name('api.user');
    Route::post('logout', 'LoginController@logout')->name('api.logout');
});

Route::middleware('auth:admin_api')->group(function(){
    Route::get('events/{id}/delete', 'EventController@delete');
});

Route::get('event_tags', 'EventTagsController@index')->name('api.event_tags');
Route::get('event_tags/{id}', 'EventTagsController@show');