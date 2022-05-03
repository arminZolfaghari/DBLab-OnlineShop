CREATE TABLE DeliveryOfficer(
     ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
     name VARCHAR(100) NOT NULL ,
     phone_number VARCHAR(11) NOT NULL ,
     number_of_assigned_order INT,
     is_deleted BOOLEAN DEFAULT 0
);