<?php

namespace App\Http\Controllers;

use App\Models\Message;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class MessageController extends Controller
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
        //Recibir datos
        $datos=$request->all();
        //Validar datos
        $rules= array (
            'user_id' => 'required',
        );

        $messages= array (
            'user1_id.required' => 'Campo name es requerido',
        );

        $validador= \Validator::make($datos,$rules,$messages);
        if($validador->fails()){
                $errors=$validador->messages();
                $errors->add('mierror','Se ha cancelado la creación del match denegado.');
                \Session::flash('tipoMensaje','danger');
                \Session::flash('mensaje','Error, no se cumplen las validaciones. Compruebe todos los campos');
             //Volver con los errores

                return \Redirect::back()->withInput()->withErrors($validador);
            }else{

                 //Generar mensaje
                    $sms=new Message();
                    $sms->isAdmin=intval($datos["isAdmin"]);
                    $sms->chat_id=intval($datos["chat_id"]);
                    $sms->text=$datos["text"];


                try{
                 //Almacenar en la BD
                    $sms->save();
                     //Volver al listado
                     //Mensaje de OK
                        \Session::flash('tipoMensaje','success');
                        \Session::flash('mensaje','El mensaje ha sido creado correctamente');

                }catch(\Exception $e){
                 //echo $e->getMessage();
                 //Mensaje de KO
                    \Session::flash('tipoMensaje','danger');
                    \Session::flash('mensaje','error al crear el mensaje');


                }
                return \Redirect::back();
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\message  $message
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\message  $message
     * @return \Illuminate\Http\Response
     */
    public function edit(message $message)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\message  $message
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,  $message)
    {
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\message  $message
     * @return \Illuminate\Http\Response
     */
    public function destroy(message $message)
    {
    }
}
