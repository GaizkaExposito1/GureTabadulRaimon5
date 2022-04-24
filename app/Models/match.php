<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Match extends Model
{
    use HasFactory;

    //$m->user1()-> .. . .
    public function user1(){
        $user=User::find($this->user1_id);
        return $user;
    }
    public function user2(){
        $user=User::find($this->user2_id);
        return $user;
    }
}
