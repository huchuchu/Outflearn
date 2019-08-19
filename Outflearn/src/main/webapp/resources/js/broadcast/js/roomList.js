//var socket = io.connect("https://localhost:3000");
var socket = io.connect("https://192.168.10.139:3000");

socket.emit('getLive')

socket.on('liveList', function (data) {

    console.log(data);
    var sendData = []

    data.forEach(item => {
        sendData.push(item.class_num)
    })

    if (sendData[0]) {
        $.ajax({
            url: `liveRooms?liveRooms=${sendData}`,
            method: 'get',
            success: function (msg) {
            	
                $('.carousel-indicators').html(setIndicator(msg))
                $('.carousel-inner').html(setInner(msg))

            },
            error: function (err) {
                console.log(err);
            }
        })

    }

})

function setIndicator(msg) {
    var indicators = "";
    for (let i = 0; i < msg.length; i++) {
        if (i === 0) {
            indicators += `<li data-target="#myCarousel" data-slide-to="0" class="active"></li>`
        } else {
            indicators += `<li data-target="#myCarousel" data-slide-to=${i}></li>`
        }
    }
    return indicators
}

function setInner(msg) {
    var inner = "";
    for (let i = 0; i < msg.length; i++) {
        if (i === 0) {
            inner +=`<div class="item active">${msg[i].class_title}</div>`
        } else {
            inner +=`<div class="item">${msg[i].class_title}</div>`
        }
    }
    return inner
}

