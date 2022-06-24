

SELECT O.ID, total_price
FROM `Order` as O JOIN Customer as C
ON O.customer_ID = C.ID
WHERE C.created_at >= '2015-1-1'
GROUP BY O.ID, total_price
HAVING O.total_price >= 100000;

