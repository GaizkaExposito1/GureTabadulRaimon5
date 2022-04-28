@push ('css')
<link href="{{URL::asset('./css/bienvenida.css')}}" rel="stylesheet ">
<link href="https://fonts.googleapis.com/css2?family=Nova+Round&family=Permanent+Marker&display=swap" rel="stylesheet">
<script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>
 <script src="{{ URL::asset('./js/bienvenida.js') }}"></script>
@endpush
@extends('layouts.masterpage')
@section('titulo', "Principal")
@section('contenido')

<!-- aqui ira la animacion  -->
<section id="anima">
    <div class="contenedorCubo">
        <div class="cubo">
            <div class="cara" id="uno"><img class="carai" src="assets/img/CaraI1.png"></div>
            <div class="cara" id="seis"><img class="carai"  src="assets/img/CaraI2.png"></div>
        </div>
        <div class="cubo">
            <div class="cara" id="uno"><img  class="carad" src="assets/img/caraD1.png"></div>
            <div class="cara" id="seis"><img class="carad"  src="assets/img/caraD2.png"></div>
        </div>
    </div>
</section>


{{-- fin pagPrincipal --}}
<div id="btns" class="row ">
    <div class="col-6  d-flex justify-content-center">
        <a href="#contacto"><button id="btnContacto"  >{{__("language.btn-contact")}}</button></a>
    </div>
    {{-- end col-6 --}}
    <div class="col-6  d-flex justify-content-between">
        <a  href="#about"> <button id="btnAbout">{{__("language.quienesSomos")}}</button></a>
    </div>
    {{-- end col-6 --}}
</div>
{{-- fin btns --}}
<div id="about">
    <h1>{{__("language.quienesSomos")}}</h1>
    <p> {{__("language.pQS")}} </p>
    <img id="groupP" src="assets/img/1.png" alt="nochuclaaestawea" >
</div>
{{-- fin about --}}

<div id="part2">
    <h2>{{__("language.little-changes")}}</h2>
    <p id="p1">
        {{__("language.mind-plat")}}
        <br/>
        {{__("language.women-grow")}}
        <br/>
        {{__("language.options")}}
    </p>
    {{-- end p1 --}}
    <div id="options">
        <p id="p2"><span class="iconify" data-icon="ph:caret-right-fill" style="color: #181818;" data-width="30" data-height="30"></span>
            {{__("language.p1-question")}}
        </p>
        <p id="p3"><span class="iconify" data-icon="ph:caret-right-fill" style="color: #181818;" data-width="30" data-height="30"></span>
            {{__("language.p2-question")}}
        </p>
    </div>
    {{-- end options --}}

    <img id="img3" src="assets/img/5.png" alt="">

    <h3 id="ask">{{__("language.now")}}</h3>
    <h2 id="project">{{__("language.join-us")}}</h2>
    <div id="btnsForm" class="row ">
        <div class="col-6   d-flex justify-content-center">
            <a href="{{route('sponsor.index')}}"><button id="btnEmpresas">{{__("language.btn-sponsor")}}</button></a>
        </div>
        {{-- end col-6 --}}
        <div class="col-6  d-flex justify-content-between">
            <a  href="{{route('talleres.index')}}"> <button id="btnParticipa">{{__("language.btn-participa")}}</button></a>
        </div>
        {{-- end col-6 --}}
    </div>
    {{-- end btnsForm --}}
</div>
{{-- fin part2 --}}


<div id="form">
    <div class="mapouter">
        <h3>{{__("language.location")}}</h3>
        <div class="gmap_canvas">
            <iframe width="400" height="350" id="gmap_canvas" src="https://maps.google.com/maps?q=San%20Luis,%20Bilbao,%20Vizcaya&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
            <a href="https://fmovies-online.net"></a><br>
            {{-- <style>.mapouter{position:relative;text-align:right;height:500px;width:600px;}</style> --}}
            <a href="https://www.embedgooglemap.net"></a>
            {{-- <style>.gmap_canvas {overflow:hidden;background:none!important;height:500px;width:600px;}</style> --}}
        </div>
    </div>
    {{-- insertar imagen del lugar/mapa --}}

    <div id="dch">
        <div id="contacto">
            <h3>{{__("language.contact-us")}}</h3>
            <span class="iconify" data-icon="ph:instagram-logo-light" style="color: #181818;" data-width="30" data-height="30"></span>
            <a href="">@guretabadul</a>
            <br/>
            <span class="iconify" data-icon="ph:envelope-simple" style="color: #181818;" data-width="30" data-height="30"></span>
            <a href="">guretabadul@gmail.com</a>
            <br/>
            <span class="iconify" data-icon="ph:phone-light" style="color: #181818;" data-width="30" data-height="30"></span>
            <label>+34 615 84 53 61</label>
        </div>
        {{-- end contacto --}}

        <form id="formulario" class="row gy-2 gx-3 align-items-center" action="{{route('contactanos.store')}}" method="post">
        @csrf
            <h3>{{__("language.more-info")}}</h3>
            <div class="col-auto">
                <label class="form-label" for="inputname">{{__("language.name-label")}}</label>
                <input type="text" class="form-control" id="autoSizingInput" placeholder="{{__("language.name-input")}}" name="name">
            </div>
            {{-- end col-auto --}}
            <br/>
            <div class="col-auto">
                <label for="exampleFormControlInput1" class="form-label">{{__("language.mail-label")}}</label>
                <input name="email" type="email" class="form-control" id="exampleFormControlInput1" placeholder="{{__("language.mail-input")}}">
            </div>
            {{-- end col-auto --}}
            <br/>
            <div class="col-auto">
                <label for="exampleFormControlTextarea1" class="form-label">{{__("language.mensaje-label")}}</label>
                <textarea name="sms" class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="{{__("language.mensaje-input")}}"></textarea>
            </div>
            {{-- end col-auto --}}
            <br/>
            <div class="col-auto">
                <button id="enviarContact" type="submit" class="btn btn-primary">{{__("language.btn-send")}}</button>
            </div>
            {{-- end col-auto --}}
        </form>
        {{-- end formulario --}}
    </div>
    {{-- end dch --}}
</div>
{{-- fin form --}}
@include('layouts.chatBtn')
{{-- include btn -> chat --}}

<button id="arriba"> <span class="iconify" data-icon="mdi:arrow-up-bold-circle-outline" data-width="40" data-height="40"></span></span></button>
@endsection

<script src="https://tholman.com/elevator.js/elevator.js"></script>
<script>

window.onload = function parriba() {
  let elevador = new Elevator({
    element: document.querySelector("#arriba")
  });
};



</script>
