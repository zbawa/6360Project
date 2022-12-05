--=====================================================

-- INSERT DUMMIES

--=====================================================

INSERT INTO Trader(First_Name, Last_Name, Email, Phone_Number, Cellphone_Number, Ethereum_Amount, Ethereum_Address, Tier) VALUES
	('Rhiannon', 'Gilbert', 'rhiannongilbert556@gmail.com', '793788179','972447581', 1500.1,'0x0578cdfc3Ce9CafDBfd1efb6E7aAdBdDbD159fc5','Silver'),
	('Simon', 'Parker', 'simonparker455@gmail.com', '471577382','967319123',438.9,'0xcd2bE132F40e518320D6Eb6f54Fe7d620fdDf89e','Silver'),
	('Morgan', 'Shepard', 'morganshepard868@gmail.com', '471577382','613690628',1288.0,'0x25cB3b8de724E98d8d5dbE323FDf0CFD1fF77Df2','Silver'),
	('Sachin', 'Coffey', 'sachincoffey954@gmail.com', '923225250','950631217',1321.4,'0x62b27fEBda0FCAF9F9cC8Bd476cFeaFa5f5D37eC','Silver'),
	('Laiba', 'Salinas', 'laibasalinas643@gmail.com', '825438198','583240158',317.9,'0xfdF0C3102a80dAD04d00acBa5A85BBFc30e6563B','Silver'),
	('Marshall', 'Coleman', 'marshallcoleman592@gmail.com', '630695940','518248856',1845.5,'0xd39dEE6Ef9daA18f2cdED6EC3fcF34143Ee2EeDa''Silver'),
	('Maisy', 'Hurst', 'maisyhurst627@gmail.com', '656485986','726369949',1045.1,'0xD1C923C3D6Fe11886A67C4bCDF05d97a04912d36','Silver'),
	('Maria', 'Solomon', 'mariasolomon757@gmail.com', '868017791','588257406',798.3,'0x2eacCDf04bFBFeA8a5fFD69D7da8dEcB7BECC6Fd','Silver'),
	('Shane', 'Waller', 'shanewaller771@gmail.com', '966317428','790698603',1216.0,'0xe260A15573f8F3D1f9BaAC82Aa0FF1eECAc9C1Cc','Silver'),
	('Tess', 'Newman', 'tessnewman953@gmail.com', '792778473','692169514',2449.6,'0x4c6fD6eaBABBD5D0Dfa6eB1a45A2D9cd5A964Aed''Silver');

-- NOTE : Ethereum_Amount is given in Ethers - make sure to convert it to USD using current market conversion rate

-- NOTE : There is a AUTO_INCREMENT on Trader_ID so it will increment automatically without needing to add while inserting

-------------------------------------------------------

INSERT INTO Credentials(Trader_id, Password) VALUES
	(1001,'rhiannon@2021'),
	(1002,'simon@2395'),
	(1003,'morgan#4005'),
	(1004,'sachin#9392'),
	(1005,'laiba$8715'),
	(1006,'marshall@9428'),
	(1007,'maisy#8870'),
	(1008,'maria$5379'),
	(1009,'shane@7923'),
	(1010,'tess$3311');

-------------------------------------------------------

INSERT INTO NFT(NFT_Name, Smart_Contract_Address, Market_Price_Ethereum) VALUES
	('Artscape','0xC0DBF08d11AF53eb124196de13E3cFBab9B0a6c5',10000),
	('Artholic','0xDec2E8F87bD7A40DFFb6b938E3CB5bd22a4eEA27',20000),
	('Artex','0xd6Fdf78bfDF0bd2D7af307B4DbeABEeD9dDAb2B1',13000),
	('Music Link','0x0f2C1fADEC91Ce23DaBdDe0fAcA2b1dd94849f07',45000),
	('Cosmos Graphic','0xc2BbAda2A06dEccfdca0fE2F725B0cC1ccEDA34d',60000),
	('Artsio','0xB4DE374Ab1FFB6fdAdDB65d0De4C1e88f8FF70ab',50000),
	('Icon','0xEbd53d824be35B4ADD6dbc68F64F4Ed330ef7eFC',12000),
	('Bitsy','0xbBB037FA0CcDDfC5E15D2b2BFE6A4A6aCf3097a2',2000),
	('NFTLord','0xBA152D1dACB513D8d503041dB5F486dbCa085eB7',15000),
	('CyberChads','0xc3342caED957B8FeEb5CF8E3Fd410cfFc29CFC58',40000),
	('Flames','0xf4EC1b20b260CcC3078acfa23ed195a0eaB9dFe6',37000),
	('Vs','0xa5FbACFcfCd7c7489C7147D9148FfcA0f94cD75c',31000),
	('MicroNFT','0x8eEcD46d49aCFcEDAF3892dfffF3E12a2d6ef0B5',11000),
	('Landscape','0xd766d0Da5A185EdaACf7ddBDCBCFB91C5DB47a3A',34000),
	('Art123','0x7d0bCD805CE2134a09bE7efCafc9653bbA4751cE',49000);	

