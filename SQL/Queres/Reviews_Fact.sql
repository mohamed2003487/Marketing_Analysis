-- Review Query
SELECT
	ReviewID,
	CustomerID,
	ProductID,
	ReviewDate,
	Rating,
	TRIM(REPLACE(ReviewText,'  ',' ')) AS ReviewText
FROM customer_reviews