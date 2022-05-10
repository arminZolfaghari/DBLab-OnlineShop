USE OnlineShopDigiKala;

SELECT name FROM Product
WHERE price < ALL (
    SELECT price FROM Product
                 WHERE number > 190
);