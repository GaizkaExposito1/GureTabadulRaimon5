<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Workshop extends Model
{
    use HasFactory;
    public function users(){
        return $this->belongsToMany(User::class,'workshop_users','user_id', 'workshop_id')->withPivot('id');
    }
}
