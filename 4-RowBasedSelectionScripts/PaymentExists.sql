USE OnlineShopDigiKala;

SELECT ID, amount FROM Payment
WHERE EXISTS (
    SELECT ID FROM Customer
    WHERE created_at >= '2020-01-01 00:00:00' and Payment.customer_ID = Customer.ID
          );
