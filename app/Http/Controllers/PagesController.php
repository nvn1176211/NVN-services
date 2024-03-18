<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Articles;
use App\Models\Discussions;
use Illuminate\Http\Request;
use App\Http\Requests\StorePageRequest;
use Illuminate\Support\Facades\Auth;

class PagesController extends Controller
{
    /**
     * @param Request $request
     * @return Json
     */
    public function index(Request $request)
    {
        $name = $request->search;
        $discussions = Discussions::select('id', 'name', 'thumbnail', 'updated_at')->selectRaw('? AS type', ['discussions'])->where('name', 'like', '%'.$name.'%');
        $articles = Articles::select('id', 'name', 'thumbnail', 'updated_at')->selectRaw('? AS type', ['articles'])->where('name', 'like', '%'.$name.'%');
        $pages = $articles->unionAll($discussions)->orderBy('updated_at', 'desc')->get();
        return response()->json([
            'pages' => $pages
        ], 200);
    }
}
