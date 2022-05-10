USE OnlineShopDigiKala;

SELECT ID, total_price FROM `Order`
WHERE total_price > 0 and EXISTS (
    SELECT ID FROM Customer
    WHERE created_at >= '2021-1-1 00:00:00' and `order`.customer_ID = Customer.ID
    );
