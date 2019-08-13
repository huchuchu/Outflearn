var socket = io.connect("https://localhost:3000");

socket.emit('getLive')

socket.on('liveList', function (data) {

    console.log(data);

    $.ajax({
        url: 'liveRooms',
        method: 'get',
        data: {
            'liveRooms': data
        },
        success: function (msg) {
            console.log(msg);
        },
        error: function (err) {
            console.log(err);
        }
    })

})

