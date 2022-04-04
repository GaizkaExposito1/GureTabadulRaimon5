@push('css')

<link href="{{URL::asset('./css/bandeja-style.css')}}" rel="stylesheet ">
<link href="https://fonts.googleapis.com/css2?family=Nova+Round&family=Permanent+Marker&display=swap" rel="stylesheet">
<script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>
@endpush
@extends('layouts.masterpage')

@section('contenido')
    <div id="title-inbox">
        <h1>Bandeja de entrada</h1>
        <h2>Crear chat</h2>
    </div>
    {{-- end title-box --}}
    <div id="select-user">
        <form action="{{route('chat.store')}}" method="post">
            @csrf
            <select name="user_id">
                <option value="value1" selected disabled>Usuarias</option>
                @foreach ($usersSinChat as $user)
                    <option value="{{$user->id}}">{{$user->name}}</option>
                @endforeach
                {{-- end foreach --}}
            </select>
            {{-- end select --}}
            <button type="submit" class="Boton">Crear chat</button>
        </form>
        {{-- end form --}}
    </div>
    {{-- end select-user --}}
    <div id="chat-list">
        <ul>
            @foreach ($chats as $chat)
            <div id="person-chat">
                <div id="line">
                    <li>
                        <img id="imgPerfil" src="{{ URL::asset('assets/img/2.png') }}" alt="imgPerfil">
                    </li>
                    <a href="{{route('chat.show',[$chat->id])}}">
                        <li>{{$chat->user->name}}</li>
                    </a>
                </div>
                {{-- end line --}}
                <form action="{{ route('chat.destroy', ['chat' => $chat->id]) }}" method="post">
                    @method('DELETE')
                    @csrf
                    <button type="submit">
                        {{-- Eliminar chat --}}
                        <span class="iconify" data-icon="ph:trash" style="color: #D02B61;" data-width="30" data-height="30"></span>
                    </button>
                </form>
                {{-- end form --}}
            </div>
            {{-- end person-chat --}}
            @endforeach
            {{-- end foreach --}}
        </ul>
        {{-- end ul --}}
    </div>
    {{-- end chat-list --}}
@endsection
