<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Discussions extends Model
{
    protected $table = 'discussions';
    protected $primaryKey = 'id';

    public function opinions(){
        return $this->hasMany(Opinions::class, 'discussion_id', 'id');
    }
}
