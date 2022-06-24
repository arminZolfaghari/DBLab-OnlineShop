


SELECT S.name, P.name, P.score
FROM Shop as S JOIN Product as P
ON S.ID = P.shop_id
WHERE P.score >= 9
GROUP BY S.name, P.score
ORDER BY P.score DESC;