-- NOTE : There is a AUTO_INCREMENT on Token_ID so it will increment automatically without needing to add while inserting

-------------------------------------------------------

INSERT INTO Owned_NFT(Trader_id, NFT_Token_ID, NFT_Name, Market_Price_Ethereum, Market_Price_USD) VALUES
	(1001,2001,'Artscape'10000,0),
	(1003,2002,'Artholic',20000,0),
	(1004,2013,'MicroNFT',11000,0),
	(1002,2008,'Bitsy',2000,0),
	(1005,2003,'Artex',13000,0),
	(1007,2009,'NFTLord',15000,0),
	(1004,2006,'Artsio',50000,0),
	(1008,2004,'Music Link',45000,0),
	(1008,2011,'Flames',37000,0),
	(1006,2005,'Cosmos Graphic',60000,0),
	(1001,2007,'Icon',12000,0),
	(1009,2010,'CyberChads',40000,0)
	(1002,2012,'Vs',31000,0);

-------------------------------------------------------

INSERT INTO Transaction(Ethereum_Value, Transaction_Date, Commission_Paid, Commission_Type, NFT_Token_ID, NFT_Address, Seller_Ethereum_Address, Buyer_Ethereum_Address) VALUES
	(10000,2022-11-04,0.0,'USD',2001,'0xC0DBF08d11AF53eb124196de13E3cFBab9B0a6c5','0xd39dEE6Ef9daA18f2cdED6EC3fcF34143Ee2EeDa','0x0578cdfc3Ce9CafDBfd1efb6E7aAdBdDbD159fc5'),
	(18000,2022-11-05,0.0,'USD',2013,'0x8eEcD46d49aCFcEDAF3892dfffF3E12a2d6ef0B5','0x62b27fEBda0FCAF9F9cC8Bd476cFeaFa5f5D37eC','0x25cB3b8de724E98d8d5dbE323FDf0CFD1fF77Df2'),
	(20000,2022-11-07,0.0,'USD',2002,'0xDec2E8F87bD7A40DFFb6b938E3CB5bd22a4eEA27','0x62b27fEBda0FCAF9F9cC8Bd476cFeaFa5f5D37eC','0x0578cdfc3Ce9CafDBfd1efb6E7aAdBdDbD159fc5'),
	(2000,2022-11-11,0.0,'USD',2008,'0xbBB037FA0CcDDfC5E15D2b2BFE6A4A6aCf3097a2','0xe260A15573f8F3D1f9BaAC82Aa0FF1eECAc9C1Cc','0xcd2bE132F40e518320D6Eb6f54Fe7d620fdDf89e'),
	(13000,2022-11-15,0.0,'USD',2003,'0xd6Fdf78bfDF0bd2D7af307B4DbeABEeD9dDAb2B1','0xcd2bE132F40e518320D6Eb6f54Fe7d620fdDf89e','0xfdF0C3102a80dAD04d00acBa5A85BBFc30e6563B'),
	(15000,2022-11-15,0.0,'USD',2009,'0xBA152D1dACB513D8d503041dB5F486dbCa085eB7','0x4c6fD6eaBABBD5D0Dfa6eB1a45A2D9cd5A964Aed','0xD1C923C3D6Fe11886A67C4bCDF05d97a04912d36'),
	(50000,2022-11-16,0.0,'USD',2006,'0xB4DE374Ab1FFB6fdAdDB65d0De4C1e88f8FF70ab','0x0578cdfc3Ce9CafDBfd1efb6E7aAdBdDbD159fc5','0x4c6fD6eaBABBD5D0Dfa6eB1a45A2D9cd5A964Aed'),
	(45000,2022-11-18,0.0,'USD',2004,'0x0f2C1fADEC91Ce23DaBdDe0fAcA2b1dd94849f07','0x25cB3b8de724E98d8d5dbE323FDf0CFD1fF77Df2','0x2eacCDf04bFBFeA8a5fFD69D7da8dEcB7BECC6Fd'),
	(37000,2022-11-20,0.0,'USD',2011,'0xf4EC1b20b260CcC3078acfa23ed195a0eaB9dFe6','0xD1C923C3D6Fe11886A67C4bCDF05d97a04912d36','0x2eacCDf04bFBFeA8a5fFD69D7da8dEcB7BECC6Fd'),
	(60000,2022-11-21,0.0,'USD',2005,'0xc2BbAda2A06dEccfdca0fE2F725B0cC1ccEDA34d','0x4c6fD6eaBABBD5D0Dfa6eB1a45A2D9cd5A964Aed','0xd39dEE6Ef9daA18f2cdED6EC3fcF34143Ee2EeDa'),
	(12000,2022-11-22,0.0,'USD',2007,'0xEbd53d824be35B4ADD6dbc68F64F4Ed330ef7eFC','0xfdF0C3102a80dAD04d00acBa5A85BBFc30e6563B','0x0578cdfc3Ce9CafDBfd1efb6E7aAdBdDbD159fc5'),
	(20000,2022-11-25,0.0,'USD',2002,'0xDec2E8F87bD7A40DFFb6b938E3CB5bd22a4eEA27','0x0578cdfc3Ce9CafDBfd1efb6E7aAdBdDbD159fc5','0x25cB3b8de724E98d8d5dbE323FDf0CFD1fF77Df2'),
	(40000,2022-11-25,0.0,'USD',2010,'0xc3342caED957B8FeEb5CF8E3Fd410cfFc29CFC58','0xd39dEE6Ef9daA18f2cdED6EC3fcF34143Ee2EeDa','0xe260A15573f8F3D1f9BaAC82Aa0FF1eECAc9C1Cc'),
	(50000,2022-11-26,0.0,'USD',2006,'0xB4DE374Ab1FFB6fdAdDB65d0De4C1e88f8FF70ab','0x4c6fD6eaBABBD5D0Dfa6eB1a45A2D9cd5A964Aed','0x62b27fEBda0FCAF9F9cC8Bd476cFeaFa5f5D37eC'),
	(11000,2022-11-28,0.0,'USD',2013,'0x8eEcD46d49aCFcEDAF3892dfffF3E12a2d6ef0B5','0x25cB3b8de724E98d8d5dbE323FDf0CFD1fF77Df2','0xe260A15573f8F3D1f9BaAC82Aa0FF1eECAc9C1Cc'),
	(31000,2022-11-29,0.0,'USD',2012,'0xa5FbACFcfCd7c7489C7147D9148FfcA0f94cD75c','0xe260A15573f8F3D1f9BaAC82Aa0FF1eECAc9C1Cc','0xcd2bE132F40e518320D6Eb6f54Fe7d620fdDf89e'),
	(11000,2022-12-01,0.0,'USD',2013,'0x8eEcD46d49aCFcEDAF3892dfffF3E12a2d6ef0B5','0xe260A15573f8F3D1f9BaAC82Aa0FF1eECAc9C1Cc','0x62b27fEBda0FCAF9F9cC8Bd476cFeaFa5f5D37eC');

