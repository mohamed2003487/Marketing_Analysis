-- CTE To Idenify The Duplicates And Cleaning
WITH DuplicateRecords AS(
	SELECT
		JourneyID,
		CustomerID,
		ProductID,
		VisitDate,
		UPPER(Stage) AS Stage,
		Action,
		Duration,
		AVG(Duration) OVER(PARTITION BY VisitDate) AS AvgDuration,
		ROW_NUMBER() OVER(PARTITION BY JourneyID ORDER BY JourneyID) AS RN
	FROM customer_journey
)

SELECT 
	JourneyID,
	CustomerID,
	ProductID,
	VisitDate,
	Stage,
	Action,
	COALESCE(Duration,AvgDuration) AS Duration
FROM DuplicateRecords 
WHERE RN = 1
