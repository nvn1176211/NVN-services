<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Roles extends Model
{
    protected $table = 'roles';
    protected $primaryKey = 'id';
    public static $adminRoleId = '1';
    public static $userRoleId = '2';
    
    public function users(){
        return $this->belongsToMany(User::class, 'roles_users', 'user_id', 'role_id');
    }
}