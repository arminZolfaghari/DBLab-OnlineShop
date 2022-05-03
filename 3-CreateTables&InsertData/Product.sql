CREATE TABLE Product(
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
    name VARCHAR(60) NOT NULL ,
    number INT NOT NULL ,
    price VARCHAR(15) NOT NULL ,
    score INT DEFAULT 0,
    detail VARCHAR(300),
    shop_id INT,
    FOREIGN KEY (shop_id) REFERENCES Shop(ID)
);