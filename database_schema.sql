DROP DATABASE IF EXISTS `Online_Retail_Store`;
CREATE DATABASE `Online_Retail_Store`; 
USE `Online_Retail_Store`;

SET NAMES utf8 ;
SET character_set_client = utf8mb4 ;

DROP TABLE IF EXISTS `Customer`;
DROP TABLE IF EXISTS `Admin`;
DROP TABLE IF EXISTS `Order_Payment`;
DROP TABLE IF EXISTS `Order_Items`;
DROP TABLE IF EXISTS `Cart`;
DROP TABLE IF EXISTS `Category`;
DROP TABLE IF EXISTS `Inventory`;
DROP TABLE IF EXISTS `Delivery_Partner`;
DROP TABLE IF EXISTS `Seller`;
DROP TABLE IF EXISTS `Product`;

CREATE TABLE `Customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(50) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  `address` varchar(60) NOT NULL,
  `email-id` varchar(60) NOT NULL,
  `customer_password` varchar(20) NOT NULL,
  
  PRIMARY KEY (customer_id)
);

CREATE TABLE `Admin` (
  `admin_id` INT NOT NULL,
  `admin_password` varchar(20) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  
  PRIMARY KEY (admin_id)
);

CREATE TABLE `Category` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  `category_discount` decimal(9,2) NOT NULL DEFAULT '0.00',
  
  CONSTRAINT discount_val CHECK (category_discount >= 0),
  PRIMARY KEY (category_id)
);

CREATE TABLE `Seller` (
  `seller_id` INT NOT NULL AUTO_INCREMENT,
  `seller_name` varchar(50) NOT NULL,
  `seller_contact_no` INT,
  `seller_commission` decimal(9,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (seller_id)
);

CREATE TABLE `Product` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) NOT NULL,
  `product_price` decimal(9,2) NOT NULL,
  `product_description` varchar(100) NOT NULL,
  `seller_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  `product_rating` smallint(6) DEFAULT '0',
  
  FOREIGN KEY (category_id) REFERENCES category(category_id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (seller_id) REFERENCES seller(seller_id) ON UPDATE CASCADE ON DELETE CASCADE,
  PRIMARY KEY (product_id)
);

CREATE TABLE `Delivery_Partner` (
  `partner_id` INT NOT NULL AUTO_INCREMENT,
  `partner_name` varchar(50) NOT NULL,
  `partner_contact_no` INT NOT NULL,
  `orders_completed` INT NOT NULL,
  `partner_rating` INT DEFAULT 0,
  `partner_salary` INT DEFAULT 0,
  
  CONSTRAINT salary CHECK (partner_salary > 0),
  CONSTRAINT rating CHECK (partner_rating > 1),
  PRIMARY KEY (partner_id)
);

CREATE TABLE `Order_Items` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity_added` INT NOT NULL,
  `partner_id` INT NOT NULL,
  `order_date` date NOT NULL,
  `status` boolean NOT NULL,

   FOREIGN KEY (partner_id) REFERENCES delivery_partner(partner_id) ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY (product_id) REFERENCES product(product_id) ON UPDATE CASCADE ON DELETE CASCADE,
   PRIMARY KEY (order_id, customer_id, product_id),
   CONSTRAINT quant_check_order CHECK (quantity_added > 0)
);

CREATE TABLE `Order_Payment` (
  `order_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `payment_mode` enum('Cash', 'Credit Card', 'UPI/Wallet', 'Netbanking') NOT NULL,
  `shipping_address` varchar(60) NOT NULL,
  `order_value` decimal(9,2) NOT NULL DEFAULT '0.00',
  `order_date` date NOT NULL,
  
  CONSTRAINT order_value CHECK (order_value > 0),
  FOREIGN KEY (order_id) REFERENCES order_items(order_id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON UPDATE CASCADE ON DELETE CASCADE,
  PRIMARY KEY (order_id, customer_id)
);

CREATE TABLE `Cart` (
  `customer_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `product_quantity` INT NOT NULL,
  `product_price` decimal(9,2) NOT NULL,
  `product_description` varchar(100) NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (product_id) REFERENCES product(product_id) ON UPDATE CASCADE ON DELETE CASCADE,
  PRIMARY KEY (product_id, customer_id),
  CONSTRAINT quant_check_cart CHECK (product_quantity > 0)
);


CREATE TABLE `Inventory` (
  `product_id` INT NOT NULL,
  `quantity_in_stock` INT NOT NULL,
  FOREIGN KEY (product_id) REFERENCES product(product_id) ON UPDATE CASCADE ON DELETE CASCADE,
  PRIMARY KEY (product_id),
  CONSTRAINT quant_check_inventory CHECK (quantity_in_stock > 0)
);

