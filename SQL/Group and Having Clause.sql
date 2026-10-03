-- ============================================
-- SQL PRACTICAL ASSIGNMENT
-- LEVEL 4 - CRUD, AGGREGATION &
-- BUSINESS PERFORMANCE ANALYSIS
-- ============================================


-- TASK 1
SELECT
    COUNT(*) AS total_transactions,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(unit_price) AS average_unit_price,
    MAX(unit_price) AS highest_unit_price,
    MIN(unit_price) AS lowest_unit_price
FROM sales_transactions;


-- TASK 2
SELECT
    category,
    COUNT(*) AS number_of_transactions,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(unit_price) AS average_unit_price
FROM sales_transactions
GROUP BY category
ORDER BY total_sales_value DESC;


-- TASK 3
SELECT
    salesperson,
    COUNT(*) AS number_of_transactions,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(unit_price) AS average_unit_price
FROM sales_transactions
GROUP BY salesperson
ORDER BY total_sales_value DESC;


-- TASK 4
SELECT
    city,
    COUNT(*) AS number_of_transactions,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(unit_price) AS average_unit_price
FROM sales_transactions
GROUP BY city
ORDER BY total_sales_value DESC;


-- TASK 5
SELECT
    customer_type,
    COUNT(*) AS number_of_transactions,
    SUM(quantity) AS total_quantity_purchased,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(unit_price) AS average_unit_price
FROM sales_transactions
GROUP BY customer_type
ORDER BY total_sales_value DESC;


-- TASK 6
SELECT
    payment_mode,
    COUNT(*) AS number_of_transactions,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(unit_price) AS average_unit_price
FROM sales_transactions
GROUP BY payment_mode
ORDER BY total_sales_value DESC;


-- TASK 7
SELECT
    category,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(unit_price) AS average_unit_price
FROM sales_transactions
GROUP BY category
HAVING SUM(quantity * unit_price) > 300000;


-- TASK 8
SELECT
    salesperson,
    COUNT(*) AS number_of_transactions,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value
FROM sales_transactions
GROUP BY salesperson
HAVING SUM(quantity * unit_price) > 500000
ORDER BY total_sales_value DESC;


-- TASK 9
SELECT
    product_name,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(unit_price) AS average_unit_price
FROM sales_transactions
GROUP BY product_name
HAVING SUM(quantity) > 5
ORDER BY total_quantity_sold DESC;


-- TASK 10
SELECT
    category,
    COUNT(*) AS number_of_transactions,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(unit_price) AS average_unit_price
FROM sales_transactions
WHERE customer_type = 'Premium'
GROUP BY category
HAVING SUM(quantity * unit_price) > 200000;


-- TASK 11
SELECT
    salesperson,
    COUNT(*) AS number_of_transactions,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value
FROM sales_transactions
WHERE customer_type = 'VIP'
GROUP BY salesperson
HAVING SUM(quantity * unit_price) > 300000;


-- TASK 12
SELECT
    city,
    COUNT(*) AS number_of_transactions,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value
FROM sales_transactions
WHERE payment_mode IN ('Online', 'Card')
GROUP BY city
HAVING SUM(quantity * unit_price) > 300000;


-- TASK 13
SELECT
    discount,
    COUNT(*) AS number_of_transactions,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(unit_price) AS average_unit_price
FROM sales_transactions
GROUP BY discount
HAVING COUNT(*) >= 2;


-- TASK 14
SELECT
    salesperson,
    COUNT(*) AS number_of_transactions,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(unit_price) AS average_unit_price,
    MAX(unit_price) AS highest_unit_price
FROM sales_transactions
WHERE category = 'Electronics'
GROUP BY salesperson
HAVING SUM(quantity * unit_price) > 250000;


-- TASK 15
SELECT
    city,
    COUNT(*) AS number_of_transactions,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(unit_price) AS average_unit_price
FROM sales_transactions
WHERE category = 'Furniture'
  AND quantity > 2
GROUP BY city
HAVING SUM(quantity * unit_price) > 50000;


-- TASK 16
SELECT
    salesperson,
    COUNT(*) AS number_of_transactions,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(unit_price) AS average_unit_price
FROM sales_transactions
WHERE category = 'Appliances'
  AND payment_mode <> 'Cash'
  AND discount < 20
GROUP BY salesperson
HAVING SUM(quantity * unit_price) > 100000;


-- TASK 17
SELECT
    customer_type,
    COUNT(*) AS number_of_transactions,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(unit_price) AS average_unit_price,
    MAX(unit_price) AS maximum_unit_price
FROM sales_transactions
WHERE customer_type IN ('Premium', 'VIP')
GROUP BY customer_type
ORDER BY total_sales_value DESC;


-- TASK 18
SELECT
    salesperson,
    COUNT(*) AS number_of_transactions,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(discount) AS average_discount_percentage
FROM sales_transactions
WHERE discount > 15
GROUP BY salesperson
HAVING COUNT(*) >= 2;


-- TASK 19
-- INSERT

INSERT INTO sales_transactions
(
    transaction_id,
    customer_name,
    product_name,
    category,
    quantity,
    unit_price,
    discount,
    city,
    payment_mode,
    salesperson,
    customer_type
)
VALUES
(
    1031,
    'Raj Mehta',
    'MacBook Pro',
    'Electronics',
    2,
    125000,
    10,
    'Mumbai',
    'Online',
    'Rahul',
    'Premium'
);


-- VERIFY INSERT

SELECT *
FROM sales_transactions
WHERE transaction_id = 1031;


-- TASK 20

SELECT
    salesperson,
    category,
    COUNT(*) AS number_of_transactions,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(unit_price) AS average_unit_price,
    MIN(unit_price) AS minimum_unit_price,
    MAX(unit_price) AS maximum_unit_price,
    AVG(discount) AS average_discount_percentage
FROM sales_transactions
WHERE customer_type IN ('Premium', 'VIP')
  AND payment_mode <> 'Cash'
  AND quantity > 1
  AND discount < 20
GROUP BY
    salesperson,
    category
HAVING SUM(quantity * unit_price) > 200000
ORDER BY total_sales_value DESC;


-- ============================================
-- ADDITIONAL CRUD CHALLENGE
-- ============================================


-- CREATE

INSERT INTO sales_transactions
(
    transaction_id,
    customer_name,
    product_name,
    category,
    quantity,
    unit_price,
    discount,
    city,
    payment_mode,
    salesperson,
    customer_type
)
VALUES
(
    1031,
    'Raj Mehta',
    'MacBook Pro',
    'Electronics',
    2,
    125000,
    10,
    'Mumbai',
    'Online',
    'Rahul',
    'Premium'
);


-- READ

SELECT *
FROM sales_transactions
WHERE transaction_id = 1031;


-- UPDATE

UPDATE sales_transactions
SET discount = 12
WHERE transaction_id = 1031;


-- VERIFY UPDATE

SELECT
    transaction_id,
    customer_name,
    product_name,
    discount
FROM sales_transactions
WHERE transaction_id = 1031;


-- DELETE

DELETE FROM sales_transactions
WHERE transaction_id = 1031;


-- VERIFY DELETE

SELECT *
FROM sales_transactions
WHERE transaction_id = 1031;
