<?php

namespace App\Policies;

use App\Models\Discussions;
use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class DiscussionsPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the user can update the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Discussions  $opinion
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function update(User $user, Discussions $discussion)
    {
        return $user->id === $discussion->created_by;
    }
}
