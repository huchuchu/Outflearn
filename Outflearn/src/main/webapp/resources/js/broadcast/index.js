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

app.get('/', function (req, res) {
    fs.readFile('./index.html', function (err, data) {
        if (err) {
            res.send(err)
        } else {
            res.writeHead(200, { 'Content-Type': 'text/html' })
            res.write(data)
            res.end()
        }
    })
})

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
        if (liveRooms[i].roomName === room) {
            return liveRooms[i].caster
        }
    }
}

io.sockets.on('connection', function (socket) {

    function log() {
        var array = ['서버 log : ']
        array.push.apply(array, arguments)
        socket.emit('log', array)
    }

    socket.on('message', function (message, room) {
        log('클라이언트 said:', message);
        socket.broadcast.to(room).emit('message', message, socket.id)
    })

    socket.on('userMsg', function (msg, room) {
        io.to(findCasterId(room)).emit('message', msg, socket.id)
    })

    socket.on('casterMsg', function (msg, id) {
        io.to(id).emit('message', msg, socket.id)
    })

    socket.on('create or join', function (name, room) {
        log('create or join 요청 받음')

        var clientsInRoom = io.sockets.adapter.rooms[room]
        var numClients = clientsInRoom ? Object.keys(clientsInRoom.sockets).length : 0;
        log(`${room}방에 ${numClients}명 들어와 있다`)

        socket.name = name
        socket.join(room)

        console.log(`[${socket.name}] joined ${room}`);
        io.sockets.to(room).emit('joinedRoom', {
            room: room,
            name: socket.name
        })

        if (numClients === 0) {
            log(`${socket.id}가 ${room}에 입장`)

            liveRooms.push({
                'roomName': room,
                'caster': socket.id
            })

            socket.emit('created', room, socket.id)

        } else {
            log(`${socket.id}가 ${room}에 입장`)
            // io.sockets.in(room).emit('join', numClients, socket.id);
            io.to(findCasterId(room)).emit('join', numClients, socket.id);
            // socket.join(room);
            // socket.emit('entrance', room, socket.id);
        }
    })

    socket.on('bye', function () {
        console.log('received bye');
    });

    // Chat

    socket.on('chatMsg', (msg, room) => {
        socket.broadcast.to(room).emit('chatMsg', { type: 'msg', chatMessage: msg, name: socket.name });
        console.log('[' + socket.name + '] send >>' + msg);
    });
    socket.on('disconnect', function () {
        for (let i = 0; i < liveRooms.length; i++) {
            if (liveRooms[i].caster === socket.id) {
                var room = liveRooms[i].roomName
                io.in(room).clients((error, socketIds) => {
                    socketIds.forEach(socketId => io.to(socketId).emit('chatMsg', { type: 'leaveCaster' }));
                });
                break;
            }
        }
    })

})

server.listen(3000, function () {
    console.log('port 3000!');
})
