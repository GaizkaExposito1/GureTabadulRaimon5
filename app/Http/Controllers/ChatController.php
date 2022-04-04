<?php

namespace App\Http\Controllers;

use App\Models\chat;
use App\Http\Controllers\Controller;
use App\Models\Message;
use App\Models\User;
use Illuminate\Http\Request;

class ChatController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //busca todos los chat
        $chats = Chat::all();
        //busca todos los usuarios
        $users=User::all();
        $usersSinChat=[];
        $chatsUserId=[];
        //crea un array de sus id
        foreach ($chats as $c) {
            $chatsUserId[]=$c->user_id;
        }
        //crea un array de usuarios sin chat y rol usuario
        foreach ($users as $u) {
            if(!in_array($u->id,$chatsUserId) && $u->role_id==3){
                $usersSinChat[]=$u;
            }
        }

        //te mueve a la vista con los chats y los usuarios sin chat
        return view('tabadul.bandeja',['chats'=> $chats,'usersSinChat'=>$usersSinChat]);
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
        //Recibir datos
        $datos=$request->all();
        //Validar datos
        $rules= array (
         'user_id' => 'required'
        );

        $messages= array (
         'user_id.required' => 'Campo name es requerido'
        );

        $validador= \Validator::make($datos,$rules,$messages);
        if($validador->fails()){
             $errors=$validador->messages();
             $errors->add('mierror','Se ha cancelado la creación del chat.');
             \Session::flash('tipoMensaje','danger');
             \Session::flash('mensaje','Error, no se cumplen las validaciones. Compruebe todos los campos');
             //Volver con los errores

             return \Redirect::back()->withInput()->withErrors($validador);
         }else{

                 //Generar chat
                 $chat=new Chat();
                 $chat->user_id=intval($datos["user_id"]);
             try{
                 //Almacenar en la BD
                 $chat->save();
                     //Volver al listado
                     //Mensaje de OK
                     \Session::flash('tipoMensaje','success');
                     \Session::flash('mensaje','chat creado correctamente');

             }catch(\Exception $e){
                 //echo $e->getMessage();
                 //Mensaje de KO
                 \Session::flash('tipoMensaje','danger');
                 \Session::flash('mensaje','Error al crear el chat');


             }
             return \Redirect::back();
     }
    }

    public function buscarChat($id)
    {
        //busca el chat por user id que esta logeado
        $chat=Chat::Where('user_id',$id)->first();
        if($chat==null){
            //si el chat es null se crea uno nuevo
            $chat=new Chat();
            $chat->user_id=$id;
        }
        //consigue todos los mensajes de ese chat
        $sms=Message::Where('chat_id',$chat->id)->get();
       if (is_null($chat)){
       \Session::flash('tipoMensaje','danger');
       \Session::flash('mensaje','no existe el chat');
       return \Redirect::back();
       }
       else
       {
        //Devolvemos la vista de chat desde usuario con el chat y los mensajes
        return view('tabadul.Uchat',['chat'=> $chat,'sms'=>$sms]);
       }
    }
/**
     * Display the specified resource.
     *
     * @param  \App\Models\chat  $chat
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //busca el chat seleccionado por su id
        $chat=Chat::find($id);
        //busca todos los mensajes del chat
        $sms=Message::Where('chat_id',$id)->get();
       if (is_null($chat)){
       \Session::flash('tipoMensaje','danger');
       \Session::flash('mensaje','no existe el chat');
       return \Redirect::back();
       }
       else
       {
        //Devolvemos la vista con el chat y los mensajes
        return view('tabadul.chat',['chat'=> $chat,'sms'=>$sms]);
       }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\chat  $chat
     * @return \Illuminate\Http\Response
     */
    public function edit(chat $chat)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\chat  $chat
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $chat)
    {
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\chat  $chat
     * @return \Illuminate\Http\Response
     */
    public function destroy(chat $chat)
    {
        //busca todos los mensajes del chat y los elimina
        $mensajes=Message::Where('chat_id',$chat->id)->get();
        foreach ($mensajes as $sms) {
            $sms->delete();
        }
        //elimina el chat
        $chat->delete();
        \Session::flash('TipoMensaje','info');
            \Session::flash('mensaje','chat borrado correctamente');
        return \Redirect::back();
    }
}
