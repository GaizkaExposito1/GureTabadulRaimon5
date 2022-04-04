@push('css')

<link href="{{URL::asset('./css/empresas.css')}}" rel="stylesheet ">
<link href="https://fonts.googleapis.com/css2?family=Nova+Round&family=Permanent+Marker&display=swap" rel="stylesheet">
<script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>
@endpush
@section('titulo', "Empresas")
@extends('layouts.masterpage')
@section('contenido')

<h1>{{__("language.collab-compa")}}</h1>
<section id="empresas">
    <div class="row">
        @foreach ($sponsors as $sponsor)
        <div class="col-md-4 col-6 d-flex justify-content-around">
            <div id="" class="">
                <a class="link" href={{$sponsor->url}} target="__blank">
                    <img id="resize"  src='storage/{{$sponsor->imgUrl}}' alt="logo de {{$sponsor->name}}">
                    <p class="promocionar-empresas">{{$sponsor->name}}</p>
                </a>
                {{-- end a --}}
            </div>
            {{-- end div --}}
        </div>
        {{-- end col-md-4 --}}
        @endforeach
        {{-- end foreach --}}
    </div>
    {{-- end row --}}
</section>
{{-- end section --}}

<div class="text-aling-center">
    <form id="formulario" class="row gy-2 gx-3 align-items-center" action="{{route('contactanosP.store')}}" method="post">
            @csrf
        <div id="promo">
            <h2>{{__("language.advertise")}}</h2>
        </div>
        {{-- end promo --}}
        <div id="form">
            <div class="mb-3">
                <label for="name" class="form-label">{{__("language.company-name")}}</label>
                <input type="text" name="name" class="form-control" id="name" aria-describedby="name">
            </div>
            {{-- end mb-3 --}}
            <div class="mb-3">
                <label for="exampleInputemail" class="form-label">{{__("language.contact-mail")}}</label>
                <input type="email" name="email"  class="form-control" id="exampleInputemail">
            </div>
            {{-- end mb-3 --}}
            <button id="btnSend" type="submit" class="btn btn-primary">{{__("language.btn-send")}}</button>
        </div>
        {{-- end form --}}
    </form>
    {{-- end form --}}
</div>
{{-- end text-align-center --}}
@include('layouts.chatBtn')
{{-- include btn -> chat --}}
@endsection
