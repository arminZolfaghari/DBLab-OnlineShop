SELECT name, amount
FROM Customer as C JOIN Payment as P
ON C.ID = P.customer_ID
WHERE P.amount >= 20000000
ORDER BY P.amount DESC;
