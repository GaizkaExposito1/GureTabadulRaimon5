<?php

namespace App\Http\Controllers;

use App\Models\Like;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Language;

class LikeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //saca todos los gustos y te redirige a la pagina de de registrar gustos
        $likes = Like::all();
        return view('auth.registerGustos',['likes'=> $likes]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {

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
     * @param  \App\Models\Like  $Like
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Like  $Like
     * @return \Illuminate\Http\Response
     */
    public function edit(Like $Like)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Like  $Like
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $like)
    {
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Like  $Like
     * @return \Illuminate\Http\Response
     */
    public function destroy(Like $like)
    {
    }
}
