DATABASE ua_dillards;

SELECT EXTRACT (MONTH FROM saledate) AS date_month,
       EXTRACT (YEAR FROM saledate) AS date_year,
	   COUNT (DISTINCT EXTRACT(DAY FROM saledate))
FROM trnsact
GROUP BY date_year, date_month
ORDER BY dy ASC, dm ASC