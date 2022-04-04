<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Language;

class videoController extends Controller
{
    public function index()
    {
        //obtienes la pag del video
        return view('layouts.pagPrincipal');
    }
}
