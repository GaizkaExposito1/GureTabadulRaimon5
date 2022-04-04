<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Like extends Model
{
    use HasFactory;
    public function users(){
        return $this->belongsToMany(User::class,'like_users','user_id', 'like_id')->withPivot('isAprender');
    }
    

}
