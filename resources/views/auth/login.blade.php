@extends('layouts.masterpage')
@section('contenido')
{{-- <head>
    <link rel="stylesheet" href="css/login-style.css">
</head> --}}
<link href="{{URL::asset('./css/login-style.css')}}" rel="stylesheet ">
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
            @if (session('error'))
     <div class="alert alert-danger">
         {{ session('error') }}
     </div>
  @endif
                <div id="login" class="card-header"><h3>{{ __('Login') }}</h3></div>

                <div class="card-body">
                    <form method="POST" action="{{ route('login') }}">
                        <div class="d-flex justify-content-center">
                            <img id="logo_login" class="d-flex align-items-center" src="assets/img/logo.png" alt="">
                        </div>
                        @csrf

                        <div class="row mb-3">
                            <label for="email" class="col-md-4 col-form-label text-md-end">{{__("language.mail-correo")}}</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>

                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="password" class="col-md-4 col-form-label text-md-end">{{__("language.password-log")}}</label>

                            <div class="col-md-6">
                                <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="current-password">

                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-6 offset-md-4">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>

                                    <label class="form-check-label" for="remember">
                                        {{__("language.remember-me")}}
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-0">
                            <div class="col-md-8 offset-md-4">
                                <div id="entrar">
                                    <button type="submit" class="btn btn-primary">
                                        {{ __('Login') }}
                                    </button>
                                </div>


                                <a class="btn btn-link" href="{{ route('register') }}">
                                    {{__("language.no-account")}}
                                </a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
