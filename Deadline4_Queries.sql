USE online_retail_store;

-- Query 1 using Inner Join
SELECT 
	oi.order_id,
    oi.customer_id,
    oi.product_id,
    oi.partner_id,
    op.order_value,
    op.status
FROM Order_Items oi
JOIN Order_Payment op ON oi.order_id = op.order_id;

-- Query 2 showing Foreign Key Constraint by using Joins
SELECT 
	c.customer_id,
    c.customer_name AS "Customer Name",
    c.address AS "Customer Address",
    ca.product_id,
    p.product_name AS "Product Name",
    p.product_price AS "Product Price",
    ca.product_quantity AS "Quantity Added",
    (p.product_price * ca.product_quantity) AS "Price Total"
    
FROM customers c
LEFT JOIN 
	cart ca ON c.customer_id = ca.customer_id
LEFT JOIN 
	product p ON p.product_id = ca.product_id
ORDER BY c.customer_id

