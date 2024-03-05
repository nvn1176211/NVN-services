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
        $domain = url('/');
        if (
            $domain == env('AWARDSPACE_API_HOST')
            || $domain == env('LOCAL_API_HOST')
        ) {
            $requestTime = getdate()[0];
            $filename = $requestTime . '.' . $file->getClientOriginalExtension();
            $imgUrl = route('api.cors_img', ['img_name' => $filename]);
            $file->storeAs('public/uploads', $filename);
        } else {
            $imgUrl = FlickrController::uploadPhoto($file);
        }
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
        $newEvent->votes = 1;
        $newEvent->thumbnail = $newData['thumbnail'];
        $newEvent->year = $newData['year'];
        $newEvent->month = $newData['mon'];
        $newEvent->day = $newData['mday'];
        $newEvent->content = $newData['content'];
        $newEvent->created_by = $user->id;
        $newEvent->updated_by = $user->id;
        $newEvent->save();
        $pageCount = Event::where('tag_id', $request->tag)->count();
        $tag = EventTags::find($request->tag);
        $tag->pages += 1;
        $tag->updated_at = date(config('constants.standard_datetime_format'));
        $tag->updated_by = $user->id;
        if ($pageCount == 1) {
            $tag->thumbnail = $imgUrl;
        }
        $tag->save();
        $votes = new Votes;
        $votes->event_id = $newEvent->id;
        $votes->user_id = $user->id;
        $votes->created_by = $user->id;
        $votes->updated_by = $user->id;
        $votes->save();
        return response()->json([
            'message' => 'Event added.'
        ], 201);
    }

    /**
     * api
     * @param  Interger  $eventId
     * @return Json
     */
    public function delete($eventId)
    {
        $event = Event::find($eventId);
        if (!$event) {
            return response()->json([
                'message' => "Not found"
            ], 404);
        }
        $eventTag = EventTags::find($event->tag_id);
        $eventTag->pages -= 1;
        $eventTag->save();
        Votes::where('event_id', $eventId)->delete();
        $event->delete();
        return response()->json([
            'message' => 'Event page deleted.'
        ], 200);
    }

    /**
     * api
     * @return Json
     */
    public function toggleVote(VoteToggleRequest $request)
    {
        $event_id = request('event_id');
        $user_id = Auth::user()->id;
        $orgVotes = Votes::where([
            ['event_id', $event_id],
            ['user_id', $user_id],
        ]);
        if ($orgVotes->count()) {
            $orgVotes->delete();
            $event = Event::find($event_id);
            $event->votes -= 1;
            $event->updated_at = date(config('constants.standard_datetime_format'));
            $event->updated_by = $user_id;
            $event->save();
            $this->updateTagThumbnail($event->tag_id, $user_id);
            return response()->json([
                'message' => 'Vote deleted.'
            ], 200);
        } else {
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
            $this->updateTagThumbnail($event->tag_id, $user_id);
            return response()->json([
                'message' => 'Voted.'
            ], 201);
        }
    }

    /**
     * api
     * @param Interger $tagId
     * @param Interger $user_id
     * @return Void
     */
    public function updateTagThumbnail($tagId, $user_id)
    {
        $mostVotedEvent = Event::where('tag_id', $tagId)->orderBy('votes', 'desc')->orderBy('updated_at', 'desc')->first();
        if ($mostVotedEvent) {
            $thumbnail = $mostVotedEvent->thumbnail;
            $eventTag = EventTags::find($tagId);
            $eventTag->thumbnail = $thumbnail;
            $eventTag->updated_at = date(config('constants.standard_datetime_format'));
            $eventTag->updated_by = $user_id;
            $eventTag->save();
        }
    }

    public function corsImg()
    {
        $imgPath = storage_path('app/public/uploads/'. request('img_name'));
        return response()->download($imgPath);
    }
}
