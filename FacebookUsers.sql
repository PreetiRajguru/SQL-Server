CREATE DATABASE FacebookUserActions;

USE FacebookUserActions;

CREATE TABLE UserActions
(
	UserId INT,
	EventId INT,
	EventType VARCHAR(10),
	EventDate DATETIME
);

SELECT * FROM UserActions;

INSERT INTO UserActions (UserId,EventId,EventType,EventDate)
VALUES (445, 7765, 'sign-in', '05/31/2022 12:00:00'),
	   (742, 6458, 'sign-in', '06/03/2022 12:00:00'),
	   (445, 3634, 'like', '06/05/2022 12:00:00'),
	   (742, 1374, 'comment', '06/05/2022 12:00:00'),
	   (648, 3124, 'like', '06/18/2022 12:00:00'),
	   (123, 3214, 'sign-in', '09/30/2022 12:00:00'),
	   (546, 7845, 'like', '06/03/2022 12:00:00');


SELECT * FROM UserActions;

SELECT MONTH(EventDate) AS month, COUNT(DISTINCT UserId) AS MAUs
FROM UserActions
WHERE 
    (MONTH(EventDate) = 5 AND EventType IN ('sign-in', 'like', 'comment')) 
    OR 
    (MONTH(EventDate) = 4 AND EventType IN ('sign-in', 'like', 'comment')) 
GROUP BY EventDate
ORDER BY MAUs DESC, month ASC;
