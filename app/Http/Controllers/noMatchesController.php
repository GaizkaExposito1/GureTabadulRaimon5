<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Mail\ContactanosMailable;
use Illuminate\Support\Facades\Mail;
use App\Mail\noMatches;
class noMatchesController extends Controller
{
    // public function index()
    // {
    //     return view('contactanos.index');

    // }
    public function store(string $nomUser)
    {
        //se cogen todos los datos de la request
        //$contacto=$request->all();
        //se crea un nuevo mailable
        $correo=new noMatches($nomUser);
        //se envia el email
        Mail::to('raimon4GureTabadul@gmail.com')->queue($correo);
        //return \Redirect::back();
    }
}
