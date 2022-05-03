CREATE TABLE Shop(
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
    name VARCHAR(100) NOT NULL ,
    address VARCHAR(300) NOT NULL ,
    supervisor_name VARCHAR(100) NOT NULL ,
    created_at TIMESTAMP,
    phone_number VARCHAR(11) NOT NULL,
    independent BOOLEAN,
    is_deleted BOOLEAN DEFAULT 0
);