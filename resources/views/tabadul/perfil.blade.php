@section('titulo', 'perfil')
@extends('layouts.masterpage')
@section('contenido')
    @push('css')
        <link href="{{ URL::asset('./css/perfil.css') }}" rel="stylesheet ">
        <link href="https://fonts.googleapis.com/css2?family=Nova+Round&family=Permanent+Marker&display=swap" rel="stylesheet">
        <script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>
        <script src="{{ URL::asset('./js/perfil.js') }}"></script>
    @endpush
    {{--  --}}

@if($usuario->id == Auth::user()->id)
    <h1>{{ __('language.perfil') }}</h1>
    {{-- Perfil --}}
    <div class="perfil">
        <div>
            {{-- <img class="imgPerfil" src="{{ URL::asset('assets/img/2.png') }}" alt="imgPerfil"> --}}
            <img class="imgPerfil" src="..\storage\{{$usuario->avatar}}" width="200px" height="200px"  alt="" >
            <p>{{$usuario->name}}</p>
        </div>
    </div>
    {{-- end div perfil --}}
    <div id="mostrar_ocultar">
        {{-- Botones de editar,cursos e intercambios --}}
        <div class="btn3">
            <a class="btnintecambios" onclick="intercambio()">{{ __('language.btn-see-inter') }}</a>
            <a class="btn-UserP" onclick="editarPerfil()">{{ __('language.edit-profile') }} </a>
            <a class="btncursos" onclick="intercambio2()">{{ __('language.btn-see-course') }}</a>
        </div>
        {{-- end btn3 --}}

        {{------------------------------------------------------------------------------------------------------------------ --}}

        <div class="container row">
            <div class="col-md-1"></div>
            <div class="item col-md-3 col-12" >
                <h4 class="letrash4">{{ __('language.personal-info')}}</h4>
                <div>{{ __('language.phone') }}
                    @if ($usuario->phone == null)
                    {{ __('language.no-data')}}
                    @else
                        {{ $usuario->phone }}
                    @endif
                </div>
                {{-- end telefono --}}
                <div>{{ __('language.mail-label') }}
                    @if ($usuario->email == null)
                    {{ __('language.no-data')}}
                    @else
                        {{ $usuario->email }}
                    @endif
                </div>
                {{-- end mail --}}
                <div>{{ __('language.direction') }}
                    @if ($usuario->address == null)
                    {{ __('language.no-data')}}
                    @else
                        {{ $usuario->address }}
                        {{ $usuario->village }} ,
                        {{ $usuario->country }}
                    @endif
                </div>
                {{-- end direccion --}}
            </div>
            {{-- end item --}}

            <div class="container-gusto col-md-4 col-12">
                <h4 class="letrash4">{{ __('language.my-likes')}}</h4>
                <ul>
                    @foreach ($usuario->likes as $gusto)
                        @if ($gusto->pivot->isAprender == 0)
                            <li>{{ $gusto->name }}</li>
                            @else
                            @if ($gusto->pivot->isAprender == 0)
                                <li>{{ $gusto->name }}</li>
                            @endif
                        @endif
                    @endforeach
                </ul>
                {{-- end ul --}}
            </div>
            {{-- end container-gusto --}}

            <div class="container-aprender col-md-4 col-12">
                <h4 class="letrash4">{{ __('language.what-learn')}}</h4>
                <ul class="lista">
                    @foreach ($usuario->likes as $gusto)
                        @if ($gusto->pivot->isAprender == 1)
                            <li>{{ $gusto->name }}</li>
                        @endif
                    @endforeach
                </ul>
                {{-- end lista --}}
            </div>
            {{-- end container-aprender --}}
        </div>
        {{-- end container --}}
    </div>
    {{-- end mostrar_ocultar --}}



    {{------------------------------- Intercambio oculto ---------------------}}
    <div id="oculto">
        <h4 class="letrash4">{{ __('language.my-exchanges')}}</h4>
        <a class="volver" href="{{route('user.show', ['user' => Auth::user()->id]) }}">{{ __('language.go-back')}}</a>
        <div class="texto col-md-6">
            <table class="table table-hover table-bordered  table-sm">
                <thead class="table-Light">
                    <tr>
                        <th>{{ __('language.exchanges')}}</th>
                        <th>{{ __('language.state')}}</th>
                    </tr>
                    {{-- end tr --}}
                </thead>
                {{-- end thead --}}
                @foreach ($matches as $m)
                <tr class="table-Success">
                    @if($m->estado ==2 || $m->estado ==3)
                        @if($m->user1_id != Auth::user()->id)
                            <td>{{$m->user1()->name}}</td>
                        @else
                            <td>{{$m->user2()->name}}</td>
                        @endif
                        {{-- end if --}}
                        @if($m->estado ==2)
                            <td>{{ __('language.in-process')}}</td>
                        @else
                            <td>{{ __('language.accept')}}</td>
                        @endif
                        {{-- end if --}}
                    @endif
                    {{-- end if --}}
                </tr>
                {{-- end tr --}}
                @endforeach
                {{-- end foreach --}}
                </tbody>
            </table>
            {{-- end table --}}
        </div>
        {{-- end texto --}}
    </div>
    {{-- end oculto --}}

    {{-- Cursos apuntados --}}
    <div id="oculto2">
        <h4 class="letrash4">{{ __('language.course-target')}}</h4>
        <a class="volver2" href="{{ route('user.show', ['user' => Auth::user()->id]) }}">{{ __('language.go-back')}}</a>
        <div class="cursos-apuntados col-md-8">
            <table class="table  table-bordered table-sm">
                <thead class="table-Light">
                    <tr>
                        <th>{{ __('language.name-input')}}</th>
                        <th>{{ __('language.description')}}</th>
                        <th>{{ __('language.course-date')}}</th>
                        <th>{{ __('language.course-price')}}</th>
                        <th></th>
                    </tr>
                    {{-- end tr --}}
                </thead>
                {{-- end thead --}}

                @foreach ($usuario->workshops as $taller)
                    <tr class="table-Success">
                        <td>{{ $taller->name }}</td>
                        <td>{{ $taller->description }}</td>
                        <td>{{ $taller->date }}</td>
                        @if ($taller->precio == 0)
                            <td> {{ __('language.price-free') }}</td>
                        @else
                            <td>{{ $taller->precio }}</td>
                        @endif
                        <td>
                            <form action="{{ route('workshopUser.destroy', ['workshopUser' => $taller->pivot->id]) }}"
                                method="post">
                                @method('DELETE')
                                @csrf
                                <button class="btn-desapuntarse" type="submit">{{ __('language.disavow')}}</button>
                            </form>
                        </td>
                        {{-- end td --}}
                    </tr>
                    {{-- end tableSuccess --}}
                @endforeach
                {{-- end foreach --}}
                </tbody>
            </table>
            {{-- end table --}}
        </div>
        {{-- end cursos-apuntados --}}
    </div>
    {{-- end oculto2 --}}

    {{--------------------------edit perfil------------------------------------------------- --}}

    <div id="oculto3">
        <h1>{{ __('language.edit-profile')}}</h1>
        <a class="volver3" href="{{ route('user.show', ['user' => Auth::user()->id]) }}">{{ __('language.go-back')}}</a>
            <div class="containerEdit row">
                <div class="col-md-1"></div>
                <div class="perfil-informacion col-md-3 col-12">
                    <h4>{{ __('language.personal-info')}}</h4>
                    <form class="formulario  col-md-3" action="{{ route('user.update', ['user' => $usuario->id]) }}" method="post">
                        @method('PUT')
                        @csrf
                        <div class="input-info">
                            <label>{{ __('language.phone') }}</label>
                            <input type="text" name="phone" value="{{ $usuario->phone }}">
                        </div>
                        {{-- end input-info --}}
                        <div class="input-info">
                            <label>{{ __('language.mail-label') }}</label>
                            <input type="text" name="email" value="{{ $usuario->email }}">
                        </div>
                        {{-- end input-info --}}
                        <div class="input-info">
                            <label>{{ __('language.direction') }}</label>
                            <input type="text" name="address" value="{{ $usuario->address }}">
                            <label>{{ __('language.city')}}</label>
                            <input type="text" name="village" value="{{ $usuario->village }}">
                            <label>{{ __('language.country')}}</label>
                            <input type="text" name="country" value="{{ $usuario->country }}">
                        </div>
                        {{-- end input-info --}}
                    <input class="input-actualizar" type="submit" value="Actualizar"/>
                    </form>
                    {{-- end form --}}
                </div>
                {{-- end perfil-informacion --}}
                <div class="col-md-4 col-12">
                    <form action="{{ route('likeUser.update', ['likeUser' => $usuario->id]) }}" method="post">
                        @method('PUT')
                        @csrf
                        <div class="perfil-gustos ">
                            <div class="perfil-item2 col-md-9 col-12">
                                <h4>{{ __('language.what-teach')}}</h4>
                                <ul>
                                    @foreach ($usuario->likes as $gusto)
                                        @if ($gusto->pivot->isAprender == 0)
                                            <input class="form-check-input" name="isAprender" type="hidden" value="0" id="flexCheckDefault">
                                            <input class="form-check-input" checked name="like_id[{{$gusto->id}}]" type="checkbox" value="{{$gusto->id}}" id="flexCheckDefault">
                                            <label class="form-check-label" for="flexCheckDefault">
                                                {{$gusto->name}}
                                            </label>
                                        @endif
                                        {{-- end if --}}
                                    @endforeach
                                    {{-- end foreach --}}
                                    @foreach ($todosGustos as $gusto)
                                        <input class="form-check-input" name="isAprender" type="hidden" value="0" id="flexCheckDefault">
                                        <input class="form-check-input" name="like_id[{{$gusto->id}}]" type="checkbox" value="{{$gusto->id}}" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            {{$gusto->name}}
                                        </label>
                                    @endforeach
                                    {{-- end foreach --}}
                                </ul>
                                {{-- end ul --}}
                                <button class="btn1">{{ __('language.teach')}}</button>
                            </div>
                            {{-- end perfil-item --}}
                        </div>
                        {{-- end perfil-gustos --}}
                    </form>
                    {{-- end form --}}
                </div>
                {{-- end col-md-4 --}}
                <div class="col-md-4 col-12">
                    <form action="{{ route('likeUser.update', ['likeUser' => $usuario->id]) }}" method="post">
                        @method('PUT')
                        @csrf
                        <div class="perfil-aprender col-md-9 col-12">
                            <h4>{{ __('language.what-learn')}}</h4>
                            <ul>
                                @foreach ($usuario->likes as $gusto)
                                    @if ($gusto->pivot->isAprender == 1)
                                        <input class="form-check-input" name="isAprender" type="hidden" value="1" id="flexCheckDefault">
                                        <input class="form-check-input" checked name="like_id[{{$gusto->id}}]" type="checkbox" value="{{$gusto->id}}" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            {{$gusto->name}}
                                        </label>
                                    @endif
                                    {{-- end if --}}
                                @endforeach
                                {{-- end foreach --}}
                                @foreach ($todosGustosA as $gusto)
                                    <input class="form-check-input" name="isAprender" type="hidden" value="1" id="flexCheckDefault">
                                    <input class="form-check-input" name="like_id[{{$gusto->id}}]" type="checkbox" value="{{$gusto->id}}" id="flexCheckDefault">
                                    <label class="form-check-label" for="flexCheckDefault">
                                        {{$gusto->name}}
                                    </label>
                                @endforeach
                                {{-- end foreach --}}
                            </ul>
                            {{-- end ul --}}
                            <button class="btn1">{{ __('language.learn-btn')}}</button>
                        </div>
                        {{-- end perfil-aprender --}}
                    </form>
                    {{-- end form --}}
                </div>
                {{-- end col-md-4 --}}
            </div>
            {{-- end containerEdit --}}
        </div>
        {{-- end volver3 --}}
    </div>
    {{-- end oculto3 --}}
    @else
    <h1>{{ __('language.not-your-prof')}}</h1>
    @endif
@endsection
