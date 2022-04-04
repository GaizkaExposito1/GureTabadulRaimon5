<?php

namespace App\Http\Controllers;

use App\Models\LikeUser;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class LikeUserController extends Controller
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
        $datos=$request->all();
        //coge el dato de is Aprender
        $Apr=intval($datos["isAprender"]);
        //Recibir datos
        foreach ($datos["like_id"] as $gusto) {
        //Validar datos
        $rules= array (
         'like_id' => 'required'
        );

        $messages= array (
         'like_id.required' => 'Campo like_id es requerido'
        );

        $validador= Validator::make($datos,$rules,$messages);
        if($validador->fails()){
             $errors=$validador->messages();
             $errors->add('mierror','Se ha cancelado la creación del chat.');
             \Session::flash('tipoMensaje','danger');
             \Session::flash('mensaje','Error, no se cumplen las validaciones. Compruebe todos los campos');
             //Volver con los errores

             return \Redirect::back()->withInput()->withErrors($validador);
         }else{

                 //Generar LikeUser
                 $likeU=new LikeUser();
                 $likeU->user_id=\Auth::user()->id;
                 $likeU->like_id=$gusto;
                 $likeU->isAprender=$Apr;

             try{
                 //Almacenar en la BD
                 $likeU->save();
                     //Volver al listado
                     //Mensaje de OK
                     \Session::flash('tipoMensaje','success');
                     \Session::flash('mensaje','gustoUsuario creado correctamente');

             }catch(\Exception $e){
                 //echo $e->getMessage();
                 //Mensaje de KO
                 \Session::flash('tipoMensaje','danger');
                 \Session::flash('mensaje','Error al crear el gustoUsuario');


             }
     }
    }
    return \Redirect::back();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\likeUser  $likeUser
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\likeUser  $likeUser
     * @return \Illuminate\Http\Response
     */
    public function edit(likeUser $likeUser)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\likeUser  $likeUser
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $datos=$request->all();
        //se cogen los datos de is APrender
        $Apr=intval($datos["isAprender"]);
        $gustosId=[];
        //Se consiguen todos los gustos de ese usuario que sean aprender
        if($Apr==1){
            $likeApr=LikeUser::Where('user_id',$id)->Where('isAprender',1)->get();
            $uLikes=[];$uLikesID=[];
            foreach ($likeApr as $l) {
               $uLikes[]=$l;
               $uLikesID[]=$l->id;
            }
            //se comprueban si exiten en el array de datos, si es asi se elimina
            foreach ($uLikes as $l) {
                if(!in_array($l->id,$datos["like_id"])){
                    $l->delete();
                }
            }
            //se reccoren los datos y se compueban si el gusto exite en este array de likeUser
            //si no es asi se crea ese nuevo gusto y se añade
            foreach ($datos["like_id"] as $gusto) {
                if(!in_array($gusto,$uLikesID)){
                    $likeU=new LikeUser();
                    $likeU->user_id=$id;
                    $likeU->like_id=$gusto;
                    $likeU->isAprender=$Apr;
                    $likeU->save();
                }
            }
        }
        //Se consiguen todos los gustos de ese usuario que NO sean aprender
        elseif($Apr==0){
            $likeNApr=LikeUser::Where('user_id',$id)->Where('isAprender',0)->get();
            $uLikes=[];$uLikesID=[];
            foreach ($likeNApr as $l) {
               $uLikes[]=$l;
               $uLikesID[]=$l->id;
            }
            //se comprueban si exiten en el array de datos, si es asi se elimina
            foreach ($uLikes as $l) {
                if(!in_array($l->id,$datos["like_id"])){
                    $l->delete();
                }
            }
            //se reccoren los datos y se compueban si el gusto exite en este array de likeUser
            //si no es asi se crea ese nuevo gusto y se añade
            foreach ($datos["like_id"] as $gusto) {
                if(!in_array($gusto,$uLikesID)){
                    $likeU=new LikeUser();
                    $likeU->user_id=$id;
                    $likeU->like_id=$gusto;
                    $likeU->isAprender=$Apr;
                    $likeU->save();
                }
            }
        }

        return \Redirect::back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\likeUser  $likeUser
     * @return \Illuminate\Http\Response
     */
    public function destroy(likeUser $likeUser)
    {
        //se elimina el gusto
        $likeUser->delete();
        \Session::flash('TipoMensaje','info');
            \Session::flash('mensaje','gusto del usuario borrado correctamente');
        return \Redirect::back();
    }
}
