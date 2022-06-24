USE onlineshopdigikala;

CREATE TRIGGER BeforeDeleteOrderContent
    BEFORE DELETE
    ON OrderContent
    FOR EACH ROW
BEGIN
    DELETE FROM `order` as O
        WHERE O.ID = OLD.order_ID;
    DELETE FROM Product as P
    WHERE P.ID = OLD.product_ID;
end;


CREATE TRIGGER BeforeDeleteDeliveryOfficer
    BEFORE DELETE
    ON DeliveryOfficer
    FOR EACH ROW
BEGIN
    DELETE FROM Payment as P
        WHERE P.delivery_officer_ID = OLD.ID;
end;


CREATE TRIGGER BeforeDeleteCustomer
    BEFORE DELETE
    ON Customer
    FOR EACH ROW
BEGIN
    DELETE FROM Payment as P
        WHERE P.customer_ID = OLD.ID;
    DELETE FROM `Order` as O
        WHERE O.customer_ID = OLD.ID;
    DELETE FROM Comment as C
        WHERE C.customer_ID = OLD.ID;
end;



CREATE TRIGGER BeforeDeleteShop
    BEFORE DELETE
    ON Shop
    FOR EACH ROW
BEGIN
    DELETE FROM Product as P
        WHERE P.shop_id = OLD.ID;
end;


CREATE TRIGGER BeforeDeleteProduct
    BEFORE DELETE
    ON Product
    FOR EACH ROW
BEGIN
    DELETE FROM OrderContent as OC
        WHERE OC.product_ID = OLD.ID;
    DELETE FROM Comment as C
        WHERE C.product_ID = OLD.ID;
end;


CREATE TRIGGER BeforeDeleteOrder
    BEFORE DELETE
    ON `Order`
    FOR EACH ROW
BEGIN
    DELETE FROM OrderContent as OC
        WHERE OC.order_ID = OLD.ID;
    DELETE FROM Payment as P
        WHERE P.order_ID = OLD.ID;
end;