USE OnlineShopDigiKala;

SELECT name, address FROM Shop
WHERE EXISTS (
    SELECT shop_id FROM Product
    WHERE shop.ID = product.shop_id and score > 8
          );
