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
	
-- Query 7 To To conduct Double checks on Electronic Cateogry Products By Setting minimum bounds on product ratings
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
