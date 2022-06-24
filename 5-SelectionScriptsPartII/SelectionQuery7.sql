

SELECT C.name, SUM(P.amount) as total_amount
FROM Customer as C JOIN Payment as P
ON C.ID = P.customer_ID
WHERE C.created_at >= '2013-01-01'
GROUP BY C.name
HAVING total_amount >= 5000000