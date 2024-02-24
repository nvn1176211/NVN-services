<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use App\Models\Event;
use App\Models\EventTags;
use App\Models\Votes;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\StoreEventRequest;
use App\Http\Requests\VoteToggleRequest;
use DB;

class EventController extends Controller 
{
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
            // dd($movedEventOtherVersion->get());
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
     * @return Json
     */
    public function toggleVote(VoteToggleRequest $request){
        $event_id = request('event_id');
        $user_id = Auth::user()->id;
        $orgVotes = Votes::where([
            ['event_id', $event_id],
            ['user_id', $user_id],
        ]);
        if($orgVotes->count()){
            $orgVotes->delete();
            $event = Event::find($event_id);
            $event->votes -= 1;
            $event->updated_at = date(config('constants.standard_datetime_format'));
            $event->updated_by = $user_id;
            $event->save();
            $this->updateTagThumbnail($event->tag_id);
            return response()->json([
                'message' => 'Vote deleted.'
            ], 200);
        }else{
            Votes::create([
                'user_id' => $user_id,
                'event_id' => $event_id,
                'created_by' => $user_id,
                'updated_by' => $user_id,
            ]);
            $event = Event::find($event_id);
            $event->votes += 1;
            $event->updated_at = date(config('constants.standard_datetime_format'));
            $event->updated_by = $user_id;
            $event->save();
            $this->updateTagThumbnail($event->tag_id);
            return response()->json([
                'message' => 'Voted.'
            ], 201);
        }
    }

    /**
     * api
     * @param Interger $tagId
     * @return Void
     */
    public function updateTagThumbnail($tagId){
        $mostVotedEvent = Event::where('tag_id', $tagId)->orderBy('votes', 'desc')->orderBy('updated_at', 'desc')->first();
        if($mostVotedEvent){
            $thumbnail = $mostVotedEvent->thumbnail;
            $eventTag = EventTags::find($tagId);
            $eventTag->thumbnail = $thumbnail;
            $eventTag->save();
        }
    }
}
