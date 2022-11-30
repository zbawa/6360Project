var express = require('express');
var path = require('path');
var app = express();
let port = process.env.PORT;

app.use(express.static(path.join(__dirname, './src')));

app.get('/', function(req, res) {
    res.redirect('index.html');
});

if (port == null || port == ""){
    port = 8000;
}
app.listen(port); //the port you want to use
console.log("Express server running");