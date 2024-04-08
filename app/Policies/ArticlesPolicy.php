<?php

namespace App\Policies;

use App\Models\Articles;
use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class ArticlesPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the user can update the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Articles  $articles
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function update(User $user, Articles $articles)
    {
        return $user->id === $articles->created_by;
    }
}
