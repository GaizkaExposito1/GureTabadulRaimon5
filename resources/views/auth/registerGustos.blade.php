@extends('layouts.masterpage')
@section('contenido')
@push ('css')
<link href="{{URL::asset('./css/registerGustos.css')}}" rel="stylesheet ">
  <script src="{{URL::asset('./js/registerGustos.js')}}"></script>

@endpush
<h1>Bienvenida usuaria</h1>
<div class="grid-container">
<form class="form1" action="{{route('likeUser.store')}}" method="post"  enctype="multipart/form-data"  >
    {{csrf_field()}}
        <h3 class="h22">¿Qué puedo enseñar?</h3>
        @foreach ($likes as $like)
        <div class="check22">
            <input class="form-check-input" name="isAprender" type="hidden" value="0" id="flexCheckDefault">
            <input class="form-check-input" name="like_id[{{$like->id}}]" type="checkbox" value="{{$like->id}}" id="flexCheckDefault">
            <label class="form-check-label" for="flexCheckDefault">
                {{$like->name}}
            </label>
        </div>
        @endforeach
        <div class="grid-item">
            <button class="btn1" >Enseñar</button>
        </div>
    </form>

    <form class="form2" action="{{route('likeUser.store')}}" method="post"  enctype="multipart/form-data"  >
        <h3 class="h22">¿Qué quieres aprender?</h3>
        @foreach ($likes as $like)
        <div class="check22">
        <input class="form-check-input" name="isAprender" type="hidden" value="1" id="flexCheckDefault">
            <input class="form-check-input" name="like_id[{{$like->id}}]" type="checkbox" value="{{$like->id}}" id="flexCheckDefault">
            <label class="form-check-label" for="flexCheckDefault">
                {{$like->name}}
            </label>
        </div>
        @endforeach
        <div class="grid-item">
            <button class="btn2">Aprender</button>
        </div>
    </form>
</div>

{{-- *************************************************************************************** --}}

<div class="grid-item">
    <a id="btnAceptar" href="{{route('home')}}">Aceptar</a>
</div>
@endsection




