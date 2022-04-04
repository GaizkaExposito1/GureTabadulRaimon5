@push ('css')
<link href="{{URL::asset('./css/tienda.css')}}" rel="stylesheet ">
<link href="https://fonts.googleapis.com/css2?family=Nova+Round&family=Permanent+Marker&display=swap" rel="stylesheet">
<script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>
@endpush

@extends('layouts.masterpage')
@section('titulo', "Tienda")
@section('contenido')



<h1 id="prox">
    {{__("language.shop-soon")}}
</h1>
<div class="cargando"></div>
@include('layouts.chatBtn')
{{-- include btn -> chat --}}
@endsection
