USE onlineshopdigikala;

SELECT SUM(P.amount) as total_amount
FROM Customer as C JOIN Payment as P
ON C.ID = P.customer_ID
WHERE C.created_at >= '2021-01-01';

