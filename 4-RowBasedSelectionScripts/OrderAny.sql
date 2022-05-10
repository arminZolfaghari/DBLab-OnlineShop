USE OnlineShopDigiKala;

SELECT DISTINCT customer_ID FROM `Order`
WHERE total_price = ANY (
    SELECT total_price FROM `Order`
                       WHERE total_price >= 20000000
)