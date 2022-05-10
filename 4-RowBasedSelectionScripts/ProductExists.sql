USE OnlineShopDigiKala;

SELECT name, price FROM Product
WHERE EXISTS (
    SELECT ID FROM shop
    WHERE ID = product.shop_id  AND name LIKE 'internet%'
    );
