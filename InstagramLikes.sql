CREATE DATABASE InstagramPages;

USE InstagramPages;

CREATE TABLE PageData 
( 
	PageId INT PRIMARY KEY,
	PageName VARCHAR(30)
);

SELECT * FROM PageData;

INSERT INTO PageData (PageId, PageName)
VALUES ( 20001 , 'SQL Solutions' ),
	   ( 20045 , 'Brain Exercises'),
	   ( 20701 , 'Tips for Data Analysts '),
	   ( 20703 , 'SQL Theory '),
	   ( 20512 , 'C# Basics ');

SELECT * FROM PageData;

CREATE TABLE LikesData 
( 
	UserId INT PRIMARY KEY,
	PageId INT FOREIGN KEY REFERENCES PageData(PageId),
	LikedDate DATETIME,
);

SELECT * FROM LikesData;

INSERT INTO LikesData (UserId, PageId, LikedDate) 
VALUES (111, 20001, '04/08/2022 00:00:00 '),
	   (121, 20045, '03/12/2022 00:00:00 '),
	   (156, 20001, '07/25/2022 00:00:00 ');

SELECT * FROM LikesData;

SELECT PageId 
FROM PageData 
WHERE PageId NOT IN (SELECT PageId FROM LikesData) 
ORDER BY PageId ASC;
