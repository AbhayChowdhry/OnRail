USE online_retail_store;

-- Query 1 using Inner Join
SELECT 
	oi.order_id,
    oi.customer_id,
    oi.product_id,
    oi.partner_id,
    op.order_value,
    op.status
FROM 
	Order_Items oi
JOIN 
	Order_Payment op ON oi.order_id = op.order_id;

-- Query 2 showing Foreign Key Constraint by using Joins
USE online_retail_store;

SELECT 
	c.customer_id,
    c.customer_name AS "Customer Name",
    c.address AS "Customer Address",
    ca.product_id,
    p.product_name AS "Product Name",
    p.product_price AS "Product Price",
    ca.product_quantity AS "Quantity Added",
    (p.product_price * ca.product_quantity) AS "Price Total"
    
FROM 
	customers c
LEFT JOIN 
	cart ca ON c.customer_id = ca.customer_id
LEFT JOIN 
	product p ON p.product_id = ca.product_id
ORDER BY c.customer_id;

-- Query 3 using Ordering and limit to rate delivery partners
USE online_retail_store;

SELECT 
	dp.partner_id,
    dp.partner_name,
    dp.partner_rating,
    dp.partner_salary,
    (dp.partner_salary / 100) * 10 AS "Bonus",
    dp.partner_salary + ((dp.partner_salary / 100) * 10) AS "Total Compensation"
FROM 
	delivery_partner dp
WHERE 
	dp.partner_rating >= 7 AND dp.orders_completed >= 15
-- ORDER BY dp.partner_rating DESC
ORDER BY 
	dp.partner_id
LIMIT 10;

-- Query 4 for Sellers with Low Product Rating to Reduce their commission by 5%
USE online_retail_store;

SELECT 
	s.seller_id,
    s.seller_name,
    p.product_id,
    p.product_name,
    p.product_price,
    p.product_rating,
    s.seller_commission,
    (19 * s.seller_commission / 20) AS "New commission"
FROM Seller s
RIGHT JOIN 
	Product p ON s.seller_id = p.seller_id
WHERE 
	p.product_rating < 2.5
ORDER BY 
	s.seller_id;

-- Query 5 Relating Products with their respective Categories to Calculate Discounted Values
USE online_retail_store;

SELECT 
    p.product_name AS "Product Name",
    p.product_price AS "Product Original Price",
    c.category_name As "Category Name", 
    c.category_discount AS "Category Discount",
    (p.product_price - c.category_discount*p.product_price/100) AS "Price After Category Discount"
    
FROM product p
JOIN 
	category c ON p.category_id = c.category_id
ORDER BY p.product_id;

-- Query 6 To find out Product Preference of Customers living in Indivial Rooms 
USE online_retail_store;

SELECT 
    c.customer_name AS "Customer Name",
    c.address AS "Customer Address",
    ca.product_id,
    p.product_name AS "Product Name"
    
FROM 
	customers c
LEFT JOIN 
	cart ca ON c.customer_id = ca.customer_id
LEFT JOIN 
	product p ON p.product_id = ca.product_id
WHERE 
	c.address LIKE '%Room%' AND ca.product_id IS NOT NULL
ORDER BY 
	c.customer_id;
	
-- Query 7: To conduct Double checks on Electronic Cateogry Products By Setting minimum bounds on product ratings
USE online_retail_store;

SELECT 
    p.product_name,
    p.product_price,
    p.product_rating,
    c.category_name
    
FROM 
	product p
JOIN 
	category c ON p.category_id = c.category_id
WHERE 
	p.product_rating > 7 AND c.category_name = "Electronics and Gadgets" 
ORDER BY 
	p.product_rating;

-- Query 8: To check constraints on the tables Cart and Delivery Partner
USE online_retail_store;

SELECT 
	CONSTRAINT_NAME, 
	CONSTRAINT_TYPE
FROM
	INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Cart' OR TABLE_NAME = 'Delivery_Partner';

-- Query 9: To get the total number of products ordered by a Customer
USE online_retail_store;

SELECT 
	oi.customer_id,
    c.customer_name,
    count(*) AS "Quantity Ordered" 
FROM order_items oi
LEFT JOIN 
	product p ON p.product_id = oi.product_id
LEFT JOIN
	customers c ON oi.customer_id = c.customer_id
GROUP BY 
	oi.customer_id;

-- Query 10: Update Order Value in the Order Payments Table
USE online_retail_store;

UPDATE order_payment op
INNER JOIN(
SELECT 
	oi.order_id,
    oi.customer_id AS "Customer ID",
    round(sum(p.product_price * oi.quantity_added), 2) AS Order_Value
FROM order_items oi, product p
WHERE oi.product_id = p.product_id
GROUP BY order_id, customer_id) AS o1
ON op.order_id = o1.order_id
SET op.order_value = o1.Order_Value;

SELECT *
FROM order_payment op;

-- Query 11: As per recent enhanced quality checks, Query 11 hikes the price of the best performing electronics by 20%
USE online_retail_store;

UPDATE product
SET product_price = (product_price)*6/5
WHERE product_rating > 8 AND category_id = 1;

-- Query 12: As a token of appreciation, OnRail increases the Salary of best rating Partners by 6.5%, inflation doesnt seem so bad now ;)
USE online_retail_store;

UPDATE delivery_partner
SET partner_salary = (partner_salary)*106.5/100
WHERE partner_rating > 8;

-- Query 13: Because of Exceptionally high demands of product_id = 43, 56 and 98, they just went out of stock! :(
USE online_retail_store;

UPDATE inventory
SET quantity_in_stock = 1
WHERE product_id IN (43, 56, 98);

-- Query 14: To show Customers who have an empty cart
USE online_retail_store;

SELECT 
	c.customer_id,
    c.customer_name,
    c.phone_no,
    0 AS 'Quantity in Cart'
FROM 
	customers c
LEFT JOIN
	cart ca ON c.customer_id = ca.customer_id
WHERE
	ca.product_quantity IS NULL
GROUP BY
	c.customer_id;

-- Query 15: Show number of products in different categories
USE online_retail_store;

SELECT 
	c.category_id,
    c.category_name,
    count(*) AS 'Number of Products' 
FROM 
	category c
LEFT JOIN 
	product p ON p.category_id = c.category_id
GROUP BY
	c.category_id;
	
-- Query 16: Printing orders which are not paid or which are paid and not delivered
USE online_retail_store;

SELECT *
FROM order_payment op
WHERE op.status = 1 OR op.status = 0
ORDER BY op.order_id;

-- Query 17: Join with 'USING' clause
USE online_retail_store;

SELECT 
	oi.order_id,
    oi.customer_id,
    oi.product_id,
    c.product_quantity,
    oi.partner_id
FROM order_items oi
JOIN cart c
USING (customer_id)
ORDER BY oi.order_id
