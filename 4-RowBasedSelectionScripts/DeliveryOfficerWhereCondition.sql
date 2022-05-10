USE OnlineShopDigiKala;

SELECT name, phone_number FROM DeliveryOfficer
WHERE number_of_assigned_order >= 2;