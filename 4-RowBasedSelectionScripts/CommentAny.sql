USE OnlineShopDigiKala;

SELECT content FROM Comment
WHERE customer_ID = ANY (
    SELECT ID FROM Customer
              WHERE name LIKE 'elizabeth%'
);