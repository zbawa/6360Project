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

app.get('/app/home/home.html', (req, res) => {
    var sql = "SELECT * FROM Trader, owned_nft";
    con.query(sql, function (err, result, fields) {
        if (err) throw err;
        console.log(result);
        res.get(result[0].Trader_ID + " \n" + result[0].First_Name + " \n" +
            result[0].Last_Name + " \n" +
            result[0].Email + " \n" +
            result[0].Phone_Number + " \n" +
            result[0].Cellphone_Number + " \n" +
            result[0].Ethereum_Amount + " " +
            result[0].Ethereum_Address + " \n" +
            result[0].Tier + " \n" +
            result[0].NFT_Token_ID + " \n" +
            result[0].NFT_Name + " \n" +
            result[0].Market_Price_Ethereum + " \n" +
            result[0].Market_Price_USD
        );

        var trader1 = {
            tID: result[0].Trader_ID,
            fName: result[0].First_Name,
            lName: result[0].Last_Name,
            email: result[0].Email,
            phone: result[0].Phone_Number,
            cell: result[0].Cellphone_Number,
            wallet: result[0].Ethereum_Amount,
            address: result[0].Ethereum_Address,
            tier: result[0].Tier,
            nftTokenID: result[0].NFT_Token_ID,
            nftName: result[0].NFT_Name,
            ethPrice: result[0].Market_Price_Ethereum,
            usdPrice: result[0].Market_Price_USD
        }
        
        res.render('home', { trader1 });
    })
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

        var trader1 = {
            tID: result[0].Token_ID,
            nftName: result[0].NFT_Name,
            smartContract: result[0].Smart_Contract_Address,
            ethPrice: result[0].Market_Price_Ethereum,
        }
        
        res.render('available', { trader1 });
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

        for (let i = 0, len = 10, text = ""; i < 10; i++) 
        {
            traders[i] = {
                eth_val:    result[i].Ethereum_Value,
                trans_date: result[i].Transaction_Date,
                comm_paid: result[i].Commission_Paid,
                comm_type: result[i].Commission_Type,
                nft_id: result[i].NFT_Token_ID,
                nft_addr: result[i].NFT_Address,
                seller_eth_addr: result[i].Seller_Ethereum_Address,
                buyer_eth_addr: result[i].Buyer_Ethereum_Address,                
            }
        }
       res.render('history', {traders:traders});

    })
});



app.get('/', function (req, res) {
    res.redirect('index.html');
});
app.use(express.static(path.join(__dirname, './src')));

if (port == null || port == "") {
    port = 8000;
}
app.listen(port); //the port you want to use
console.log("Express server running");