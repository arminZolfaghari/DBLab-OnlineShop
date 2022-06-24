


SELECT DO.name, DO.phone_number, SUM(amount) as total_amount
FROM DeliveryOfficer as DO JOIN Payment as P
ON DO.ID = P.delivery_officer_ID
WHERE DO.number_of_assigned_order >= 1
GROUP BY DO.name
HAVING total_amount >= 50000000;