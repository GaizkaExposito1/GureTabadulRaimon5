<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class Admin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {

        //Verificar si el usuario que esta intentando acceder al recurso es administrador
        if(Auth::check() && (Auth::user()->role_id==0 || Auth::user()->role_id==1)){
            //Puedes pasar
           return $next($request);
        }else{
            \Session::flash('TipoMensaje','danger');
            \Session::flash('mensaje','No tiene suficiente privilegios para acceder a este recurso');
            return \Redirect::back();
        }

        return $next($request);
    }
}
