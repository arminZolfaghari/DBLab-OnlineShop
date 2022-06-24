


SELECT S.name, SUM(P.number) as total_number_of_product
FROM Shop as S JOIN Product as P
ON S.ID = P.shop_id
GROUP BY S.name
ORDER BY total_number_of_product DESC
LIMIT 15;


