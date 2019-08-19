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
    <div id="content">
        <div id="videos">
            <video id="remoteVideo" autoplay playsinline></video>
        </div>

        <div id="chat">
            <ul id="messages"></ul>
            <div class="div-button-send">
                <form id="typing" action="">
                    <input id="m" autocomplete="off" />
                </form>
            </div>
        </div>

        <div id="info">
            <h3>${room.class_title}</h3>
            <div>
                시청자 : <span id="numView">1</span>
            </div>
        </div>
    </div>

    <!-- This file is automatically added/served when running "node index.js". -->
    <!-- <script src="https://localhost:3000/socket.io/socket.io.js"></script> -->
    <script src="https://192.168.10.139:3000/socket.io/socket.io.js"></script>
    <script src="https://localhost:3000/socket.io/socket.io.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.js"></script>
    <script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>


    <!-- Sweet Alert2 -->
    <script src='resources/js/sweetalert/sweetalert2.min.js'></script>

    <script id="userInfo" src="resources/js/broadcast/js/userMain.js" name="${userInfo.user_nickname}"
        room="${room.class_num }"></script>



</body>

</html>