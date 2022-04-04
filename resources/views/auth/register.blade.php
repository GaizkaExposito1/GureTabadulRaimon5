@extends('layouts.masterpage')

@section('contenido')

<link href="{{URL::asset('./css/registroStyle.css')}}" rel="stylesheet ">
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="">
            {{-- <div class="card-header">{{ __('register') }}</div> --}}
            <div id="registro" class="fs-1">{{__("language.register")}}</div>
                <div class="">
                    <form  method="POST" action="{{ route('register') }}">
                        <div class="d-flex justify-content-center">
                            <img id="logo" class="d-flex align-items-center" src="assets/img/logo.png" alt="">
                        </div>
                        @csrf
                        <div class="form-group row">
                            <label for="name" class="col-md-4 col-form-label text-md-right">{{__("language.name-lastname")}}</label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ old('name') }}" required autocomplete="name" autofocus>

                                @error('name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="email" class="col-md-4 col-form-label text-md-right">{{__("language.mail-label")}}</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email">

                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="password" class="col-md-4 col-form-label text-md-right">{{__("language.pass-second")}}</label>

                            <div class="col-md-6">
                                <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="new-password">

                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="password-confirm" class="col-md-4 col-form-label text-md-right">{{ __("language.confirm-pass") }}</label>

                            <div class="col-md-6">
                                <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required autocomplete="new-password">
                            </div>
                        </div>

                        <div class="form-group row mb-0">
                            <div id="enviar" class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                    {{ __("language.btn-register") }}
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
