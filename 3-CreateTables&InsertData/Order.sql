CREATE TABLE `Order`(
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
    total_price VARCHAR(15) NOT NULL ,
    customer_ID INT ,
    FOREIGN KEY (customer_ID) REFERENCES Customer(ID)
);