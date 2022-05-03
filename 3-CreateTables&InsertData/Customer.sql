CREATE TABLE Customer(
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
    name VARCHAR(100) NOT NULL ,
    phone_number VARCHAR(11) NOT NULL ,
    address VARCHAR(300) NOT NULL ,
    created_at TIMESTAMP,
    is_deleted BOOLEAN DEFAULT 0
);

