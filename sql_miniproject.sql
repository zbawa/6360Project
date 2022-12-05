CREATE TABLE Trader (
	Trader_ID  INT NOT NULL AUTO_INCREMENT,
	First_Name VARCHAR(50) NOT NULL,
	Last_Name  VARCHAR(50) NOT NULL,
	Email  VARCHAR(100) NOT NULL,
	Phone_Number VARCHAR(15) NOT NULL,
	Cellphone_Number VARCHAR(15) NOT NULL,
	Ethereum_Amount FLOAT NOT NULL DEFAULT 0.0,
	Ethereum_Address VARCHAR(100) UNIQUE NOT NULL,
	Tier VARCHAR(10) NOT NULL DEFAULT "Silver",

	PRIMARY KEY (Trader_ID)
);
ALTER TABLE Trader AUTO_INCREMENT=1001;

CREATE TABLE Address(
	Trader_ID INT NOT NULL,
	Street VARCHAR(100) NOT NULL,
	City VARCHAR(20) NOT NULL,
	State VARCHAR(100) NOT NULL,
	Zipcode INT NOT NULL,

	PRIMARY KEY (Trader_ID),
	FOREIGN KEY (Trader_ID) REFERENCES Trader(Trader_ID)
);

CREATE TABLE Credentials(
	Trader_ID INT NOT NULL,
	Password VARCHAR(100) NOT NULL,

	PRIMARY KEY (Trader_ID),
	FOREIGN KEY (Trader_ID) REFERENCES Trader(Trader_ID)
);

CREATE TABLE NFT(
	Token_ID INT NOT NULL AUTO_INCREMENT,
	NFT_Name VARCHAR(100) NOT NULL,
	Smart_Contract_Address VARCHAR(255) NOT NULL,
	Market_Price_Ethereum FLOAT NOT NULL,
	Unique(Token_ID, Smart_Contract_Address),

	PRIMARY KEY (Token_ID)
);
ALTER TABLE NFT AUTO_INCREMENT=2001

CREATE TABLE Owned_NFT(
	Trader_ID INT NOT NULL,
	NFT_Token_ID INT NOT NULL,
	NFT_Name VARCHAR(100) NOT NULL,
	Market_Price_Ethereum FLOAT NOT NULL,
	Market_Price_USD FLOAT NOT NULL,

	PRIMARY KEY (Trader_ID,NFT_Token_ID),
	FOREIGN KEY (Trader_ID) REFERENCES Trader (Trader_ID),
	FOREIGN KEY (NFT_Token_ID) REFERENCES NFT(Token_ID)

	-- Market_Price_USD need to be calculated based on current Ethereum market value as
	-- per the project statement
);

CREATE TABLE Payment(
	Payment_ID INT NOT NULL AUTO_INCREMENT,
	Amount_Paid FLOAT NOT NULL,
	Payment_Address_Ethereum VARCHAR(100),
	Payment_Address_Bank VARCHAR(100),
	Payment_Date datetime DEFAULT CURRENT_TIMESTAMP,
	Type VARCHAR(10),
	Trader_ID INT NOT NULL,

	PRIMARY KEY (Payment_ID),
	FOREIGN KEY (Trader_ID) REFERENCES TRADER(Trader_ID)

	-- If payment done in USD, convert to Ethereum based on current market
	-- exchange and update Trader(Ethereum_Amount)
);
ALTER TABLE Payment AUTO_INCREMENT=70001;

CREATE TABLE Transaction(
	Transaction_ID INT NOT NULL AUTO_INCREMENT,
	Ethereum_Value FLOAT NOT NULL,
	Transaction_Date datetime DEFAULT CURRENT_TIMESTAMP,
	Commission_Paid FLOAT NOT NULL,
	Commission_Type VARCHAR(10) NOT NULL,
	NFT_Token_ID INT NOT NULL,
	NFT_Address VARCHAR(255) NOT NULL,
	Seller_Ethereum_Address VARCHAR(100) NOT NULL,
	Buyer_Ethereum_Address VARCHAR(100) NOT NULL,

	PRIMARY KEY (Transaction_ID),
	FOREIGN KEY (NFT_Token_ID,NFT_Address) REFERENCES NFT(Token_ID,Smart_Contract_Address),
	FOREIGN KEY (Seller_Ethereum_Address) REFERENCES Trader(Ethereum_Address),
	FOREIGN KEY (Buyer_Ethereum_Address) REFERENCES Trader(Ethereum_Address)
);

ALTER TABLE Transaction AUTO_INCREMENT=70001;
-- Transaction_ID and Trader_ID start with different intial counters so as to avoid any
-- collission among them

CREATE TABLE Deleted_Transaction(
	Transaction_ID INT NOT NULL,
	Ethereum_Value FLOAT NOT NULL,
	Transaction_Date datetime,
	Commission_Paid FLOAT NOT NULL,
	Commission_Type VARCHAR(10) NOT NULL,
	NFT_Token_ID INT NOT NULL,
	NFT_Address VARCHAR(255) NOT NULL,
	Seller_Ethereum_Address VARCHAR(100) NOT NULL,
	Buyer_Ethereum_Address VARCHAR(100) NOT NULL,
	Deletion_Time datetime DEFAULT CURRENT_TIMESTAMP,

	PRIMARY KEY (Transaction_ID),
	FOREIGN KEY (Transaction_ID) REFERENCES Transaction(Transaction_ID),
	FOREIGN KEY (NFT_Token_ID,NFT_Address) REFERENCES NFT(Token_ID,Smart_Contract_Address),
	FOREIGN KEY (Seller_Ethereum_Address) REFERENCES Trader(Ethereum_Address),
	FOREIGN KEY (Buyer_Ethereum_Address) REFERENCES Trader(Ethereum_Address)
);

CREATE TABLE Transaction_Log (
	Trader_ID INT NOT NULL,
	NFT_Token_ID VARCHAR(256) NOT NULL,
	Transaction_ID INT NOT NULL,

	PRIMARY KEY(Trader_ID, NFT_Token_ID, Transaction_ID),
	FOREIGN KEY (Transaction_ID) REFERENCES Transaction(Transaction_ID),
	FOREIGN KEY (Trader_ID) REFERENCES Trader(Trader_ID),
	FOREIGN KEY (NFT_Token_ID) REFERENCES NFT(Token_ID)
)
