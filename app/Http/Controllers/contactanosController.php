<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Mail\ContactanosMailable;
use Illuminate\Support\Facades\Mail;
use App\Mail\contactanos;
class contactanosController extends Controller
{
    public function index()
    {
        return view('contactanos.index');

    }
    public function store(Request $request)
    {
        //alerta al usuario
        \Session::flash('tipoMensaje','sucess');
        \Session::flash('mensaje','Correo Enviado');
        //se cogen todos los datos de la request
        $contacto=$request->all();
        //se crea un nuevo mailable
        $correo=new contactanos($contacto);
        //se envia el email
        Mail::to('raimon4GureTabadul@gmail.com')->queue($correo);
        return \Redirect::back();
    }
}
