

SELECT OC.order_ID, AVG(score) as avg_score
FROM OrderContent as OC JOIN Product as P
ON OC.product_ID = P.ID
GROUP BY OC.order_ID
HAVING avg_score >= 7



