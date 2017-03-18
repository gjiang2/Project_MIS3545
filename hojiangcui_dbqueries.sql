USE YelpDatabase;
GO

--Multiple select* quieries to display all the records from each table--
SELECT *
FROM Business

SELECT *
FROM Category	

SELECT *
FROM Picture		

SELECT *
FROM Review

SELECT *
FROM Reviewer


--query that uses aggregate function--
SELECT  Count(ReviewID) as NumberofReviews
FROM Review
WHERE BusinessID = '4';
-- This query counts the number of reviews that the business with BusinessID = 4 has

--query that select records from 2 or more tables using inner join--
SELECT a.BusinessName, b.Description
FROM Business as a INNER JOIN Review as b
ON a.BusinessID = b.BusinessID;
--this query shows all the reviwes for those that have at least one review

--query that select records from two tables using left outer join--
SELECT a.FirstName, a.LastName, b.Description
FROM Reviewer as a LEFT OUTER JOIN Review as b
ON a.ReviewerID = b.ReviewerID;
--this query shows all the businesses and their respective reviews, it also shows business without any review (NULL)

--query that uses a subquery--
SELECT COUNT(BusinessID) AS NumberofBusinessesWithAScoreAbove4
FROM Business
WHERE BusinessZipCode IN
(SELECT BusinessZipCode FROM Business
WHERE BusinessZipCode LIKE '0245%');