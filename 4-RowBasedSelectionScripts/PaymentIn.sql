USE OnlineShopDigiKala;

SELECT ID, amount FROM Payment
WHERE customer_ID in (
    SELECT ID FROM Customer
    WHERE created_at > '2020-01-01 00:00:00'
    );