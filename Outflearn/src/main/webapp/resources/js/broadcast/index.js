const express = require('express')
var os = require('os')
const https = require('https')

const socketIO = require('socket.io')
const fs = require('fs')

var app = express()

app.use('/css', express.static('./css'))
app.use('/js', express.static('./js'))

const options = {
    key: fs.readFileSync('./key/server.key'),
    cert: fs.readFileSync('./key/server.cert')
}

app.get('/caster', function (req, res) {
    fs.readFile('./caster.html', function (err, data) {
        if (err) {
            res.send(err)
        } else {
            res.writeHead(200, { 'Content-Type': 'text/html' })
            res.write(data)
            res.end()
        }
    })
})

app.get('/user', function (req, res) {
    fs.readFile('./user.html', function (err, data) {
        if (err) {
            res.send(err)
        } else {
            res.writeHead(200, { 'Content-Type': 'text/html' })
            res.write(data)
            res.end()
        }
    })
})

const server = https.createServer(options, app)

const io = socketIO(server)

var liveRooms = []

function findCasterId(room) {
    for (let i = 0; i < liveRooms.length; i++) {
        if (liveRooms[i].room === room) {
            return liveRooms[i].caster
        }
    }
}

io.sockets.on('connection', function (socket) {

    socket.on('message', function (message) {
        console.log('클라이언트 said:', message);
        socket.broadcast.emit('message', message, socket.id)
    })

    socket.on('userMsg', function (msg, room) {
        io.to(findCasterId(room)).emit('message', msg, socket.id)
    })

    socket.on('casterMsg', function (msg, id) {
        io.to(id).emit('message', msg, socket.id)
    })

    socket.on('casterJoin', function (room, name, class_num) {
        console.log('casterJoin')
        socket.name = name
        socket.join(room)

        liveRooms.push({
            'room': room,
            'caster': socket.id,
            'class_num': class_num
        })

        console.log(`캐스터[${socket.id}]가 ${room}에 입장`)
        socket.emit('createdRoom', room, socket.id)
    })

    socket.on('userJoin', function (room, name) {
        console.log(`유저[${socket.id}]가 ${room}에 입장`)
        socket.name = name
        socket.join(room);
        io.to(findCasterId(room)).emit('joinedUser', socket.id)
        io.sockets.to(room).emit('joinedRoom', name)
    })

    socket.on('bye', function () {
        console.log('received bye');
    });

    // Chat

    socket.on('chatMsg', (msg, room) => {
        socket.broadcast.to(room).emit('chatMsg', { type: 'msg', chatMessage: msg, name: socket.name });
    });

    socket.on('disconnect', function () {
        for (let i = 0; i < liveRooms.length; i++) {
            if (liveRooms[i].caster === socket.id) {
                var room = liveRooms[i].room
                io.in(room).clients((error, socketIds) => {
                    socketIds.forEach(socketId => io.to(socketId).emit('chatMsg', { type: 'leaveCaster', class_num: room }));
                });
                liveRooms.splice(i, 1);
                break;
            }
        }
    })

    // Livepage

    socket.on('bringRoom', function () {
        io.to(socket.id).emit('getRoom', liveRooms)
    })

})

server.listen(3000, function () {
    console.log('port 3000!');
})
