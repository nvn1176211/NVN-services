<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Articles;
use App\Models\Discussions;
use Illuminate\Http\Request;

class PagesController extends Controller
{
    /**
     * @param Request $request
     * @return Object
     */
    public function index(Request $request)
    {
        $name = $request->search;
        // $api_token = request('api_token');
        // $user_id = false;
        // if ($api_token) {
        //     $user = User::where('api_token', $api_token)->select('id')->first();
        //     $user_id = $user ? $user->id : false;
        // }
        $discussions = Discussions::where('name', 'like', '%'.$name.'%')
        ->join('user', 'discussions.created_by', 'user.id')
        ->select('discussions.id', 'discussions.name', 'discussions.thumbnail', 'user.username as author_name')
        ->selectRaw('DATE_FORMAT(discussions.created_at, "%Y/%m/%d %H:%i") as f1_created_at')
        ->selectRaw('? AS type', ['discussions']);
        $articles = Articles::where('name', 'like', '%'.$name.'%')
        ->join('user', 'articles.created_by', 'user.id')
        ->select('articles.id', 'articles.name', 'articles.thumbnail', 'user.username as author_name')
        ->selectRaw('DATE_FORMAT(articles.created_at, "%Y/%m/%d %H:%i") as f1_created_at')
        ->selectRaw('? AS type', ['articles']);
        $pages = $articles->unionAll($discussions)->orderBy('f1_created_at', 'desc')->get();
        return response()->json([
            'pages' => $pages
        ], 200);
    }
}
