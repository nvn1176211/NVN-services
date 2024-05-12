<?php

namespace App\Policies;

use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;
use Illuminate\Support\Facades\Hash;

class UserPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the user can update the model.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function update(User $user, User $model, $password)
    // public function update(User $user, $password)
    {
        // return false;
        // dd($user->password);
        return Hash::check($password, $user->password);
        // dd($user->password, $password);
        // return 1;
        // return $user->password === $password;
    }
}
