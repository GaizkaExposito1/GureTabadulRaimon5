@push('css')

<link href="{{URL::asset('./css/chat-style.css')}}" rel="stylesheet ">
<link href="https://fonts.googleapis.com/css2?family=Nova+Round&family=Permanent+Marker&display=swap" rel="stylesheet">
<script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>
@endpush
@extends('layouts.masterpage')
<meta http-equiv="refresh" content="60" />
@section('contenido')
<!-- Se comprueba si el user k accede es admin o no -->
<!-- si es usuario el titulo es mensajes con administrador y los mensjaes del admin estaran eb ka izq -->
<!-- si es admin el titulo es mensajes con XUSUARIO y los mensjaes del admin estaran eb ka derech -->

    <div id="head">
        <h2>{{$chat->user->name}}</h2>
        {{-- Mensajes con  --}}
        <a href="{{route('chat.show',[$chat->id])}}">
            <span class="iconify" data-icon="ph:arrows-counter-clockwise" style="color: #b33061;" data-width="30" data-height="30"></span>
        </a>
    </div>
    {{-- end head --}}
    <!-- se sacan todos los mensajes del chat ordenados por OrdenMensaje  y se comprueba si son de admin o no poniendolo en diferentes collumnas-->
    <div id="conver">
        @foreach ($sms as $smss)
            @if($smss->isAdmin==1)
                <p class="derecha">{{$smss->text}}</p>
                @else
                    <p class="izq">{{$smss->text}}</p>
            @endif
        @endforeach
        {{-- end foreach --}}
    </div>
    {{-- end conver --}}
    <div id="send-mess">
        <form action="{{route('mensaje.store')}}" method="POST" enctype="multipart/form-data">
            {{csrf_field()}}
            <input id="texto" type="text" name="text" placeholder="{{ __('language.mensaje-input')}}"/>

            {{-- inputs ocultos --> no tocar --}}
            <input type="hidden" name="user_id" value="{{$chat->user_id}}"/>
            <input type="hidden" name="isAdmin" value="1"/>
            <input type="hidden" name="chat_id" value="{{$chat->id}}"/>
            {{-- end inputs ocultos --}}

            <button type="submit" class="btn " id="button">{{ __('language.send-mess')}}</button>
        </form>
        {{-- end form --}}
    </div>
    {{-- end send-mess --}}
@endsection
