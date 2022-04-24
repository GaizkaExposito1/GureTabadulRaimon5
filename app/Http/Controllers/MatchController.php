<?php

namespace App\Http\Controllers;

use App\Models\match;
use App\Models\User;
use App\Models\State;
use App\Models\likeUser;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class MatchController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //se sacan los todos los matches, todos los usuarios, todos los estados y todos los gustos de usuarios
        $match =    Match::all();
        $usuarios=  User::all();
        $estados=   State::all();
        $likes=     likeUser::all();
        return view('layouts.adminintercambios.intercambios',['matchs'=> $match, 'usuarios'=>$usuarios, 'estados'=>$estados, 'likeUsers'=>$likes]);
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
    public function store($userid)
    {
        $GustosUser=LikeUser::Where('user_id',$userid)->get();
        $matchesguardadosOBJ=Match::all();
        $matches=[];
        foreach ($GustosUser as $gusto) {
            $matches[]=LikeUser::Where('like_id',$gusto->id)->get();
        }
        if($matches==null){
            $aviso=new noMatchesController();
            $username=User::find($userid)->name;
            $aviso->store($username);
        }else{
        foreach ($matches as $k=> $match) {
            //get user from user id
            $u=User::Where('id',$match[0]->user_id)->first();
            
               if($u->acepted == 0){
                   unset($matches[$k]);
               }
               foreach ($matchesguardadosOBJ as $mg) {
                if(($mg->user1_id==$u->id && $mg->user2_id==$userid) || ($mg->user2_id==$u->id && $mg->user1_id==$userid)){
                    unset($matches[$k]);
                   }
               }
                if(($match[0]->isAprender==0 && $gusto->isAprender==0) || ($match[0]->isAprender==1 && $gusto->isAprender==1)){
                    unset($matches[$k]);
                }
            }
        if($matches==null){
            $aviso=new noMatchesController();
            $username=User::find($userid)->name;
            $aviso->store($username);
        }else{
            
            foreach ($matches as $match) {
                $m=new Match();
                $m->user1_id=$userid;
                $m->user2_id=$match[0]->user_id;
                $m->estado=1;
            try{
             //Almacenar en la BD
                $m->save();
                 //Volver al listado
                 //Mensaje de OK
                    \Session::flash('tipoMensaje','success');
                    \Session::flash('mensaje','El match ha sido creado correctamente');

            }catch(\Exception $e){
             //echo $e->getMessage();
             //Mensaje de KO
                \Session::flash('tipoMensaje','danger');
                \Session::flash('mensaje','error al crear el match');


            }
            }
        }
    }

    }


        public function filtrar(Request $request){
            $data=$request->all();
            $filtro=$data['filtro'];
            $dato=$data['dato'];
        //devolver varios match dependiendo del estado
            if($filtro=="estado"){
            $match=Match::Where('estado',$dato)->get();
            if (is_null($match)){
            \Session::flash('tipoMensaje','danger');
            \Session::flash('mensaje','No se han encontrado matches para ese filtro');
            return \Redirect::back();
            }
            else
            {
                $usuarios=  User::all();
                $estados=   State::all();
                return view('layouts.adminintercambios.intercambios',['matchs'=> $match,'usuarios'=>$usuarios, 'estados'=>$estados]);
            }
        }
        elseif ($filtro=="user_id") {
            //se consiguen todos los matche sen los k este ese usuario
            $match1=Match::Where('user1_id',$dato)->get();
            $match2=Match::Where('user2_id',$dato)->get();
            $ARmatch1=[];$ARmatch2=[];
            foreach ($match1 as $m) {
                $ARmatch1[]=$m;
            }
            foreach ($match2 as $m) {
                $ARmatch2[]=$m;
            }
            //se mergean los 2 arrays en uno
            $match=array_merge($ARmatch1,$ARmatch2);
            if (is_null($match)){
            \Session::flash('tipoMensaje','danger');
            \Session::flash('mensaje','No se han encontrado matches para ese usuario');
            return \Redirect::back();
            }
            else
            {
                $usuarios=  User::all();
                $estados=   State::all();
                return view('layouts.adminintercambios.intercambios',['matchs'=> $match,'usuarios'=>$usuarios, 'estados'=>$estados]);
            }
        }
        elseif ($filtro=="name") {
            //se consguie el usuario con ese nombre
            $usuariosEncont=User::Where('name', 'LIKE', '%'.$dato.'%')->get();
            if (is_null($usuariosEncont)){
                \Session::flash('tipoMensaje','danger');
                \Session::flash('mensaje','No se han encontrado el usuario');
                return \Redirect::back();
                }
                $match=null;
            foreach ($usuariosEncont as $usu) {    
            //se consiguen todos los matche sen los k este ese usuario
            $match1=Match::Where('user1_id',$usu->id)->get();
            $match2=Match::Where('user2_id',$usu->id)->get();
            $ARmatch1=[];$ARmatch2=[];
            foreach ($match1 as $m) {
                $ARmatch1[]=$m;
            }
            foreach ($match2 as $m) {
                $ARmatch2[]=$m;
            }
            //se mergean los array
            if(is_null($match)){
                $match=array_merge($ARmatch1,$ARmatch2);
            }else{
                $match= array_merge($match, array_merge($ARmatch1,$ARmatch2));
            }
            $match=array_unique($match,SORT_REGULAR );
            }
            if (is_null($match)){
            \Session::flash('tipoMensaje','danger');
            \Session::flash('mensaje','No se han encontrado matches para ese usuario');
            return \Redirect::back();
            }
            else
            {
                $usuarios=  User::all();
                $estados=   State::all();
                return view('layouts.adminintercambios.intercambios',['matchs'=> $match,'usuarios'=>$usuarios, 'estados'=>$estados]);
            }
        }

        }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\match  $match
     * @return \Illuminate\Http\Response
     */
    public function show($dato,$filtro)
    {

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\match  $match
     * @return \Illuminate\Http\Response
     */
    public function edit(match $match)
    {

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\match  $match
     * @return \Illuminate\Http\Response
     */
    public function cambiarEstado(Request $request)
    {
        //change el estado a pendiente, denegado, aprovado
        $data=$request->all();
        $match_id=intval($data['match_id']);
        $match=Match::find($match_id);

        $data=$request->all();
        $match->estado=$data['estado'];
        $match->save();
        return \Redirect::back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\match  $match
     * @return \Illuminate\Http\Response
     */
    public function destroy(match $match)
    {
        $match->delete();
        \Session::flash('TipoMensaje','info');
            \Session::flash('mensaje','match borrado correctamente');
        return \Redirect::back();
    }
}
