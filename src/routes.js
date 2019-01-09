"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var express = require("express");
// Express setup
var app = express();
app.use(express.static(__dirname + '/../views/'));
app.listen(5000);
// Default route - SPA home page
var path = require('path');
app.get('/', function (req, res) {
    res.sendFile(path.join(__dirname + '/../views/index.html'));
});
