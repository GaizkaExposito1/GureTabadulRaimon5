
$(document).ready(function(){
$( "#selectUsuarios" ).change(function() {
  if ($("#oculto").css("display", "block")) {
    $('#oculto').show();
  }else{
    $('#id').hide();
  }


});
$( "#selectsEstado" ).change(function() {
  if ($("#oculto").css("display", "block")) {
    $('#oculto').show();
  }else{
    $('#id').hide();
  }


});
})






















{/* <div class="row">
    @foreach ($matchs as $match)
    <div class="fila1 col-md-6 col-12">
      <img class="imgAvatar" src="storage\{{$usuario->avatar}}" width="200px" height="200px"  alt="" >
      <p class="nombre">{{$match->user1}}</p>
      <h5 class="aprender">¿Que quiere aprender?</h5>
      @foreach ($likeUsers as $gusto)
      {{-- NO TENGO NI PUTA IDEA DE COMO HACER ESTO --}}
          <p>{{$gusto->name}}</p>
      @endforeach
      <h5 class="aprender">Tus gustos</h5>
      @foreach ($likeUsers as $gusto)
      {{-- NO TENGO NI PUTA IDEA DE COMO HACER ESTO --}}
          <p>{{$gusto->name}}</p>
      @endforeach
    </div>
    {{$usuario->avatar}}
    <div class="fila2 col-md-6 col-12">
      <img class="imgAvatar" src="storage\{{$usuario->avatar}}" width="200px" height="200px"  alt="" >
      <p class="nombre">{{$usuario->name}}</p>
      <h5 class="aprender">¿Que quiere aprender?</h5>
      @foreach ($likeUsers as $gusto)
      {{-- NO TENGO NI PUTA IDEA DE COMO HACER ESTO --}}
          <p>{{$gusto->name}}</p>
      @endforeach
      <h5 class="aprender">Tus gustos</h5>
      @foreach ($likeUsers as $gusto)
      {{-- NO TENGO NI PUTA IDEA DE COMO HACER ESTO --}}
          <p>{{$gusto->name}}</p>
      @endforeach
    </div>
    @endforeach
  </div> */}