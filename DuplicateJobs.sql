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





















--HAVING COUNT(title) > 1 AND COUNT(description) > 1 ;

--SELECT COUNT(DISTINCT company_id) 
--FROM jobs 
--WHERE (title, description) 
--IN 
--(SELECT title, description FROM jobs GROUP BY title, description HAVING COUNT(*) > 1);

--SELECT COUNT(DISTINCT company_id) AS companies_with_duplicate_jobs
--FROM (
--  SELECT 
--    company_id, 
--    title, 
--    description, 
--    COUNT(job_id) AS job_count
--  FROM jobs
--  GROUP BY 
--    company_id, 
--    title, 
--    description) AS jobs_grouped
--WHERE job_count > 1;
----) AS duplicates

-- SELECT COUNT(DISTINCT company_id) 
-- FROM jobs 
-- WHERE (title AND description) IN (
--   SELECT title, description 
--   FROM jobs 
--   GROUP BY title, description 
--   HAVING COUNT(*) > 1
--);

--SELECT COUNT(DISTINCT company_id) AS co_w_duplicate_jobs
--FROM (
--  SELECT 
--    company_id, 
--    title, 
--    description, 
--    COUNT(job_id) AS job_count
--  FROM jobs
--  GROUP BY 
--    company_id, 
--    title, 
--    description) AS jobs_grouped
--WHERE job_count > 1;

--select s.company_id, t.* 
--from jobs s
--join (
--    select title, description, count(*) as qty
--    from jobs
--    group by title, description
--    having count(*) > 1
--) t on s.title = t.title and s.description = t.description

--select 
--    s1.company_id
--    ,s1.title
--    ,s1.description 
--from 
--    jobs s1,
--	jobs s2
--Where
--   s1.company_id <> s2.company_id
--    and
--	s1.title = s2.title
--    and s1.description = s2.description

--SELECT company_id,title, description, COUNT(*)
--FROM jobs
--GROUP BY title, description
--HAVING COUNT(*)>1