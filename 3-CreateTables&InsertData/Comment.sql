CREATE TABLE Comment(
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
    customer_ID INT,
    product_ID INT,
    score INT,
    created_at TIMESTAMP,
    content VARCHAR(300),
    FOREIGN KEY (customer_ID) REFERENCES customer(ID),
    FOREIGN KEY (product_ID) REFERENCES product(ID)
);