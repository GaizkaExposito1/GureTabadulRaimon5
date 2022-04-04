<?php

namespace App\Http\Controllers;

use App\Models\workshopUser;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Workshop;
use Illuminate\Support\Facades\Validator;
use Carbon\Carbon;
class WorkshopUserController extends Controller
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
        //comprobar si es usuario visitante o ya registrado
        $user;
        //comprueba si el usuario es registrado o no
        if($datos["user_id"]=="0"){
            //si no es registrado crea un usuario visitante en le cual cambia el email añadiendole
            //la fecha para que se pueda registar en multiples cosas
            $dt = Carbon::now()->format('Y-m-d H:i:s');
            $user=new User();
            $user->role_id=4;
            $user->name=$datos["name"];
            $user->email=$datos["email"].$dt;
            $user->password="visitante";
            $user->save();
        }else{
            //es usuario registrado se usa este
            $user=User::find(\Auth::user()->id);

        }
        //Recibir datos

        //Validar datos
    $rules= array (
        'user_id' => 'required',
        'workshop_id' =>'required',
    );

    $messages= array (
        'user_id.required' => 'Campo user_id es requerido',
        'workshop_id.required' => 'Campo workshop_id es requerido',
        );

        $validador= Validator::make($datos,$rules,$messages);
        if($validador->fails()){
            $errors=$validador->messages();
            $errors->add('mierror','Se ha cancelado la creación del taller Usuario.');
            \Session::flash('tipoMensaje','danger');
            \Session::flash('mensaje','Error, no se cumplen las validaciones. Compruebe todos los campos');
            //Volver con los errores

            return \Redirect::back()->withInput()->withErrors($validador);
        }else{
            $talleresU = WorkshopUser::all();
            $talleres=[];$talleresID=[];
            foreach ($talleresU as $t) {
                $talleres[]=$t->user_id;
            }
            foreach ($talleresU as $t) {
                $talleresID[]=$t->workshop_id;
            }
            //se comprueba que el usuario no este apuntado ya a ese taller
            if(in_array($user->id,$talleres) && in_array(intval($datos["workshop_id"]),$talleresID)){                \Session::flash('tipoMensaje','danger');
                \Session::flash('tipoMensaje','danger');
                \Session::flash('mensaje','Ya te has apuntado a ese taller');
            //Volver con los errores
            return \Redirect::back()->withInput()->withErrors($validador);
            }
                 //Generar tallerUsuario
                $tallerU=new WorkshopUser();
                $tallerU->user_id=$user->id;
                $tallerU->workshop_id=intval($datos["workshop_id"]);
            try{
                 //Almacenar en la BD
                $tallerU->save();
                //Almacenar el archivo en el servido
                    //Volver al listado
                    //Mensaje de OK
                \Session::flash('tipoMensaje','success');
                \Session::flash('mensaje','Te has apuntado correctamente');

            }catch(\Exception $e){
                //echo $e->getMessage();
                //Mensaje de KO
                \Session::flash('tipoMensaje','danger');
                \Session::flash('mensaje','Error al crear el taller');


            }
            return \Redirect::back();

    }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\workshopUser  $workshopUser
     * @return \Illuminate\Http\Response
     */
    public function show( $id)
    {

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\workshopUser  $workshopUser
     * @return \Illuminate\Http\Response
     */
    public function edit(workshopUser $workshopUser)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\workshopUser  $workshopUser
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,  $workshop)
    {

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\workshopUser  $workshopUser
     * @return \Illuminate\Http\Response
     */
    public function destroy(workshopUser $workshopUser)
    {
        //el usuario se desapunta al taller
        $workshopUser->delete();
        \Session::flash('TipoMensaje','success');
            \Session::flash('mensaje','Te has desapuntado');
        return \Redirect::back();
    }
}
