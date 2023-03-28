CREATE DATABASE UberTransactions;

USE UberTransactions;

CREATE TABLE  UberUserTransaction 
(	
    UserId INT , 
	Spend DECIMAL(10,2),
    TransactionDate DATETIME
);

SELECT * FROM UberUserTransaction;

INSERT INTO UberUserTransaction (UserId, Spend, TransactionDate) 
VALUES (111, 100.0, '01/08/2022 12:00:00 '),
	   (111, 55.00, '01/10/2022 12:00:00 '),
	   (121, 36.00, '01/18/2022 12:00:00 '),
	   (145, 24.99, '01/26/2022 12:00:00 '),
	   (111, 89.60, '02/05/2022 12:00:00 '),
	   (333, 56.59, '02/05/2022 12:00:00 '),
	   (333, 70.36, '02/05/2022 12:00:00 '),
	   (333, 49.01, '02/05/2022 12:00:00 ');

SELECT * FROM UberUserTransaction;

SELECT UserId, Spend, TransactionDate 
FROM (
  SELECT UserId, Spend, TransactionDate, 
    ROW_NUMBER() OVER (PARTITION BY UserId ORDER BY TransactionDate) AS RowNumber
  FROM UberUserTransaction
) AS Result
WHERE Result.RowNumber = 3
ORDER BY UserId;