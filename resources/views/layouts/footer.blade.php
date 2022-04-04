@push ('css')
<link href="{{URL::asset('./css/footer-style.css')}}" rel="stylesheet ">
<link href="https://fonts.googleapis.com/css2?family=Nova+Round&family=Permanent+Marker&display=swap" rel="stylesheet">
<script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>
@endpush

<footer>
  <div class="row ">
    <div class="d-flex justify-content-between" style="margin-top: 5%;">
      <div class="padd1">
        <span class="iconify" data-icon="ph:instagram-logo" style="color: #181818;" data-width="35" data-height="35"></span>
        <span class="iconify" data-icon="ph:envelope" style="color: #181818;" data-width="35" data-height="35"></span>
        <span class="iconify" data-icon="ph:phone" style="color: #181818;" data-width="35" data-height="35"></span>
        <span class="text-center text-dark p-3">© GureTabadul 2022</span>
      </div>
      {{-- end padd1 --}}
      <div class=""></div>
      <div class="padd2">Web Creada por Raimon4</div>
    </div>
    {{-- end d-flex --}}
  </div>
  {{-- end row --}}
</footer>
