

SELECT P.name, C.content
FROM Product as P JOIN Comment as C
ON P.ID = C.product_ID
WHERE P.score >= 6
GROUP BY P.name, C.score
HAVING C.score < 4