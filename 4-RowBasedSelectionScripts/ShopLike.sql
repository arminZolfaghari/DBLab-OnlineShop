USE OnlineShopDigiKala;

SELECT name, address, supervisor_name FROM Shop
WHERE supervisor_name LIKE 'Alex%' or supervisor_name LIKE 'Raymond%';