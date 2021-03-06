Database ua_dillards;

SELECT DISTINCT t.store,
	        s.city,
		s.state
FROM trnsact t
JOIN strinfo s ON t.store = s.store
WHERE t.store IN (SELECT days_in_month.store
			      FROM(SELECT EXTRACT(YEAR from saledate) AS sales_year,
				          EXTRACT(MONTH from salesdate) AS sales_month,
				          store,
				          COUNT (DISTINCT saledate) AS numdays
				   FROM trnsact
				   GROUP BY sales_year, sales_month, store
				   HAVING numdays = 11) AS days_in_month)
