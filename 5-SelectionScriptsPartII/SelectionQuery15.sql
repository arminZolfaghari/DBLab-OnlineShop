

SELECT SUM(OC.number)
FROM `Order` as O JOIN OrderContent as OC
ON O.ID = OC.order_ID;

