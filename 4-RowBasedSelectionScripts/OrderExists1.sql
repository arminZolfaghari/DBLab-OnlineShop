USE OnlineShopDigiKala;

SELECT ID, total_price FROM `Order`
WHERE EXISTS (
    SELECT ID FROM Customer
    WHERE `Order`.customer_ID = Customer.ID AND name LIKE 'reb%'
          );