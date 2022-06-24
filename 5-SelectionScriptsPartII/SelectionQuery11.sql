

SELECT P.name, COUNT(C.ID) as number_of_total_comment
FROM Product as P JOIN Comment as C
ON P.ID = C.product_ID
GROUP BY P.name
ORDER BY number_of_total_comment DESC
LIMIT 10;