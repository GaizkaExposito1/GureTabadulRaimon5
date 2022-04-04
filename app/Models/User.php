<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\SoftDeletes;

class User extends \TCG\Voyager\Models\User
{
    use HasFactory, Notifiable;
    use SoftDeletes;
    protected $dates = ['deleted_at'];
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password','banned'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
    public function likes(){
        return $this->belongsToMany(Like::class,'like_users','user_id', 'like_id')->withPivot('isAprender');

    }
    public function matchs(){
        return $this->belongsToMany(User::class,'matchs','user1_id', 'user2_id')->withPivot('estado');
    }
    public function workshops(){
        return $this->belongsToMany(Workshop::class,'workshop_users','user_id', 'workshop_id')->withPivot('id');
    }

    public function chats(){
        return $this->hasOne(Chat::class);
    }


}
