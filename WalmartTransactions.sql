CREATE DATABASE WalmartTransactions;

USE WalmartTransactions;

CREATE TABLE WalmartUserTransaction
( 
	ProductId INT,
	UserId INT,
	Spend decimal,
	TransactionDate DATETIME
);

SELECT * FROM WalmartUserTransaction;

INSERT INTO WalmartUserTransaction (ProductId,UserId, Spend, TransactionDate) 
VALUES (3673, 123, 68.90, '07/08/2022 12:00:00 '),
	   (9623, 123, 274.10, '07/08/2022 12:00:00 '),
	   (1467, 115, 19.90,'07/08/2022 12:00:00 '),
	   (2513, 159, 25.00, '07/08/2022 12:00:00 '),
	   (1452, 159, 74.50, '07/10/2022 12:00:00 '),
	   (1546, 321, 14.90,'07/08/2022 12:00:00 '),
	   (7894, 146, 65.00, '07/08/2022 12:00:00 '),
	   (3245, 987, 78.90,'07/08/2022 12:00:00 '),
	   (4859, 321, 32.00, '07/08/2022 12:00:00 ');

SELECT * FROM WalmartUserTransaction;

SELECT 
    MAX(TransactionDate) AS RecentDate, 
    UserId, 
    COUNT(DISTINCT ProductId) AS NumerOfProducts 
FROM 
    WalmartUserTransaction 
GROUP BY 
    UserId 
ORDER BY 
    RecentDate ASC;
