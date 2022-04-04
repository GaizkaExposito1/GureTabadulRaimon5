@extends('layouts.masterpage')
@section('titulo', "Servicios")
@section('contenido')
@push ('css')
<link href="{{URL::asset('./css/servicios-style.css')}}" rel="stylesheet ">
<link href="https://fonts.googleapis.com/css2?family=Nova+Round&family=Permanent+Marker&display=swap" rel="stylesheet">
<script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>
@endpush
        <div id="services">
            <div id="title">
                <h1>{{__("language.our-services")}}</h1>
            </div>
            <p>{{__("language.services-p1")}}</p>
        </div>

        <div id="lista-servicios">
            <div class="row">
                <div id="idioma" class="col-md-4">
                        <h3>
                            <span class="iconify" data-icon="ph:chat-circle-dots" style="color: #0077B6;" data-width="35" data-height="35"></span>
                            {{__("language.language-exch")}}
                        </h3>
                    <p>
                        {{__("language.learn-language")}}
                    </p>
                </div>
                {{-- end idioma --}}
                <div id="tradicion" class="col-md-4">
                        <h3>
                            <span class="iconify" data-icon="mdi:web" style="color: #0077B6;" data-width="35" data-height="35"></span>
                            {{__("language.tradition-ex")}}
                        </h3>
                    <p>
                        {{__("language.show-tradi")}}
                    </p>
                </div>
                {{-- end tradicion --}}
                <div id="artesania" class="col-md-4">
                    <h3>
                        <span class="iconify" data-icon="ph:palette" style="color: #0077B6;" data-width="35" data-height="35"></span>
                        {{__("language.craft-exch")}}
                    </h3>
                    <p>
                        {{__("language.craft-ask")}}
                    </p>
                </div>
                {{-- end artesania --}}
            </div>
            {{-- end row --}}
            <div class="row">
                <div id="ocio" class="col-md-4">
                    <h3>
                        <span class="iconify" data-icon="mdi:chess-knight" style="color: #0077B6;" data-width="35" data-height="35"></span>
                        {{__("language.social-exch")}}
                    </h3>
                    <p>{{__("language.social-talk")}}</p>
                </div>
                {{-- end ocio --}}
                <div id="comida" class="col-md-4">
                    <h3>
                        <span class="iconify" data-icon="ph:coffee" style="color: #0077B6;" data-width="35" data-height="35"></span>
                        {{__("language.food-exchange")}}
                    </h3>
                    <p>{{__("language.learn-cooking")}}</p>
                </div>
                {{-- end comida --}}
                <div id="taller-curso" class="col-md-4">
                    <h3>
                        <span class="iconify" data-icon="ph:backpack" style="color: #0077B6;" data-width="35" data-height="35"></span>
                        {{__("language.work-courses")}}
                    </h3>
                    <p>{{__("language.course-work")}}</p>
                </div>
                {{-- end taller-curso --}}
            </div>
            {{-- end row --}}
        </div>
        {{-- end lista-servicios --}}

    </div>
    @include('layouts.chatBtn')
    {{-- include btn -> chat --}}
    @endsection
