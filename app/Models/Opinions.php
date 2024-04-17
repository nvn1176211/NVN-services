<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Opinions extends Model
{
    protected $table = 'opinions';
    protected $primaryKey = 'id';

    public function opinion_votes(){
        return $this->hasMany(OpinionVotes::class, 'opinion_id', 'id');
    }
}
