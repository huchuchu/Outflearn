var socket = io.connect();

socket.emit('getLive')

socket.on('liveList', function (data) {

})

