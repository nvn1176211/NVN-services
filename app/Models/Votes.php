<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Votes extends Model
{
    protected $table = 'votes';
    protected $primaryKey = 'id';

    protected $fillable = [
        'event_id',
        'user_id',
        'created_by',
        'updated_by',
    ];
}
