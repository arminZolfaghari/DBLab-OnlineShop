

SELECT S.name, COUNT(P.ID) as number_of_type_product
FROM Shop as S JOIN Product as P
ON S.ID = P.shop_id
WHERE P.price >= 5000000
GROUP BY S.name
ORDER BY number_of_type_product DESC
LIMIT 10;


