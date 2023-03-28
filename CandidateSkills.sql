CREATE DATABASE CandidateSkills;

USE CandidateSkills;

CREATE TABLE  CandidateData 
(	
    CandidateId INT , 
    Skill VARCHAR(20)
);

SELECT * FROM CandidateData;

INSERT INTO CandidateData (CandidateId, Skill)
VALUES ( 001 , 'C#' ),
       ( 001 , 'MVC'), 
       ( 001 , 'SQL'),
       ( 145 , 'MVC'),
       ( 145 , 'PowerBI'), 
       ( 145 , 'SQL'),
       ( 345 , 'C#'),
       ( 345 , 'MVC'),
       ( 200 , 'SQL'),
	   ( 005 , 'C#'),
	   ( 005 , 'MVC'),
	   ( 005 , 'SQL'),
	   ( 300 , 'SQL'),
	   ( 300 , 'MVC');

SELECT * FROM CandidateData;

SELECT CandidateId 
FROM CandidateData 
WHERE Skill IN ('C#', 'MVC', 'SQL') 
GROUP BY CandidateId  
HAVING COUNT(DISTINCT skill) = 3 
ORDER BY CandidateId ASC;