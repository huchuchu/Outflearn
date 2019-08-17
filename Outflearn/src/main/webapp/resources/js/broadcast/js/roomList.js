$(function () {

    var socket = io.connect('https://localhost:3000');

    socket.emit('bringRoom')

    socket.on('getRoom', function (msg) {

        var sendData = []

        msg.forEach(item => {
            console.log(item.class_num)
            sendData.push(item.class_num)
        });

        if (sendData[0]) {
            $.ajax({
                url: `liveRooms?liveRooms=${sendData}`,
                success: function (data) {
                    var content = '';
                    data.forEach(item => {
                        content += `<h3><a href='joinLive?room=${item.class_num}'>${item.class_title}</a></h3>`
                    });

                    $('.roomTest').html(content)
                },
                error: function (err) {
                    console.log(err);
                }
            })
        } else {
            $('.roomTest').html(`<h3>방 없다!</h3>`)
        }
    })

    $('.reloadRoom').on('click', function () {
        socket.emit('bringRoom')
    })

})