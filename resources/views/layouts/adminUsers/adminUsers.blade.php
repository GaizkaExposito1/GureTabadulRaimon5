@extends ('voyager::master')

<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Administración de Usuarias</title>
      <!-- Favicon -->
      <?php $admin_favicon = Voyager::setting('admin.icon_image', ''); ?>
      @if($admin_favicon == '')
          <link rel="shortcut icon" href="{{ voyager_asset('images/logo-icon.png') }}" type="image/png">
      @else
          <link rel="shortcut icon" href="{{ Voyager::image($admin_favicon) }}" type="image/png">
      @endif
    <link href="{{URL::asset('./css/admin-user.css')}}" rel="stylesheet">
    <script src="{{URL::asset('./js/admin-user.js')}}"></script>
    <link rel="stylesheet" href="./css/footer-style.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">


</head>
<body>
  @section('content')
    <div class="w-100 d-flex justify-content-center">
        <h1 class="text-center titulo">Administración de Usuarias</h1>
        <div class="row bg-pink cuadrado d-flex justify-content-center text-center">
            <h2 class="ttuloApartado">Bloquear Usuarias</h2>
            <form action="{{route('adminUsers.store')}}" method="post">
                @csrf
                <select name="user_id">
                    <option value="value1" selected disabled>Usuarias</option>
                    @foreach ($usuariosNoBloq as $user)
                        <option value="{{$user->id}}">{{$user->name}}</option>
                    @endforeach
                </select>
                {{-- end select --}}
                <input class="form-check-input" name="banned" type="hidden" value="1" id="flexCheckDefault">
                <input class="form-check-input" name="acepted" type="hidden" value="3" id="flexCheckDefault">
                <input class="form-check-input" name="role_id" type="hidden" value="3" id="flexCheckDefault">
                <input class="form-check-input" name="newAdmin" type="hidden" value="3" id="flexCheckDefault">
                <button type="submit" class="Boton">Bloquear</button>
            </form>
            {{-- end form --}}
        </div>
        {{-- end row --}}

        <div class="row bg-pink cuadrado d-flex justify-content-center text-center">
            <h2 class="ttuloApartado">Desbloquear Usuarias</h2>
            <form action="{{route('adminUsers.store')}}" method="post">
                @csrf
                <select name="user_id">
                    <option value="value1" selected disabled>Usuarias</option>
                    @foreach ($usuariosBloq as $user)
                        <option value="{{$user->id}}">{{$user->name}}</option>
                    @endforeach
                </select>
                {{-- end select --}}
                <input class="form-check-input" name="banned" type="hidden" value="0" id="flexCheckDefault">
                <input class="form-check-input" name="acepted" type="hidden" value="3" id="flexCheckDefault">
                <input class="form-check-input" name="role_id" type="hidden" value="3" id="flexCheckDefault">
                <input class="form-check-input" name="newAdmin" type="hidden" value="3" id="flexCheckDefault">
                <button type="submit" class="Boton">Desbloquear</button>
            </form>
            {{-- end form --}}
        </div>
        {{-- end row --}}

        <div class="row bg-pink cuadrado d-flex justify-content-center text-center">
            <h2 class="ttuloApartado">Aceptar Usuarias</h2>
            <form action="{{route('adminUsers.store')}}" method="post">
                @csrf
                <select name="user_id">
                    <option value="value1" selected disabled>Usuarias</option>
                    @foreach ($usuariosNoAcepted as $user)
                        <option value="{{$user->id}}">{{$user->name}}</option>
                    @endforeach
                </select>
                {{-- end select --}}
                <input class="form-check-input" name="banned" type="hidden" value="3" id="flexCheckDefault">
                <input class="form-check-input" name="acepted" type="hidden" value="1" id="flexCheckDefault">
                <input class="form-check-input" name="role_id" type="hidden" value="3" id="flexCheckDefault">
                <input class="form-check-input" name="newAdmin" type="hidden" value="3" id="flexCheckDefault">
                <button type="submit" class="Boton">Aceptar</button>
            </form>
            {{-- end form --}}
        </div>
        {{-- end row --}}

         <div class="row bg-pink cuadrado d-flex justify-content-center text-center">
            <h2 class="ttuloApartado">Hacer Usuarias administradoras</h2>
            <form action="{{route('adminUsers.store')}}" method="post">
                @csrf
                <select name="user_id">
                    <option value="value1" selected disabled>Usuarias</option>
                    @foreach ($usuariosNoAdmin as $user)
                        <option value="{{$user->id}}">{{$user->name}}</option>
                    @endforeach
                </select>
                {{-- end select --}}
                <input class="form-check-input" name="banned" type="hidden" value="3" id="flexCheckDefault">
                <input class="form-check-input" name="acepted" type="hidden" value="3" id="flexCheckDefault">
                <input class="form-check-input" name="role_id" type="hidden" value="2" id="flexCheckDefault">
                <input class="form-check-input" name="newAdmin" type="hidden" value="3" id="flexCheckDefault">
                <button type="submit" class="Boton">Aceptar</button>
            </form>
            {{-- end form --}}
        </div>
        {{-- end row --}}
        <div class="row bg-pink cuadrado d-flex justify-content-center text-center">
            <h2 class="ttuloApartado">Hacer Usuarias administradoras</h2>
            <form action="{{route('adminUsers.store')}}" method="post">
                @csrf
                <label for="exampleInputemail" class="form-label">email</label>
                <input type="email" name="email"  id="exampleInputemail">
                <label for="exampleInputemail" class="form-label">name</label>
                <input type="text" name="name"   id="exampleInputemail">
                <label for="exampleInputemail" >password</label>
                <input type="password" name="password"  id="exampleInputemail">
                <input class="form-check-input" name="banned" type="hidden" value="3" id="flexCheckDefault">
                <input class="form-check-input" name="acepted" type="hidden" value="3" id="flexCheckDefault">
                <input class="form-check-input" name="role_id" type="hidden" value="2" id="flexCheckDefault">
                <input class="form-check-input" name="newAdmin" type="hidden" value="1" id="flexCheckDefault">
                <button type="submit" class="Boton">Aceptar</button>
            </form>
            {{-- end form --}}
        </div>
        {{-- end row --}}
    </div>
    {{-- end w-100 --}}





</div>
  @stop
</body>
</html>
