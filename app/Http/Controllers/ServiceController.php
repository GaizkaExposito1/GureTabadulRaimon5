<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Language;

class ServiceController extends Controller
{
    public function index()
    {
        return view('tabadul.servicios');
    }
}
