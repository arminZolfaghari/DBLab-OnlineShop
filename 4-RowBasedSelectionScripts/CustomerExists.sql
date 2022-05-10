USE OnlineShopDigiKala;

SELECT name, ID FROM customer
WHERE EXISTS(
    SELECT customer_ID FROM payment
    WHERE customer.ID = payment.customer_ID and amount >= 20000000
          );