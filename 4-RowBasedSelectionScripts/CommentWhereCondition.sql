USE OnlineShopDigiKala;

SELECT customer_ID, product_ID, content FROM Comment
WHERE score in (1, 2, 3);