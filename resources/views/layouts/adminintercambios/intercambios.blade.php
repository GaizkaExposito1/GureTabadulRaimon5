@extends ('voyager::master')

<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Intercambios</title>
      <!-- Favicon -->
      <?php $admin_favicon = Voyager::setting('admin.icon_image', ''); ?>
      @if($admin_favicon == '')
          <link rel="shortcut icon" href="{{ voyager_asset('images/logo-icon.png') }}" type="image/png">
      @else
          <link rel="shortcut icon" href="{{ Voyager::image($admin_favicon) }}" type="image/png">
      @endif
  <link href="{{URL::asset('./css/admin-intercambios.css')}}" rel="stylesheet">
  <script src="{{URL::asset('./js/admin-intercambios.js')}}"></script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="./js/filters.js"></script>

</head>
<body>

    @section('content')
    <h1 class="text-center titulo">Posibles Intercambios</h1>
    <a href="{{route('voyager.matches.create')}}">Hacer intercambios a mano</a>
    <a href="{{route('match.index')}}">Ver todos los intercambios</a>
    <div id="selectores" class="row selects">
        <div class=" justify-content-between text-center col-md-4 col-12">
            <form action="{{route('filtrar')}}" method="post">
                @csrf
                <select name="dato" id="selectUsuarios">
                    <option value="value1" selected disabled>Usuarios</option>
                    @foreach ($usuarios as $usuario)
                        <option value="{{$usuario->id}}">{{$usuario->name}}</option>
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
            <select name="dato" id="selectsEstado">
                <option value="value1" selected disabled>Estado Intercambio</option>
                @foreach ($estados as $estado)
                    <option value="{{$estado->id}}">{{$estado->name}}</option>
                @endforeach
            </select>
            {{-- end select --}}
            <input class="form-check-input" name="filtro" type="hidden" value="estado" id="flexCheckDefault">
            <button type="submit" class="Boton">Buscar</button>
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
  <div class="row">
    @foreach ($matchs as $match)
        <div class="filas">
            <div class="fila1 d-flex col-md-6 col-12">
                <img class="imgAvatar" src="storage\{{$match->user1()->avatar}}" width="200px" height="200px"  alt="" >
                <p class="nombre">{{$match->user1()->name}}</p>
                <h5 class="aprender">¿Que quiere aprender?</h5>
                <ul>
                    @foreach ($match->user1()->likes as $gusto)
                        @if ($gusto->pivot->isAprender == 1)
                            <li>{{ $gusto->name }}</li>
                        @endif
                    @endforeach
                </ul>
                {{-- end ul --}}
                <h5 class="aprender">Tus gustos</h5>
                <ul>
                    @foreach ($match->user1()->likes as $gusto)
                        @if ($gusto->pivot->isAprender == 0)
                            <li>{{ $gusto->name }}</li>
                        @endif
                    @endforeach
                </ul>
                {{-- end ul --}}
            </div>
            {{-- end fila1 --}}
        <div class="fila2 d-flex col-md-6 col-12">
            <img class="imgAvatar" src="storage\{{$match->user2()->avatar}}" width="200px" height="200px"  alt="" >
            <p class="nombre">{{$match->user2()->name}}</p>
            <h5 class="aprender">¿Que quiere aprender?</h5>
            <ul>
                @foreach ($match->user2()->likes as $gusto)
                    @if ($gusto->pivot->isAprender == 1)
                        <li>{{ $gusto->name }}</li>
                    @endif
                @endforeach
            </ul>
            {{-- end ul --}}
            <h5 class="aprender">Tus gustos</h5>
            <ul>
                @foreach ($match->user2()->likes as $gusto)
                    @if ($gusto->pivot->isAprender == 0)
                        <li>{{ $gusto->name }}</li>
                    @endif
                @endforeach
            </ul>
            {{-- end ul --}}
        </div>
        {{-- end fila2 --}}
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-1">
                </div>
                {{-- end col-md-1 --}}
                <div class="marbt col-md-3 col-12">
                    <form action="{{route('cambiarEstado')}}" method="post">
                        @csrf
                        <input class="form-check-input" name="match_id" type="hidden" value="{{$match->id}}" id="flexCheckDefault">
                        <input class="form-check-input" name="estado" type="hidden" value="4" id="flexCheckDefault">
                        <button type="submit" class="Boton">Denegar Match</button>
                    </form>
                    {{-- end form --}}
                </div>
                {{-- end marbt --}}
                <div class="col-md-1"></div>
                {{-- end col-md1 --}}
                <div class="col-md-3 col-12">
                    <form action="{{route('cambiarEstado')}}" method="post">
                        @csrf
                        <input class="form-check-input" name="match_id" type="hidden" value="{{$match->id}}" id="flexCheckDefault">
                        <input class="form-check-input" name="estado" type="hidden" value="1" id="flexCheckDefault">
                        <button type="submit" class="Boton">En Proceso</button>
                    </form>
                    {{-- end form --}}
                </div>
                {{-- end col-md3 --}}
                <div class="col-md-2"></div>
                {{-- end col-md-2 --}}
                <div class="col-md-2 col-12">
                    <form action="{{route('cambiarEstado')}}" method="post">
                        @csrf
                        <input class="form-check-input" name="match_id" type="hidden" value="{{$match->id}}" id="flexCheckDefault">
                        <input class="form-check-input" name="estado" type="hidden" value="2" id="flexCheckDefault">
                        <button type="submit" class="Boton">Aceptar</button>
                    </form>
                    {{-- end form --}}
                </div>
                {{-- end col-md-2 --}}
            </div>
            {{-- end row --}}
        </div>
        {{-- end col-md-12 --}}
        @endforeach
    </div>
    {{-- end filas --}}
  </div>
  {{-- end row --}}












  {{-- <div class="row">
    @foreach ($matchs as $match)
    <div class="fila1 d-flex col-md-6 col-12">
      <img class="imgAvatar" src="storage\{{$match->user1()->avatar}}" width="200px" height="200px"  alt="" >
      <p class="nombre">{{$match->user1()->name}}</p>
      <h5 class="aprender">¿Que quiere aprender?</h5>
      <ul>
      @foreach ($match->user1()->likes as $gusto)
      @if ($gusto->pivot->isAprender == 1)
      <li>{{ $gusto->name }}</li>
      @endif
      @endforeach
      </ul>
      <h5 class="aprender">Tus gustos</h5>
      <ul>
      @foreach ($match->user1()->likes as $gusto)
      @if ($gusto->pivot->isAprender == 0)
      <li>{{ $gusto->name }}</li>
      @endif
      @endforeach
      </ul>
    </div>
    <form action="{{route('cambiarEstado')}}" method="post">
    @csrf
    <input class="form-check-input" name="match_id" type="hidden" value="{{$match->id}}" id="flexCheckDefault">
    <input class="form-check-input" name="estado" type="hidden" value="4" id="flexCheckDefault">
      <button type="submit" class="Boton">Denegar Match</button>
    </form>
    <form action="{{route('cambiarEstado')}}" method="post">
    @csrf
    <input class="form-check-input" name="match_id" type="hidden" value="{{$match->id}}" id="flexCheckDefault">
    <input class="form-check-input" name="estado" type="hidden" value="1" id="flexCheckDefault">
      <button type="submit" class="Boton">En Proceso</button>
    </form>
    <form action="{{route('cambiarEstado')}}" method="post">
    @csrf
    <input class="form-check-input" name="match_id" type="hidden" value="{{$match->id}}" id="flexCheckDefault">
    <input class="form-check-input" name="estado" type="hidden" value="2" id="flexCheckDefault">
      <button type="submit" class="Boton">Aceptar</button>
    </form>
    <div class="fila2 d-flex col-md-6 col-12">
      <img class="imgAvatar" src="storage\{{$match->user2()->avatar}}" width="200px" height="200px"  alt="" >
      <p class="nombre">{{$match->user2()->name}}</p>
      <h5 class="aprender">¿Que quiere aprender?</h5>
      <ul>
      @foreach ($match->user2()->likes as $gusto)
      @if ($gusto->pivot->isAprender == 1)
      <li>{{ $gusto->name }}</li>
      @endif
      @endforeach
      </ul>
      <h5 class="aprender">Tus gustos</h5>
      <ul>
      @foreach ($match->user2()->likes as $gusto)
      @if ($gusto->pivot->isAprender == 0)
      <li>{{ $gusto->name }}</li>
      @endif
      @endforeach
      </ul>
    </div>

    @endforeach
  </div> --}}
  @stop
</body>
</html>
