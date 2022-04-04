@push('css')
<link href="{{URL::asset('./css/chatBtn-style.css')}}" rel="stylesheet ">
<script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>
@endpush

@if (Auth::check())
    @if (Auth::user()->role_id == 3)
        <div id="chat-btn">
            <a href={{route('chatUser',['chat'=>Auth::user()->id])}}>
                <span class="iconify" data-icon="ph:chats-circle-fill" style="color: white;" data-width="35" data-height="35"></span>
            </a>
            {{-- end a --}}
        </div>
        {{-- end chat-btn --}}
    @endif
@endif
