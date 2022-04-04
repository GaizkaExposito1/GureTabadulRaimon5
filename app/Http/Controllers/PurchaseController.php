<?php

namespace App\Http\Controllers;

use App\Models\purchase;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class PurchaseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $purchases = Purchase::all();
        return view('purchase.index',['purchases'=> $purchases]);
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
         'purchase_date' => 'required',
         'user_id' => 'required',
         'cart_id' => 'required',
        );

        $messages= array (
         'purchase_date.required' => 'Campo date es requerido',
         'user_id.required' => 'Campo user_id es requerido',
         'cart_id.required' => 'Campo cart_id es requerido'
        );

        $validador= Validator::make($datos,$rules,$messages);
        if($validador->fails()){
             $errors=$validador->messages();
             $errors->add('mierror','Se ha cancelado la creación de la compra.');
             \Session::flash('tipoMensaje','danger');
             \Session::flash('mensaje','Error, no se cumplen las validaciones.Compruebe todos los campos');
             //Volver con los errores

             return \Redirect::back()->withInput()->withErrors($validador);
         }else{

                 //Generar patrocinador
                 $purchase=new Purchase();
                 $purchase->name=$datos["name"];
                 $purchase->purchase_date=$datos["purchase_date"];
                 $purchase->user_id=$datos["user_id"];
                 $purchase->cart_id=$datos["cart_id"];
             try{
                 //Almacenar en la BD
                 $purchase->save();

                     //Volver al listado
                     //Mensaje de OK
                     \Session::flash('tipoMensaje','success');
                     \Session::flash('mensaje','patrocinador se ha creado correctamente');

             }catch(\Exception $e){
                 //echo $e->getMessage();
                 //Mensaje de KO
                 \Session::flash('tipoMensaje','danger');
                 \Session::flash('mensaje','Error al crear el patrocinador');


             }
             return \Redirect::back();
     }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\purchase  $purchase
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\purchase  $purchase
     * @return \Illuminate\Http\Response
     */
    public function edit(purchase $purchase)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\purchase  $purchase
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, purchase $purchase)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\purchase  $purchase
     * @return \Illuminate\Http\Response
     */
    public function destroy(purchase $purchase)
    {
        //
    }
}
