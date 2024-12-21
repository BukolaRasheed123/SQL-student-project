
------------------------------------- Task 4 Advanced SQL Concepts -------------------------------

--1 Joins:
-- Write queries using INNER JOIN, LEFT JOIN, and FULL JOIN to retrieve data across multiple tables. 
-- INNER JOIN
SELECT 
    o.order_id,
    c.name AS customer_name,
    p.product_name,
    oi.quantity,
    (oi.price * oi.quantity) AS total_price
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id
INNER JOIN Order_Items oi ON o.order_id = oi.order_id
INNER JOIN Products p ON oi.product_id = p.product_id
LIMIT 10;


-- LEFT JOIN
SELECT 
    c.customer_id,
    c.name AS customer_name,
    o.order_id,
    o.order_date,
    o.total_amount
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;

	
-- FULL JOIN
SELECT 
    p.product_id,
    p.product_name,
    p.stock_quantity,
    oi.order_id,
    oi.quantity,
    oi.price
FROM Products p
FULL JOIN Order_Items oi ON p.product_id = oi.product_id
LIMIT 10;


--Window Functions:
--Use RANK() to rank customers based on their total spending.
SELECT 
    c.name AS customer_name,
    SUM(o.total_amount) AS total_spending,
    RANK() OVER (ORDER BY SUM(o.total_amount) DESC) AS rank
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name;



--Use ROW_NUMBER() to assign a unique number to each order for a customer.

SELECT 
    o.customer_id,
    o.order_id,
    ROW_NUMBER() OVER (PARTITION BY o.customer_id ORDER BY o.order_date) AS order_number
FROM Orders o;


--CTEs and Subqueries:
--Use a Common Table Expression (CTE) to calculate the total revenue per customer, then find the customers with revenue greater than $500.
WITH CustomerRevenue AS (
    SELECT 
        c.customer_id,
        c.name AS customer_name,
        SUM(o.total_amount) AS total_revenue
    FROM Customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.name
)
SELECT *
FROM CustomerRevenue
WHERE total_revenue > 500;


--Write a subquery to find the product with the highest price.
SELECT product_id, product_name, price
FROM Products
WHERE price = (SELECT MAX(price) FROM Products);


--Indexing:
--Create indexes on frequently queried fields (e.g., customer_id, product_id) and demonstrate their impact on query performance.
	
-- Without Indexes: Run this query to count orders for a specific customer:
EXPLAIN ANALYZE SELECT COUNT(*) FROM Orders WHERE customer_id = 1;

--With Indexes: Create indexes on frequently queried fields (e.g., customer_id, product_id)
CREATE INDEX idx_customer_id ON Orders(customer_id); -- This is useful for queries filtering or joining on customer_id.
CREATE INDEX idx_product_id ON Order_Items(product_id); -- This is beneficial for queries filtering or joining on product_id in the Order_Items table.
CREATE INDEX idx_order_product ON Order_Items(order_id, product_id);-- A composite index can improve performance for queries involving both order_id and product_id.

-- With Indexing:
EXPLAIN ANALYZE
SELECT COUNT(*) FROM Orders WHERE customer_id = 1;


------------------------------------- Task 5 Optimization -------------------------------
--Analyze query performance using EXPLAIN or EXPLAIN ANALYZE.
EXPLAIN ANALYZE SELECT COUNT(*) FROM Order_Items WHERE quantity = 2;

-- Optimize slow queries by adjusting indexes, reordering joins, or rewriting the query.
CREATE INDEX idx_order_item_quantity ON Order_Items(quantity); -- Creating an index
EXPLAIN ANALYZE SELECT COUNT(*) FROM Order_Items WHERE quantity = 2; -- Examine performance after Indexing


