<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LikeUser extends Model
{
    use HasFactory;
    public function likes(){
        return $this->belongsToMany(Like::class,'like_users','user_id', 'like_id')->withPivot('isAprender');

    }
    public function users(){
        return $this->belongsToMany(User::class,'like_users','user_id', 'like_id')->withPivot('isAprender');
    }
}
