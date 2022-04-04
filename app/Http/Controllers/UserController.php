<?php

namespace App\Http\Controllers;
use App\Models\User;
use App\Models\Like;
use App\Models\Match;
use App\Models\LikeUser;
use App\Models\Language;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //CREA UN USUARIO ADMINISTRADOR desde 0
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //encuentra al usuario que esta logueado
        $user=User::find($id);
        //obtiene sus gustos
        $userLikes=LikeUser::Where('user_id',$id)->Where('isAprender',0)->get();
        $userLikesA=LikeUser::Where('user_id',$id)->Where('isAprender',1)->get();
        $likesALL=Like::all();
        $likes=[];$likesu=[];$likesA=[];$likesuA=[];
        foreach ($userLikes as $l) {
            $likesu[]=$l->like_id;
        }
        foreach ($likesALL as $l) {
            if(!in_array($l->id,$likesu)){
                $likes[]=$l;
            }
        }
        foreach ($userLikesA as $l) {
            $likesuA[]=$l->like_id;
        }
        foreach ($likesALL as $l) {
            if(!in_array($l->id,$likesuA)){
                $likesA[]=$l;
            }
        }
        //obtine sus matches
        $match1=Match::Where('user1_id',$id)->get();
        $match2=Match::Where('user2_id',$id)->get();
        $ARmatch1=[];$ARmatch2=[];
        foreach ($match1 as $m) {
            $ARmatch1[]=$m;
        }
        foreach ($match2 as $m) {
            $ARmatch2[]=$m;
        }
        $match=array_merge($ARmatch1,$ARmatch2);
        if (is_null($user)){
        \Session::flash('tipoMensaje','danger');
        \Session::flash('mensaje','no existe el usuario');
        return \Redirect::back(); }
        else
        {
         //Devolvemos la vista
         return view('tabadul.perfil',['usuario'=> $user,'todosGustos'=>$likes,'todosGustosA'=>$likesA,'matches'=>$match]);
    }
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //editas los datos del perfil
        $user=User::find($id);

        $data=$request->all();
        $user->address=$data['address'];
        $user->village=$data['village'];
        $user->country=$data['country'];
        $user->phone=$data['phone'];
        $user->email=$data['email'];
        $user->save();
        // $request->file('imagen')->move('images/plotters',$nombreimagen);
        return \Redirect::back();

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
    }


}
