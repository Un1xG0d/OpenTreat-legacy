var express = require('express')
var https = require('https')
var http = require('http')
var fs = require('fs')
var config = require('getconfig')
var sockets = require('./sockets')

var options = {
        key: fs.readFileSync(config.server.key),
        cert: fs.readFileSync(config.server.cert),
        passphrase: config.server.password
};


var app = express()
var server = https.createServer(options, app).listen(443);
sockets(server, config)
