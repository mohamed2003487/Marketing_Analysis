
SELECT 
	ProductID,
	ProductName,
	Price,
	-- Categorizes The Product Into Price Categories
	CASE
		WHEN Price > 200 THEN 'High'
		WHEN Price > 50 THEN 'Medium'
		ELSE 'Low'
	END AS PriceCategory

FROM products