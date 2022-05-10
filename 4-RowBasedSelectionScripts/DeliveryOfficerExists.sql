USE OnlineShopDigiKala;

SELECT name FROM DeliveryOfficer
WHERE EXISTS (
    SELECT delivery_officer_ID FROM Payment
    WHERE DeliveryOfficer.ID = payment.delivery_officer_ID and amount > 20000000
          );
