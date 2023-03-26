-- Trigger 1: Empty Cart after Order is Placed
USE online_retail_store;

DELIMITER $$
CREATE TRIGGER empty_cart 
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
    DELETE from Cart where customer_id = NEW.customer_id;
END$$
DELIMITER ;

-- Trigger 2: Set Product Rating to 1 if it is less than 1
USE online_retail_store;

DELIMITER $$
CREATE TRIGGER `update_rating` BEFORE INSERT ON `Product`
FOR EACH ROW
BEGIN
    IF NEW.product_rating <= 0 THEN
        SET NEW.product_rating = 1;
    END IF;
END$$
DELIMITER ;

-- Trigger 3: Reduce Inventory Quantity by the Quantity Added
USE online_retail_store;

DELIMITER $$
CREATE TRIGGER `reduct_inventory` 
AFTER INSERT ON `Order_Items`
FOR EACH ROW
BEGIN
    UPDATE `Inventory` SET `quantity_in_stock` = `quantity_in_stock` - NEW.quantity_added
    WHERE `product_id` = NEW.product_id;
END$$
DELIMITER ;
