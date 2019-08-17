<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Outflearn</title>

    <link rel="stylesheet" href="resources/js/broadcast/css/main.css" />
    <!-- Sweet Alert2 -->
    <link href='resources/js/sweetalert/sweetalert2.min.css' rel='stylesheet' />

</head>

<body>

    <div id="videos">
        <video id="remoteVideo" autoplay muted playsinline></video>
    </div>

    <div id="chat">
        <ul id="messages"></ul>
        <div class="div-button-send">
            <form action="">
                <input id="m" autocomplete="off" /><button>전 송</button>
            </form>
        </div>
    </div>

    <!-- This file is automatically added/served when running "node index.js". -->
    <script src="https://localhost:3000/socket.io/socket.io.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.js"></script>
    <script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
    <script type="text/javascript">
        var room = ${ room }
    </script>

    <script src="resources/js/broadcast/js/userMain.js"></script>

    <!-- Sweet Alert2 -->
    <script src='resources/js/sweetalert/sweetalert2.min.js'></script>


</body>

</html>