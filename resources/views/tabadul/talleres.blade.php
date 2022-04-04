@push ('css')
<link href="{{URL::asset('./css/talleres.css')}}" rel="stylesheet ">
<link href="https://fonts.googleapis.com/css2?family=Nova+Round&family=Permanent+Marker&display=swap" rel="stylesheet">
<script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>
@endpush
@section('titulo', "Cursos y Talleres")
@extends('layouts.masterpage')
@section('contenido')

<h1 id="title">{{__("language.work-courses")}}</h1>
<!-- filtros -->
<div id="selectores" class="row selects">
        <div class=" justify-content-between text-center col-md-4 col-12">
            <form action="{{route('filtrar')}}" method="post">
                @csrf
                <select name="dato" id="selectUsuarios">
                    <option value="value1" selected disabled>Todos los talleres</option>
                    @foreach ($talleres as $taller)
                        <option value="{{$taller->id}}">{{$taller->name}}</option>
                    @endforeach
                </select>
                {{-- end select --}}
                <input class="form-check-input" name="filtro" type="hidden" value="user_id" id="flexCheckDefault">
                <button type="submit" class="Boton">Buscar</button>
            </form>
            {{-- end form --}}
        </div>
        {{-- end justify-content --}}
    <div class=" justify-content-between text-center col-md-4 col-12">
        <form action="{{route('filtrar')}}" method="post">
            @csrf

            <label for="startDate">Desde</label>
            <input id="startDate" class="form-control" type="date" />

            <label for="endDate">Hasta</label>
            <input id="endDate" class="form-control" type="date" />

        </form>
        {{-- end form --}}
    </div>
    {{-- end justify-content --}}
    <div class="justify-content-between text-center col-md-4 col-12">
        <form action="{{route('filtrar')}}" method="post">
        @csrf
            <input type="search" placeholder="Search.." name="dato">
            <input class="form-check-input" name="filtro" type="hidden" value="name" id="flexCheckDefault">
            <button type="submit"><i class="fas fa-search"></i></button>
            @csrf
        </form>
        {{-- end form --}}
    </div>
    {{-- end justify-content --}}
  </div>
  {{-- end selectores --}}
<!--listado talleres-->
    <div class="grid-container">
        <!-- se sacan todos los talleres y se comprueban que las plazas en estos sean mayores que los apuntados-->
        @foreach ($talleres as $i=>$taller)
        @if($apuntados[$i]<$taller->plazas)
        <div class="grid-item">
            <div class="imgBx">
                <img src={{$taller->imgUrl}} alt="">
            </div>
            {{-- end imgBx --}}

            <div class="content">
                <h2 id="tallerNombre" >{{$taller->name}}</h2>
                <p>{{$taller->description}}</p>
                <p> {{__("language.date")}} {{$taller->date}}</p>
                @if ($taller->precio == 0)
                  <p> {{__("language.price-free")}}</p>
                @else
                    <p> {{__("language.price")}} {{$taller->precio}}€</p>
                @endif
                @if (Auth::check())
                <form action="{{route('workshopUser.store')}}" method="POST" enctype="multipart/form-data">
                    {{csrf_field()}}
                    <input type="hidden" name="user_id" value="Auth::user()->id"/>
                    <input type="hidden" name="workshop_id" value="{{$taller->id}}"/>
                    <button type="submit" class="btn " id="button">{{__("language.sign-up-for")}}</button>
                </form>
                {{-- end form --}}
                @else
                    <button type="button" class="btn" id="button" data-bs-toggle="modal" data-bs-target="#cursos">{{__("language.sign-up-for")}}</button>
                @endif
            </div>
            {{-- end content --}}
        </div>
        @endif
        @endforeach
        {{-- end grid-item --}}
    </div>
    {{-- end grid-container --}}
     <div class="modal fade" id="cursos" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
        <form class="row " action="{{route('workshopUser.store')}}" method="post"  enctype="multipart/form-data"  >
                {{csrf_field()}}
             <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title ms-3 mt-2" id="modal-tittle">{{__("language.work-courses")}}</h5>
                            <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close"></button>
                         </div>{{-- end header --}}
                                {{-- end modal-dialog --}}
                             <div class="modal-body">
                                <div>
                                    <label for="nombre" class="form-label">{{__("language.name-label")}}</label>
                                    <input type="text" class="form-control" id="name" name="name">
                                </div>
                                    {{-- end div --}}
                                <div>
                                    <label for="modal-email" class="form-label">{{__("language.mail-label")}}</label>
                                    <input type="email" class="form-control" id="modal-email" name="email"  placeholder='{{__("language.mail-input")}}'>
                                </div>
                                    {{-- end div --}}
                                    <input type="hidden" name="user_id" value='0'/>
                                    <input type="hidden" name="workshop_id" value='{{$taller->id}}'/>
                            </div>
                                {{-- end modal-body --}}

                                <!-- <div class="modal-footer"> -->
                                <div class="modal-footer">
                                    <button id="btn-apuntarse" class="btn">{{__("language.sign-up-2")}}</button>
                                    <div id="lblBtnlogin">
                                        <label>{{__("language.user-yes-no")}}</label>
                                        <a href="{{route('login')}}"  class="btn-login">{{__("language.login")}}</a>
                                    </div>
                                    {{-- end lblBtnlogin --}}
                                </div>
                        {{-- end modal-footer --}}
                    </div>
                    {{-- end modal-content --}}
             </div>
        </form> {{-- end form --}}

     </div>
        {{-- modal fade --}}



@include('layouts.chatBtn')
{{-- include btn -> chat --}}

@endsection

