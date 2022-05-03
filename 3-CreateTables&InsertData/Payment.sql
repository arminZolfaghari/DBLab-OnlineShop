CREATE TABLE Payment(
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
    order_ID INT,
    customer_ID INT,
    delivery_officer_ID INT,
    amount VARCHAR(15),
    FOREIGN KEY (order_ID) REFERENCES `order`(ID),
    FOREIGN KEY (customer_ID) REFERENCES customer(ID),
    FOREIGN KEY (delivery_officer_ID) REFERENCES deliveryofficer(ID)
);