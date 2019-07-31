<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

  <link rel="stylesheet" href="resources/js/broadcast/css/main.css" />
</head>
<body>

  <h1>Realtime communication with WebRTC</h1>

  <div id="videos">
    <video id="localVideo" autoplay muted playsinline></video>
    <video id="remoteVideo" autoplay playsinline></video>
  </div>

  <!-- This file is automatically added/served when running "node index.js". -->
  
  <script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
  <script src="https://192.168.10.139:3000/socket.io/socket.io.js"></script>
  <script src="https://192.168.10.139:3000/js/main.js"></script>
  <!-- <script src="https://localhost:3000/index.js"></script> -->

</body>
</html>