<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use App\Models\Event;
use App\Models\EventOtherVersion;
use App\Models\EventTags;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\App;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\StoreEventRequest;
use DB;

class EventController extends Controller 
{
    public function event($id)
    {
        return view('pages.event.event', [
            'id' => $id,
        ]);
    }

    public function eventOtherVersion($id)
    {
        return view('pages.event.event', [
            'id' => $id,
            'IsOtherVersion' => 1,
        ]);
    }

    public function getCreate()
    {
        return view('pages.event.create');
    }

    //api
    public function index(Request $request)
    {
        $name = $request->search;
        $lang = $request->lang;
        $events = EventTags::where('name', 'like', '%'.$name.'%')->join('events', 'event_tags.id', 'events.tag_id')->select('events.id', 'event_tags.name', 'events.thumbnail', 'events.year')->orderBy('events.created_at', 'desc')->get();
        App::setLocale($lang);
        $see_more = __('labels.see_more');
        return [
            'events' => $events,
            'links' => [
                'store' => route('api.events.store'),
            ]
        ];
    }

    //api -- show a event page
    public function show($id)
    {
        $event = Event::where('events.id', $id)
        ->join('user', 'events.created_by', 'user.id')
        ->join('event_tags', 'events.tag_id', '=', 'event_tags.id')
        ->select('events.id', 'events.thumbnail', 'events.year', 'events.content', 'user.username as created_by', 'event_tags.name')
        ->selectRaw('DATE_FORMAT(events.created_at, "%Y/%m/%d %H:%i") as f1_created_at')
        ->first();
        $o_another_versions = Event::where('events.id', $id)
        ->join('event_tags', 'events.tag_id', 'event_tags.id')
        ->join('event_other_versions', 'event_tags.id', 'event_other_versions.tag_id')
        ->join('user', 'event_other_versions.created_by', 'user.id')
        ->select('event_other_versions.id', 'user.username as created_by')
        ->selectRaw('DATE_FORMAT(event_other_versions.created_at, "%Y/%m/%d %H:%i") as av_create_at')
        ->orderBy('av_create_at', 'desc')
        ->get();
        $another_versions = [];
        foreach($o_another_versions as $item){
            $another_versions[] = [
                'id' => $item->id,
                'f1_created_at' => $item->av_create_at,
                'created_by' => $item->created_by,
            ];
        }
        $thumbnailLink = route('api.event.thumbnail', ['id' => $id]);
        return [
            'event' => $event,
            'another_version' => $another_versions,
            'links' => [
                'thumbnail' => $thumbnailLink,
            ],
        ];
    }

    //api -- show another version of event page
    public function showOtherVersion($id)
    {
        $event = EventOtherVersion::where('event_other_versions.id', $id)
        ->join('user', 'event_other_versions.created_by', 'user.id')
        ->join('event_tags', 'event_other_versions.tag_id', '=', 'event_tags.id')
        ->select('event_other_versions.id', 'event_other_versions.thumbnail', 'event_other_versions.year', 'event_other_versions.content', 'event_tags.name', 'user.username as created_by')
        ->selectRaw('DATE_FORMAT(event_other_versions.created_at, "%Y/%m/%d %H:%i") as f1_created_at')
        ->first();
        $thumbnailLink = route('api.event.thumbnail', ['id' => $id]);
        return [
            'event' => $event,
            'links' => [
                'thumbnail' => $thumbnailLink,
            ],
        ];
    }

    //api
    public function store(StoreEventRequest $request)
    {
        $user = Auth::user();
        $file = $request->thumbnail;
        $imgUrl = FlickrController::uploadPhoto($file);
        $datetimeInfo = getdate(strtotime($request->datetime));
        $newData = [
            'tag_id' => $request->tag,
            'thumbnail' => $imgUrl,
            'year' => $datetimeInfo['year'],
            'mon' => $datetimeInfo['mon'],
            'mday' => $datetimeInfo['mday'],
            'content' => $request->content,
            'created_by' => $user->id,
            'updated_by' => $user->id,
        ];
        $newEvent = new Event;
        $newEvent->tag_id = $newData['tag_id'];
        $newEvent->thumbnail = $newData['thumbnail'];
        $newEvent->year = $newData['year'];
        $newEvent->month = $newData['mon'];
        $newEvent->day = $newData['mday'];
        $newEvent->content = $newData['content'];
        $newEvent->created_by = Auth::user()->id;
        $newEvent->updated_by = Auth::user()->id;
        $newEvent->save();
        $oldEvent = Event::where('tag_id', $newData['tag_id'])->where('id', '<>', $newEvent->id);
        if($oldEvent->count()){
            DB::table('event_other_versions')->insertUsing(
                ['tag_id', 'thumbnail', 'year', 'month', 'day', 'content', 'created_by', 'updated_by', 'created_at', 'updated_at'],
                $oldEvent->select('tag_id', 'thumbnail', 'year', 'month', 'day', 'content', 'created_by', 'updated_by', 'created_at', 'updated_at')
            );
        }
        $oldEvent->delete();
        return response()->json([
            'message' => 'Event added.'
        ], 201);
    }

    //api
    public function apiThumbnail($id)
    {
        $url = 'https://live.staticflickr.com/65535/53317112738_0b276efde9_z.jpg';
        return response(file_get_contents($url), 200, [
            'Content-Disposition' => 'attachment; filename="filename.png"',
        ]);
        
        // $thumbnail = Event::find($id)->thumbnail;
        // $filepath = storage_path('app/public/uploads/'.$thumbnail);
        // return Response::download($filepath); 
    }

    /**
     * api
     * @param  Interger  $eventId
     * @return Json
     */
    public function delete($eventId){
        $event = Event::find($eventId);
        if(!$event){
            return response()->json([
                'message' => "Not found"
            ], 404);
        }
        $tag_id = $event->tag_id;
        $eventPagesRemain = DB::table('events')->where('events.tag_id', $tag_id)->unionAll(DB::table('event_other_versions')->where('event_other_versions.tag_id', $tag_id))->count();
        if($eventPagesRemain <= 1){
            return response()->json([
                'message' => "You can't delete last event page."
            ], 403);
        }else{
            $movedEventOtherVersion = EventOtherVersion::where('event_other_versions.tag_id', $tag_id)
            ->select('tag_id', 'thumbnail', 'year', 'month', 'day', 'content', 'created_by', 'updated_by', 'created_at', 'updated_at')->orderBy('created_at', 'desc')->limit(1);
            DB::table('events')->insertUsing(
                ['tag_id', 'thumbnail', 'year', 'month', 'day', 'content', 'created_by', 'updated_by', 'created_at', 'updated_at'],
                $movedEventOtherVersion
            );
            $event->delete();
            $movedEventOtherVersion->delete();
            return response()->json([
                'message' => 'Event page deleted.'
            ], 200);
        }
    }

    /**
     * api
     * @param  Interger  $eventId
     * @return Json
     */
    public function deleteOtherVersion($eventOtherVersionId){
        $eventOtherVersion = EventOtherVersion::find($eventOtherVersionId);
        if(!$eventOtherVersion){
            return response()->json([
                'message' => "Not found"
            ], 404);
        }
        $eventOtherVersion->delete();
        return response()->json([
            'message' => 'Event page deleted.'
        ], 200);
    }
}
