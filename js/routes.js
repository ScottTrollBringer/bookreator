"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express = require("express");
// Express setup
const app = express();
app.use(express.static(__dirname + '/../views/'));
app.listen(5000);
// Default route - SPA home page
const path = require('path');
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname + '/../views/index.html'));
});
