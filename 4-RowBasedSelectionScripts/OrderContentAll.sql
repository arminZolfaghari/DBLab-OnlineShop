USE OnlineShopDigiKala;

SELECT order_ID FROM OrderContent
WHERE EXISTS (
    SELECT ID FROM Product
    WHERE shop_id = 50 and OrderContent.product_ID = Product.ID
          );
