<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Preguntas de visitantes</title>
</head>
<body style="">
    @php
        $import="import url('https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap');";
    @endphp
    <div style="justify-content: center;">
    <h1 style="{{'@'.$import}}  font-size: 3em; text-align:center; color: #0077B6;">Preguntas de visitantes</h1>
    <p style=" font-size: 2em; color: #0077B6;" >Nombre:</p>
    <p style="font-size: 1.5em;">{{$contacto['name']}}</p>
    <p style="font-size: 2em; color: #0077B6;"">Email:</p>
    <p style="font-size: 1.5em;">{{$contacto['email']}}</p>
    <p style="font-size: 2em; color: #0077B6;"">Texto:</p>
    <p style="font-size: 1.5em;">{{$contacto['sms']}}</p>
    </div>

</body>
</html>