-------------------------------------------------------

INSERT INTO Payment(Amount_Paid, Payment_Address_Ethereum, Payment_Address_Bank, Payment_Date, Type, Trader_ID) VALUES
	(120000,NULL,'',2022-10-01,'USD',1001),
	(120000,NULL,'',2022-10-02,'USD',1002),
	(120000,NULL,'',2022-10-03,'USD',1003),
	(120000,NULL,'',2022-10-04,'USD',1004),
	(120000,NULL,'',2022-10-05,'USD',1005),
	(120000,NULL,'',2022-10-06,'USD',1007),
	(120000,NULL,'',2022-10-07,'USD',1008),
	(120000,NULL,'',2022-10-10,'USD',1006),
	(120000,NULL,'',2022-10-11,'USD',1009),
	(120000,NULL,'',2022-10-15,'USD',1010);

--=====================================================

-- QUERIES

--=====================================================

-- To pull all the NFTs owned by the trader 

SELECT Token_ID, NFT_Name, Market_Price_Ethereum
FROM Owned_NFT 
WHERE Owned_NFT.Trader_id = 'given_trader_id';
-------------------------------------------------------

-- To pull all the NFT's with price 

SELECT Name, Market_Price_Ethereum
FROM NFT;
-------------------------------------------------------

-- To pull data of transaction volume (sum of total amount of transactions done) 

SELECT SUM(Ethereum_Value)
FROM Transaction;
-------------------------------------------------------

-- To alter the amount owned by trader when he adds amount to his ACCOUNT 

