CREATE TABLE OrderContent(
    order_ID INT NOT NULL,
    product_ID INT NOT NULL,
    number INT NOT NULL ,
    price VARCHAR(15) NOT NULL,
    PRIMARY KEY (order_ID, product_ID),
    FOREIGN KEY (order_ID) REFERENCES `Order`(ID),
    FOREIGN KEY (product_ID) REFERENCES Product(ID)
);