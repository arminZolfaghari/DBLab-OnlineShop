SELECT name, number_of_assigned_order
FROM DeliveryOfficer as D JOIN payment P
ON D.ID = P.delivery_officer_ID
WHERE P.amount >= 20000000
GROUP BY name, number_of_assigned_order
having number_of_assigned_order >= 2;