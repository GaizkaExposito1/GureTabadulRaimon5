<?php

namespace App\Http\Controllers;

use App\Models\Sponsor;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Language;

class SponsorController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
      
        //saca todas las empresas
        $patrocinadores = Sponsor::all();
        return view('tabadul.empresas',['sponsors'=> $patrocinadores]);
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
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\sponsor  $sponsor
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\sponsor  $sponsor
     * @return \Illuminate\Http\Response
     */
    public function edit(sponsor $sponsor)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\sponsor  $sponsor
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $sponsor)
    {
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\sponsor  $sponsor
     * @return \Illuminate\Http\Response
     */
    public function destroy(sponsor $sponsor)
    {

    }
}
