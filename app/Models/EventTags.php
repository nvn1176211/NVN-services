<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class EventTags extends Model
{
    protected $table = 'event_tags';
    protected $primaryKey = 'id';

    public function eventOtherVersions(){
        return $this->hasMany(EventOtherVersion::class, 'tag_id', 'id');
    }
    
    public function event(){
        return $this->hasOne(Event::class, 'tag_id', 'id');
    }
}
