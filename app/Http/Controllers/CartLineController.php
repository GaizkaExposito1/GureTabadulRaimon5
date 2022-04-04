<?php

namespace App\Http\Controllers;

use App\Models\cartLine;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class CartLineController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\cartLine  $cartLine
     * @return \Illuminate\Http\Response
     */
    public function show(cartLine $cartLine)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\cartLine  $cartLine
     * @return \Illuminate\Http\Response
     */
    public function edit(cartLine $cartLine)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\cartLine  $cartLine
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, cartLine $cartLine)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\cartLine  $cartLine
     * @return \Illuminate\Http\Response
     */
    public function destroy(cartLine $cartLine)
    {
        //
    }
}
