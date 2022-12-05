var express = require('express');
const path = require('path');
const mysql = require('mysql');
var hbs = require('hbs');
var app = express();
let port = process.env.PORT;

app.set('views', path.join(__dirname, './src/views'))
app.set('view engine', 'hbs')

var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "root",
    database: "test_db1"
});

con.connect(function (err) {
    if (err) throw err;
    console.log("DB Connection Successful");
})

app.get('/', (req, res) => {
    con.query("SELECT * FROM Trader", function (err, result, fields) {
        if (err) throw err;
        console.log(result);
        res.get(result[0].First_Name + " \n" +
            result[0].Last_Name + " \n" +
            result[0].Email + " \n" +
            result[0].Phone_Number + " \n" +
            result[0].Cellphone_Number + " \n" +
            result[0].Ethereum_Amount + " " +
            result[0].Ethereum_Address + " \n" +
            result[0].Tier
        );
        var wallet = result[0].Ethereum_Amount;
        res.render('demo', {wallet});
    })
});

var Ethereum_Amount;

app.get('/', function (req, res) {
    res.redirect('index.html');
});
app.use(express.static(path.join(__dirname, './src')));

if (port == null || port == "") {
    port = 8000;
}
app.listen(port); //the port you want to use
console.log("Express server running");