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
        $api_token = request('api_token');
        $from = request('from');
        $size = request('size');
        $user_id = null;
        if ($api_token) {
            $user = User::where('api_token', $api_token)->select('id')->first();
            $user_id = $user ? $user->id : false;
        }
        $discussions = Discussions::where('name', 'like', '%'.$name.'%')
        ->join('user', 'discussions.created_by', 'user.id')
        ->when($user_id, function ($query) use ($user_id) {
            $query->leftJoin('discussion_votes', function ($join) use ($user_id) {
                $join->on('discussions.id', 'discussion_votes.discussion_id')->where('discussion_votes.created_by', $user_id);
            })->selectRaw('CASE WHEN discussion_votes.created_by IS NOT NULL THEN "yes" ELSE "no" END AS voted');
        }, function ($query) {
            $query->selectRaw('"no" AS voted');
        })
        ->addSelect('discussions.id', 'discussions.name', 'discussions.thumbnail', 'user.username as author_name', 'discussions.votes')
        ->selectRaw('DATE_FORMAT(discussions.created_at, "%Y/%m/%d %H:%i") as f1_created_at')
        ->selectRaw('? AS type', ['discussions']);
        $articles = Articles::where('name', 'like', '%'.$name.'%')
        ->join('user', 'articles.created_by', 'user.id')
        ->when($user_id, function ($query) use ($user_id) {
            $query->leftJoin('article_votes', function ($join) use ($user_id) {
                $join->on('articles.id', 'article_votes.article_id')->where('article_votes.created_by', $user_id);
            })->selectRaw('CASE WHEN article_votes.created_by IS NOT NULL THEN "yes" ELSE "no" END AS voted');
        }, function ($query) {
            $query->selectRaw('"no" AS voted');
        })
        ->addSelect('articles.id', 'articles.name', 'articles.thumbnail', 'user.username as author_name', 'articles.votes')
        ->selectRaw('DATE_FORMAT(articles.created_at, "%Y/%m/%d %H:%i") as f1_created_at')
        ->selectRaw('? AS type', ['articles']);
        $pages = $articles->unionAll($discussions)->orderBy('f1_created_at', 'desc');
        if($size) $pages->limit($size);
        if($from) $pages->offset($from);
        $pages = $pages->get();
        return response()->json([
            'pages' => $pages
        ], 200);
    }
}
