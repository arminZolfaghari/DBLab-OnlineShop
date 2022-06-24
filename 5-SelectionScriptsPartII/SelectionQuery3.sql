

SELECT name, SUM(amount) as total_amount
FROM Customer as C JOIN Payment as P
ON C.ID = P.customer_ID
GROUP BY name
ORDER BY total_amount DESC
LIMIT 10;

