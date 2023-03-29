CREATE DATABASE CompanyJobs;

USE CompanyJobs;

CREATE TABLE Jobs 
( 
    JobId INT PRIMARY KEY,
    CompanyId INT,
    Title VARCHAR(30),
    Description TEXT
);

SELECT * FROM Jobs;

INSERT INTO Jobs (JobId, CompanyId, Title, Description) 
VALUES (248, 827, 'Business Analyst', 'Business analyst evaluates past and current business data with the primary goal of improving decision-making processes within organizations. '),
       (149, 845, 'Business Analyst', 'Business analyst evaluates past and current business data with the primary goal of improving decision-making processes within organizations.'),
       (945, 345, 'Data Analyst', 'Data analyst reviews data to identify key insights into a business''s customers and ways the data can be used to solve problems.'),
       (164, 345, 'Data Analyst', 'Data analyst reviews data to identify key insights into a business''s customers and ways the data can be used to solve problems.'),
       (172, 244, 'Data Engineer', 'Data engineer works in a variety of settings to build systems that collect, manage, and convert raw data into usable information for data scientists and business analysts to interpret.'),
	   (542, 475, 'Data Engineer', 'Data engineer works in a variety of settings to build systems that collect, manage, and convert raw data into usable information for data scientists and business analysts to interpret.'),
	   (968, 653, 'Business Analyst', 'Business analyst evaluates past and current business data with the primary goal of improving decision-making processes within organizations.'),
	   (784, 475, 'Data Engineer', 'Data engineer works in a variety of settings to build systems that collect, manage, and convert raw data into usable information for data scientists and business analysts to interpret.');

SELECT * FROM Jobs;

SELECT COUNT(CompanyId) AS DuplicateJobsCompaniesCount
FROM(
SELECT CompanyId
FROM Jobs 
GROUP BY CompanyId,Title 
HAVING COUNT(Title) > 1) AS Result;


SELECT COUNT(DISTINCT j1.CompanyId) AS DuplicateJobsCompaniesCount
FROM Jobs j1
JOIN Jobs j2 ON j1.CompanyId = j2.CompanyId
  AND j1.Title = j2.Title
  AND j1.JobId < j2.JobId