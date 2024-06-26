<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Discussions;
use App\Models\User;
use App\Models\Opinions;
use App\Models\DiscussionVotes;
use App\Http\Requests\VoteToggleRequest;
use App\Http\Requests\UpdateDiscussionRequest;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\StorePageRequest;

class DiscussionsController extends Controller
{
    /**
     * @param Interger $id
     * @return Object
     */
    public function show($id)
    {
        $api_token = request('api_token');
        $user_id = false;
        if ($api_token) {
            $user = User::where('api_token', $api_token)->select('id')->first();
            $user_id = $user ? $user->id : false;
        }
        $discussion = Discussions::where('discussions.id', $id)
            ->join('user', 'discussions.created_by', 'user.id')
            ->when($user_id, function ($query) use ($user_id) {
                $query->leftJoin('discussion_votes', function ($join) use ($user_id) {
                    $join->on('discussions.id', 'discussion_votes.discussion_id')->where('discussion_votes.created_by', $user_id);
                })->selectRaw('CASE WHEN discussion_votes.created_by IS NOT NULL THEN "yes" ELSE "no" END AS voted');
            }, function ($query) {
                $query->selectRaw('"no" AS voted');
            })
            ->addSelect('discussions.id', 'discussions.name', 'discussions.content', 'discussions.votes', 'user.username as author_name')
            ->selectRaw('CASE WHEN discussions.created_by = ? THEN "yes" ELSE "no" END AS is_your_own', [$user_id])
            ->selectRaw('DATE_FORMAT(discussions.created_at, "%Y/%m/%d %H:%i") as f1_created_at')
            ->first();
        $opinions = Opinions::where('discussion_id', $id)
            ->join('user', 'opinions.created_by', 'user.id')
            ->when($user_id, function ($query) use ($user_id) {
                $query->leftJoin('opinion_votes', function ($join) use ($user_id) {
                    $join->on('opinions.id', 'opinion_votes.opinion_id')->where('opinion_votes.created_by', $user_id);
                })->selectRaw('CASE WHEN opinion_votes.created_by IS NOT NULL THEN "yes" ELSE "no" END AS voted');
            }, function ($query) {
                $query->selectRaw('"no" AS voted');
            })
            ->selectRaw('CASE WHEN opinions.created_by = ? THEN "yes" ELSE "no" END AS is_your_own', [$user_id])
            ->addSelect('opinions.id', 'opinions.content', 'opinions.votes', 'user.username as author_name')
            ->selectRaw('DATE_FORMAT(opinions.created_at, "%Y/%m/%d %H:%i") as f1_created_at')
            ->orderBy('opinions.votes', 'desc')->orderBy('f1_created_at', 'asc')
            ->get();
        return response()->json([
            'discussion' => $discussion,
            'opinions' => $opinions,
        ], 200);
    }

    /**
     * @param VoteToggleRequest $request
     * @return Object
     */
    public function toggleVote(VoteToggleRequest $request)
    {
        $discussion_id = request('id');
        $user_id = Auth::user()->id;
        $vote = DiscussionVotes::where([
            ['discussion_id', $discussion_id],
            ['created_by', $user_id],
        ]);
        if ($vote->count()) {
            $vote->delete();
            $discussion = Discussions::find($discussion_id);
            $discussion->votes -= 1;
            $discussion->updated_at = date(config('constants.standard_datetime_format'));
            $discussion->updated_by = $user_id;
            $discussion->save();
            return response()->json([
                'message' => 'Vote deleted.'
            ], 200);
        } else {
            $discussionVote = new DiscussionVotes;
            $discussionVote->discussion_id = $discussion_id;
            $discussionVote->created_by = $user_id;
            $discussionVote->updated_by = $user_id;
            $discussionVote->save();
            $discussion = Discussions::find($discussion_id);
            $discussion->votes += 1;
            $discussion->updated_at = date(config('constants.standard_datetime_format'));
            $discussion->updated_by = $user_id;
            $discussion->save();
            return response()->json([
                'message' => 'Voted.'
            ], 201);
        }
    }

    /**
     * @param StorePageRequest $request
     * @return Object
     */
    public function store(StorePageRequest $request)
    {
        $user = Auth::user();
        $imgUrl = $request->thumbnail ? FilesController::storeImage($request->thumbnail) : '';
        $discussion = new Discussions;
        $discussion->name = $request->name;
        $discussion->content = $request->content;
        $discussion->votes = 1;
        $discussion->thumbnail = $imgUrl;
        $discussion->created_by = $user->id;
        $discussion->updated_by = $user->id;
        $discussion->save();
        $discussionVote = new DiscussionVotes;
        $discussionVote->discussion_id = $discussion->id;
        $discussionVote->created_by = $user->id;
        $discussionVote->updated_by = $user->id;
        $discussionVote->save();
        return response()->json([
            "author_name" => $user->username,
            "f1_created_at" => $discussion->created_at->format('Y/m/d H:i'),
            "id" => $discussion->id,
            "name" => $discussion->name,
            "thumbnail" => $discussion->thumbnail,
            "type" => 'discussions',
            "voted" => "yes",
            "votes" => 1,
        ], 201);
    }

    /**
     * @param UpdateDiscussionRequest $request
     * @param Interger $id
     * @return Object
     */
    public function update(UpdateDiscussionRequest $request, $id)
    {
        $user = Auth::user();
        $discussion = Discussions::find($id);
        try {
            $this->authorize('update', $discussion);
        } catch (\Exception $e) {
            return response([
                'message' => 'Forbidden.'
            ], 403);
        }
        $discussion->content = $request->content;
        $discussion->updated_at = date(config('constants.standard_datetime_format'));
        $discussion->save();
        return response()->json([
            "voted" => $discussion->discussion_votes->where('created_by', $user->id)->count() ? "yes" : 'no',
            "is_your_own" => "yes",
            "id" => $discussion->id,
            "content" => $discussion->content,
            "votes" => $discussion->votes,
            "author_name" => $user->username,
            "f1_created_at" => $discussion->created_at->format('Y/m/d H:i')
        ], 200);
    }
}
