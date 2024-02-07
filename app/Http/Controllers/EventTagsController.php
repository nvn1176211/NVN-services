<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use App\Models\EventTags;
use App\Http\Requests\StoreEventTagRequest;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Auth;

class EventTagsController extends Controller 
{
    //api
    public function index()
    {
        $eventTags = EventTags::select('name', 'id')->get();
        return response()->json([
            'event_tags'=> $eventTags
        ], 200);
    }

    //api
    public function store(StoreEventTagRequest $request)
    {
        EventTags::create([
            'name' => $request->name,
            'created_by'=> Auth::user()->id,
            'updated_by'=> Auth::user()->id,
        ]);
        return response()->json([
            'message' => 'Event tag added.'
        ], 201);
    }
}
