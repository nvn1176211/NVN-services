<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use App\Models\EventTags;
use App\Models\User;
use App\Http\Requests\StoreEventTagRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class EventTagsController extends Controller 
{
    //api
    public function index(Request $request)
    {
        $name = $request->search;
        $eventTags = EventTags::where([
            ['name', 'like', '%'.$name.'%'],
            ['pages', '>', 0],
        ]
        )->select('id', 'name', 'thumbnail')->orderBy('updated_at', 'desc')->get();
        return response()->json([
            'eventTags' => $eventTags,
            'links' => [
                'store' => route('api.event_tags.store'),
            ]
        ], 200);
    }

    //api
    public function simpleIndex()
    {
        $eventTags = EventTags::select('id', 'name')->orderBy('name', 'asc')->get();
        return response()->json([
            'eventTags' => $eventTags,
            'links' => [
                'store' => route('api.event_tags.store'),
            ]
        ], 200);
    }

    //api
    public function show($id)
    {
        $api_token = request('api_token');
        $user_id = false;
        if($api_token){
            $user = User::where('api_token', $api_token)->select('id')->first();
            $user_id = $user ? $user->id : false;
        }
        $event_tag = EventTags::where('id', $id);
        $events = $event_tag->first()->events();
        $processedEvents = $events->join('user', 'events.created_by', 'user.id')
        ->when($user_id, function($query) use($user_id){
            $query->leftJoin('votes', function($join) use($user_id){
                $join->on('events.id', 'votes.event_id')->where('votes.user_id', $user_id);
            })->selectRaw('CASE WHEN votes.user_id IS NOT NULL THEN "yes" ELSE "no" END AS voted');
        }, function($query){
            $query->selectRaw('"no" AS voted');
        })
        ->addSelect('events.id', 'events.thumbnail', 'events.votes', 'events.content', 'user.username as author_name')
        ->selectRaw('DATE_FORMAT(events.created_at, "%Y/%m/%d %H:%i") as f1_created_at')
        ->orderBy('events.votes', 'desc')->orderBy('f1_created_at', 'asc')
        ->get();
        return response()->json([
            'event_tag' => $event_tag->select('name')->first(),
            'events' => $processedEvents,
        ], 200);
    }

    //api
    public function store(StoreEventTagRequest $request)
    {
        EventTags::create([
            'name' => $request->name,
            'pages' => 0,
            'created_by'=> Auth::user()->id,
            'updated_by'=> Auth::user()->id,
        ]);
        return response()->json([
            'message' => 'Event tag added.'
        ], 201);
    }
}
