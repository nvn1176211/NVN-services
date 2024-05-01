<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Articles extends Model
{
    protected $table = 'articles';
    protected $primaryKey = 'id';

    public function article_votes(){
        return $this->hasMany(ArticleVotes::class, 'article_id', 'id');
    }
}