UPDATE Trader T
SET T.Ethereum_Amt = updated_val
WHERE T.Trader_ID = 'given trader ID';
-------------------------------------------------------

-- To pull all the transactions done in a DAY

SELECT *
FROM Transaction T
WHERE DATE(T.Transaction_Date) = 'date specified'; -- eg 2022-12-04
-------------------------------------------------------

-- To pull all the transactions done in a DAY by a specific Trader

SELECT *
FROM Transaction T
WHERE DATE(T.Transaction_Date) = 'date specified' AND (T.Seller_Ethereum_Address = 'trader ethereum address' OR T.Buyer_Ethereum_Address = 'trader ethereum address');
-------------------------------------------------------

--  Easy VIEW of city and zipcode for a trader / client

CREATE VIEW City_Zip AS 
SELECT A.City , A.Zipcode
FROM Address A;

--=====================================================

-- FEATURES

--=====================================================

-- Trader Login using ID and Password(from credentials table) 

SELECT C.Password
FROM Credentials C
WHERE C.Trader_ID = (SELECT T.Trader_ID
					 FROM Trader T
					 WHERE T.Email = 'email from login screen'
					);
-------------------------------------------------------

-- Track transaction volume and 2.Trader dashboard to display all NFTs available + NFTs owned by Trader 

-- To pull all the NFTs owned by the trader 

SELECT O.Token_ID, O.NFT_Name, O.Market_Price_Ethereum
FROM Owned_NFT O
WHERE O.Trader_id = 'given_trader_id';

-- Transaction Volume

SELECT SUM(Ethereum_Value)
FROM Transaction
WHERE T.Seller_Ethereum_Address = 'trader ethereum address' OR T.Buyer_Ethereum_Address = 'trader ethereum address';

-- NFTs not owned by any Trader
SELECT * 
FROM NFT N
WHERE N.Token_ID NOT IN (SELECT DISTINCT O.NFT_Token_ID
						 FROM Owned_NFT
						);

-------------------------------------------------------

-- Transaction history to display all the transactions 

SELECT * 
FROM Transaction

-- Transaction history of a specific trader

SELECT *
FROM Transaction T
WHERE T.Seller_Ethereum_Address = 'trader ethereum address' OR T.Buyer_Ethereum_Address = 'trader ethereum address';


-------------------------------------------------------

-- Buy / Sell buttons - Buy adds new NFT to NFT Owned/Sell deletes NFTinfo from NFTOwned (Buy/Sell should alter the Amount value from Traders wallet) 

INSERT INTO Transaction(Ethereum_Value, Transaction_Date, Commission_Paid, Commission_Type, NFT_Token_ID, NFT_Address, Seller_Ethereum_Address, Buyer_Ethereum_Address)
-- (add record) (price of NFT, date, commission, usd, nft id, name, selleraddress, buyeraddress)

INSERT INTO Owned_NFT(Trader_id, NFT_Token_ID, NFT_Name, Market_Price_Ethereum, Market_Price_USD)
-- (add the record) eg (1001, 2001, 'Artsio',10000,0)

UPDATE Trader T
SET T.Ethereum_Amt = T.Ethereum_Amt - 'NFT price'
WHERE T.Ethereum_Address = 'buyeraddress'; 

UPDATE Trader T
SET T.Ethereum_Amt = T.Ethereum_Amt + 'NFT price'
WHERE T.Ethereum_Address = 'selleraddress'; 

-------------------------------------------------------

--  Deciding Tier based on past month

UPDATE Trader Tr
SET Tr.Tier = 'Gold'
WHERE 100000 <= (
				SELECT SUM(T.Ethereum_Value)  
				FROM Transaction T
				WHERE T.Transaction_Date BETWEEN '2022-month-01' AND '2022-month-31' AND 
				(T.Seller_Ethereum_Address = 'trader ethereum address' OR T.Buyer_Ethereum_Address = 'trader ethereum address'); -- put 31 since it will work anyways 

);

UPDATE Trader Tr
SET Tr.Tier = 'Silver'
WHERE 100000 > (
				SELECT SUM(T.Ethereum_Value)  
				FROM Transaction T
				WHERE T.Transaction_Date BETWEEN '2022-month-01' AND '2022-month-31' AND 
				(T.Seller_Ethereum_Address = 'trader ethereum address' OR T.Buyer_Ethereum_Address = 'trader ethereum address'); -- put 31 since it will work anyways 

);

-- execute both since only 1 will satisfy. I dont know how to if else in SQL

-------------------------------------------------------
