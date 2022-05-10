USE OnlineShopDigiKala;

SELECT name FROM Product
WHERE ID = ANY (SELECT DISTINCT product_ID
                FROM OrderContent);

