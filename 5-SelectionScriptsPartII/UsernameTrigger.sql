USE onlineshopdigikala;

CREATE TABLE UsernameChanges
(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    change_date TIMESTAMP NOT NULL,
    customer_ID INT,
    FOREIGN KEY (customer_ID) REFERENCES Customer(ID)
);

CREATE TRIGGER BeforeChangeUsername
    BEFORE UPDATE
    ON customer
    FOR EACH ROW
BEGIN
    DECLARE total_changes_for_this_customer INT;
    SET total_changes_for_this_customer =
        (
            SELECT count(customer_ID)
            FROM UsernameChanges
            WHERE NEW.ID = UsernameChanges.customer_ID AND TIMESTAMPDIFF(DAY, change_date, CURRENT_TIMESTAMP) = 0
            );

    if (total_changes_for_this_customer >= 2)
        THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'You cant change your name more than 2 times a day!!!';
    ELSE
        INSERT INTO UsernameChanges(change_date, customer_ID)
            VALUE (CURRENT_TIMESTAMP, OLD.ID);
    END if;
end;



# Test trigger
UPDATE Customer
SET
    name = 'Ali Daei'
WHERE
    ID = 1;