USE OnlineShopDigiKala;

SELECT name, number_of_assigned_order
FROM DeliveryOfficer
WHERE number_of_assigned_order IS NULL;