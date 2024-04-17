<?php

namespace App\Policies;

use App\Models\Opinions;
use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class OpinionsPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the user can update the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Opinions  $opinion
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function update(User $user, Opinions $opinion)
    {
        return $user->id === $opinion->created_by;
    }
}
