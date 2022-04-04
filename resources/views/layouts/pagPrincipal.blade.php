@push ('css')
<link href="{{URL::asset('./css/pagPrincipal.css')}}" rel="stylesheet ">
<link href="https://fonts.googleapis.com/css2?family=Nova+Round&family=Permanent+Marker&display=swap" rel="stylesheet">
<script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>
@endpush
@extends('layouts.masterpage')
@section('titulo', "Principal")
@section('contenido')

<div id="video">
    <video autoplay muted loop controls>
    <source src="{{ URL::asset('assets/video/gureTabadul.mp4')}}" type="video/mp4" />
    <img src="{{ URL::asset('assets/img/1.jpg')}}" alt="Video no soportado" />
    </video>
    <a id="mostrar-home" href="{{route('home')}}">Saltar video</a>
</div>



@endsection
