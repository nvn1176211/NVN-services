<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Requests\VoteToggleRequest;
use App\Http\Requests\StoreOpinionRequest;
use App\Http\Requests\UpdateOpinionRequest;
use App\Models\OpinionVotes;
use App\Models\Opinions;
use Illuminate\Support\Facades\Auth;

class OpinionsController extends Controller
{
    /**
     * @param VoteToggleRequest $request
     * @return Object
     */
    public function toggleVote(VoteToggleRequest $request)
    {
        $opinion_id = request('id');
        $user_id = Auth::user()->id;
        $vote = OpinionVotes::where([
            ['opinion_id', $opinion_id],
            ['created_by', $user_id],
        ]);
        if ($vote->count()) {
            $vote->delete();
            $opinion = Opinions::find($opinion_id);
            $opinion->votes -= 1;
            $opinion->updated_at = date(config('constants.standard_datetime_format'));
            $opinion->updated_by = $user_id;
            $opinion->save();
            return response()->json([
                'message' => 'Vote deleted.'
            ], 200);
        } else {
            $opinionVote = new OpinionVotes;
            $opinionVote->opinion_id = $opinion_id;
            $opinionVote->created_by = $user_id;
            $opinionVote->updated_by = $user_id;
            $opinionVote->save();
            $opinion = Opinions::find($opinion_id);
            $opinion->votes += 1;
            $opinion->updated_at = date(config('constants.standard_datetime_format'));
            $opinion->updated_by = $user_id;
            $opinion->save();
            return response()->json([
                'message' => 'Voted.'
            ], 201);
        }
    }

    /**
     * @param StoreOpinionRequest $request
     * @return Object
     */
    public function store(StoreOpinionRequest $request)
    {
        $user = Auth::user();
        $opinion = new Opinions;
        $opinion->content = $request->content;
        $opinion->discussion_id = $request->discussion_id;
        $opinion->votes = 1;
        $opinion->created_by = $user->id;
        $opinion->updated_by = $user->id;
        $opinion->save();
        $opinionVote = new OpinionVotes;
        $opinionVote->opinion_id = $opinion->id;
        $opinionVote->created_by = $user->id;
        $opinionVote->updated_by = $user->id;
        $opinionVote->save();
        return response()->json([
            "voted" => "yes",
            "is_your_own" => "yes",
            "id" => $opinion->id,
            "content" => $opinion->content,
            "votes" => 1,
            "author_name" => $user->username,
            "f1_created_at" => $opinion->created_at->format('Y/m/d H:i')
        ], 201);
    }

    /**
     * @param UpdateOpinionRequest $request
     * @param Interger $id
     * @return Object
     */
    public function update(UpdateOpinionRequest $request, $id)
    {
        $user = Auth::user();
        $opinion = Opinions::find($id);
        try {
            $this->authorize('update', $opinion);
        } catch (\Exception $e) {
            return response([
                'message' => 'Forbidden.'
            ], 403);
        }
        $opinion->content = $request->content;
        $opinion->updated_at = date(config('constants.standard_datetime_format'));
        $opinion->save();
        return response()->json([
            "voted" => $opinion->opinion_votes->where('created_by', $user->id)->count() ? "yes" : 'no',
            "is_your_own" => "yes",
            "id" => $opinion->id,
            "content" => $opinion->content,
            "votes" => $opinion->votes,
            "author_name" => $user->username,
            "f1_created_at" => $opinion->created_at->format('Y/m/d H:i')
        ], 200);
    }
}
