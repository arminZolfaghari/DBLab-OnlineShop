USE OnlineShopDigiKala;

SELECT name, phone_number FROM Shop
WHERE address LIKE '%peterson%' and independent = 0;