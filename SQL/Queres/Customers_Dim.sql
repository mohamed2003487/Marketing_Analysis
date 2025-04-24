-- Customers Query
SELECT
	c.CustomerID,
	c.CustomerName,
	c.Age,
	CASE
		WHEN Age < 30 THEN '18-29'
		WHEN Age < 40 THEN '30-39'
		WHEN Age < 50 THEN '40-49'
		ELSE '50+'
	END AS AgeCategory,
	c.Gender,
	g.City,
	g.Country
FROM customers c
LEFT JOIN geography g 
	ON c.GeographyID = g.GeographyID