//----------------------------------------------------------------------------------------------------------------------
// Config
//----------------------------------------------------------------------------------------------------------------------
_ = require('underscore'),
NET = require('net'),
SOCKET = require('./app/socket.js'),
AUTH = require('./app/auth.js'),
PORT = 7200,
clients = 0;

//----------------------------------------------------------------------------------------------------------------------
// Create server
//----------------------------------------------------------------------------------------------------------------------
var server = NET.createServer(function (client) {
    SOCKET.debug("Client connected at ip " + client.address().address);
    clients++;
    var clientId = clients;
    //------------------------------------------------------------------------------------------------------------------
    // Client connected
    //------------------------------------------------------------------------------------------------------------------
    SOCKET.debug('Client connected: ' + clientId);

    //------------------------------------------------------------------------------------------------------------------
    // Ask for authentication
    //------------------------------------------------------------------------------------------------------------------
    SOCKET.send(client, {'action': 'welcome'});

    //------------------------------------------------------------------------------------------------------------------
    // On error event
    // - Avoid node crash
    //------------------------------------------------------------------------------------------------------------------
    client.on('error', function (err) {
        SOCKET.debug('Client disconnected: ' + clientId);
    });

    //------------------------------------------------------------------------------------------------------------------
    // On client disconnect
    //------------------------------------------------------------------------------------------------------------------
    client.on('end', function () {
        SOCKET.debug('Client disconnected: ' + clientId);
    });

    //------------------------------------------------------------------------------------------------------------------
    // On receive data
    //------------------------------------------------------------------------------------------------------------------
    client.on('data', function (data) {
        SOCKET.data(client, data);
    });

    client.pipe(client);
});

//----------------------------------------------------------------------------------------------------------------------
// Initialize server
//----------------------------------------------------------------------------------------------------------------------
server.listen(PORT, function () {
    SOCKET.debug('Server started on port ' + PORT);
});
