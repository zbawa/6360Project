var express = require('express');
const path = require('path');
const mysql = require('mysql');
var hbs = require('hbs');
var app = express();
const session = require('express-session');
let port = process.env.PORT;

app.set('views', path.join(__dirname, './src/views'))
app.set('view engine', 'hbs')

var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "root",
    database: "test_db1"
});

app.use(session({
    secret: 'secret',
    resave: true,
    saveUninitialized: true
}));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

con.connect(function (err) {
    if (err) throw err;
    console.log("DB Connection Successful");
})

app.get('/app/home/home.html', (req, res) => {
    var sql = "SELECT * FROM Trader, owned_nft WHERE EMAIL=?";
    if (req.session.loggedin) {
        var traderEmail = req.session.username;
        con.query(sql, [traderEmail], function (err, result, fields) {
            if (err) throw err;
            console.log(result);
            res.get(
                result[0].NFT_Token_ID + " \n" +
                result[0].NFT_Name + " \n" +
                result[0].Market_Price_Ethereum + " \n" +
                result[0].Market_Price_USD + " \n" +
                result[0].Trader_ID + " \n" +
                result[0].First_Name + " \n" +
                result[0].Last_Name + " \n" +
                result[0].Email + " \n" +
                result[0].Ethereum_Amount + " \n" +
                result[0].Tier
            );


            //console.log(result[0].NFT_Token_ID);
            //console.log(result[0].NFT_Name);
            //console.log(result[0].Market_Price_Ethereum);
            //console.log(result[0].Market_Price_USD);
            //console.log(result[0].Trader_ID);
            //console.log(result[0].First_Name);
            //console.log(result[0].Last_Name);


            var trader1 = new Array(10);

            for (let i = 0, len = 10, text = ""; i < 10; i++) {
                trader1[i] = {
                    nftTokenID: result[i].NFT_Token_ID,
                    nftName: result[i].NFT_Name,
                    ethPrice: result[i].Market_Price_Ethereum,
                    usdPrice: result[i].Market_Price_USD
                }
            }

            var trader2 = {
                tID: result[0].Trader_ID,
                fName: result[0].First_Name,
                lName: result[0].Last_Name,
                email: result[0].Email,
                phone: result[0].Phone_Number,
                cell: result[0].Cellphone_Number,
                wallet: result[0].Ethereum_Amount,
                address: result[0].Ethereum_Address,
                tier: result[0].Tier
            }

            res.render('home', { trader1, trader2 });

        })
    }
});

app.get('/app/available-nfts/available-nfts.html', function (req, res) {
    var sql = "SELECT * FROM NFT";
    con.query(sql, function (err, result, fields) {
        if (err) throw err;
        console.log(result);
        res.get(result[0].Token_ID + " \n" + result[0].NFT_Name + " \n" +
            result[0].Smart_Contract_Address + " \n" +
            result[0].Market_Price_Ethereum
        );
        var availablenfts = new Array(10);

        for (let i = 0, len = 10, text = ""; i < 10; i++) {
            availablenfts[i] = {
                tID: result[i].Token_ID,
                nftName: result[i].NFT_Name,
                smartContract: result[i].Smart_Contract_Address,
                ethPrice: result[i].Market_Price_Ethereum,

            }
        }

        /*var trader1 = {
            tID: result[0].Token_ID,
            nftName: result[0].NFT_Name,
            smartContract: result[0].Smart_Contract_Address,
            ethPrice: result[0].Market_Price_Ethereum,
        }*/

        res.render('available', { traders: availablenfts });
    })
});

app.get('/app/features/history.html', function (req, res) {
    var sql = "SELECT * FROM Transaction";
    con.query(sql, function (err, result, fields) {
        if (err) throw err;
        console.log(result);
        res.get(result[0].Ethereum_Value + " \n" +
            result[0].Transaction_Date + " \n" +
            result[0].Commission_Paid + " \n" +
            result[0].Commission_Type + " \n" +
            result[0].NFT_Token_ID + " \n" +
            result[0].NFT_Address + " \n" +
            result[0].Seller_Ethereum_Address + " \n" +
            result[0].Buyer_Ethereum_Address
        );
        var traders = new Array(10);

        for (let i = 0, len = 10, text = ""; i < 10; i++) {
            traders[i] = {
                eth_val: result[i].Ethereum_Value,
                trans_date: result[i].Transaction_Date,
                comm_paid: result[i].Commission_Paid,
                comm_type: result[i].Commission_Type,
                nft_id: result[i].NFT_Token_ID,
                nft_addr: result[i].NFT_Address,
                seller_eth_addr: result[i].Seller_Ethereum_Address,
                buyer_eth_addr: result[i].Buyer_Ethereum_Address,
            }
        }
        res.render('history', { traders: traders });

    })
});


app.post('/auth', function (request, response) {
    // Capture the input fields
    let username = request.body.username;
    let password = request.body.password;
    console.log(username);
    // Ensure the input fields exists and are not empty
    if (username && password) {
        // Execute SQL query that'll select the account from the database based on the specified username and password
        con.query('SELECT T.Email, C.Password  FROM Trader T, Credentials C WHERE T.Email = ? AND C.Password = ?', [username, password], function (error, results, fields) {
            // If there is an issue with the query, output the error
            if (error) throw error;
            // If the account exists
            if (results.length > 0) {
                // Authenticate the user
                request.session.loggedin = true;
                request.session.username = username;
                // Redirect to home page
                response.redirect('/app/home/home.html');
            } else {
                response.send('Incorrect Username and/or Password!');
            }
            response.end();
        });
    } else {
        response.send('Please enter Username and Password!');
        response.end();
    }
});

app.get('/', function (req, res) {
    res.sendFile(path.join(__dirname + '/src/index.html'));
});
app.use(express.static(path.join(__dirname, './src')));

if (port == null || port == "") {
    port = 8000;
}
app.listen(port); //the port you want to use
console.log("Express server running");
