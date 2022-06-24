

SELECT O.ID, SUM(OC.number) as number_of_total_product_in_order
FROM `Order` as O JOIN OrderContent as OC
ON O.ID = OC.order_ID
GROUP BY O.ID
ORDER BY number_of_total_product_in_order DESC
LIMIT 10;