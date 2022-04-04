@push ('css')
<script type="application/javascript">
    $("#language").change(function () {
        window.location = './locale/' + $("#language").val();
    });
</script>
<link href="{{URL::asset('./css/nav.css')}}" rel="stylesheet ">
@endpush
<nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
    <div class="logogure" >
        <a class="no_style" href="{{route('home')}}"><img id="logo" src="{{ URL::asset('assets/img/logo.png') }}" alt="logo GureTabadul" ></a>
    </div>
    {{-- end logogure --}}
    <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
    <div class="collapse navbar-collapse"  id="navbarResponsive" >
        <ul class="navbar-nav ms-auto navbar-light my-2 my-lg-0">
            <li class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" id="idioma" data-bs-toggle="dropdown">{{ Config::get('languages')[App::getLocale()] }}</a>
                <div class="dropdown-menu dropdown-menu-end">
                    @foreach (Config::get('languages') as $lang => $language)
                    @if ($lang != App::getLocale())
                    <a class="dropdown-item"  href="{{ route('lang.switch', $lang) }}"> {{$language}}</a>
                        @endif
                        {{-- end if --}}
                    @endforeach
                {{-- end foreach --}}
                </div>
                {{-- end dropdown-menu --}}
            </li>
            {{-- end li --}}
            <li class="nav-item"><a class="nav-link" href="{{route('servicios')}}">{{__("language.services-navb")}}</a></li>
            <li class="nav-item"><a class="nav-link" href="{{route('talleres.index')}}">{{__("language.course-navb")}}</a></li>
            <li class="nav-item"><a class="nav-link" href="{{route('cart.index')}}">{{__("language.shop-navb")}}</a></li>
            <li class="nav-item"><a class="nav-link" href="{{route('sponsor.index')}}">{{__("language.company-navb")}}</a></li>
            @if (Auth::check())
                @if (Auth::user()->role_id == 1 || Auth::user()->role_id==2)
                    <li class="nav-item"><a class="nav-link" href="{{route('voyager.dashboard')}}">{{__("language.admin-navb")}}</a></li>
                @endif
                {{-- end if --}}
                <li class="nav-item">
                    <a class="nav-link active" id="cerrar" aria-current="page"
                    onclick="event.preventDefault();
                    document.getElementById('logout').submit();">
                        {{__("language.close")}}
                    </a>
                    {{-- end a --}}
                    {{-- solo usuarios identificados --}}
                    <form action="{{route('logout')}}" id="logout" method="POST" style="display:none;">
                        @csrf
                    </form>
                    {{-- end form --}}
                </li>
                {{-- end li --}}

                <li class="nav-item"><a class="nav-link" href="{{route('user.show',['user'=>Auth::user()->id])}}"><i class="fa fa-fw fa-user"></i></a></li>
                @else
                    <li class="nav-item"><a class="nav-link" href="{{route('login')}}"><i class="fa fa-fw fa-user"></i></a></li>
            @endif
            {{-- end if --}}

        </ul>
        {{-- end navbar-nav --}}
    </div>
    {{-- end collapse navbar-collapse --}}

</nav>
{{-- end navbar --}}






