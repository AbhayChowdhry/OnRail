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
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(50) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  `address` varchar(60) NOT NULL,
  `customer_password` varchar(20) NOT NULL,
  PRIMARY KEY (customer_id)
);

CREATE TABLE `Admin` (
  `admin_id` int(11) NOT NULL,
  `admin_password` varchar(20) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  PRIMARY KEY (admin_id)
);

CREATE TABLE `Order_Payment` (
  `order_id` int(11) NOT NULL,
  `payment_mode` varchar(10) NOT NULL,
  `shipping_address` varchar(60) NOT NULL,
  `order_value` decimal(9,2) NOT NULL DEFAULT '0.00',
  `order_date` date NOT NULL,
  PRIMARY KEY (order_id)
);

CREATE TABLE `Order_Items` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `status` boolean NOT NULL,
   PRIMARY KEY (order_id)
);

CREATE TABLE `Cart` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_price` decimal(9,2) NOT NULL,
  `product_description` varchar(100) NOT NULL,
  PRIMARY KEY (product_id, customer_id)
);

CREATE TABLE `Category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  `category_discount` decimal(9,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (category_id)
);

CREATE TABLE `Inventory` (
  `product_id` int(11) NOT NULL,
  `quantity_in_stock` int(11) NOT NULL,
  PRIMARY KEY (product_id)
);

CREATE TABLE `Delivery_Partner` (
  `partner_id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_name` varchar(50) NOT NULL,
  `partner_contact_no` int(11),
  `orders_completed` int(11) NOT NULL,
  `partner_rating` int(11) NOT NULL,
  `partner_salary` int(11) DEFAULT '0',
  PRIMARY KEY (partner_id)
);

CREATE TABLE `Seller` (
  `seller_id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_name` varchar(50) NOT NULL,
  `seller_contact_no` int(11),
  `seller_commission` decimal(9,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (seller_id)
);

CREATE TABLE `Product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) NOT NULL,
  `product_price` decimal(9,2) NOT NULL,
  `product_description` varchar(100) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_rating` smallint(6) DEFAULT '0',
  PRIMARY KEY (product_id)
);
