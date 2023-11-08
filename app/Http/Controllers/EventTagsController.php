<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use App\Models\EventTags;
use Illuminate\Support\Facades\App;

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
}
