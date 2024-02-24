<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class EventTags extends Model
{
    protected $table = 'event_tags';
    protected $primaryKey = 'id';
    protected $fillable = [
        'name',
        'created_by',
        'updated_by',
    ];

    public function eventOtherVersions(){
        return $this->hasMany(EventOtherVersion::class, 'tag_id', 'id');
    }
    
    public function events(){
        return $this->hasMany(Event::class, 'tag_id', 'id');
    }
}
