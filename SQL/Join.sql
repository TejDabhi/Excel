-- ============================================
-- SQL JOIN PRACTICAL QUESTIONS - 20 TASKS
-- ============================================


-- TASK 1
-- Customer Order Details

SELECT
    c.CustomerID,
    c.CustomerName,
    c.City,
    o.OrderID,
    o.ProductName,
    o.Amount
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID;


-- TASK 2
-- Customers With Orders

SELECT
    c.CustomerName,
    c.City,
    o.ProductName,
    o.Amount
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID;


-- TASK 3
-- All Customers

SELECT
    c.CustomerID,
    c.CustomerName,
    o.OrderID,
    o.ProductName,
    o.Amount
FROM Customers c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID;


-- TASK 4
-- Customers Without Orders

SELECT
    c.CustomerID,
    c.CustomerName,
    c.City
FROM Customers c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;


-- TASK 5
-- All Orders

SELECT
    o.OrderID,
    o.CustomerID,
    c.CustomerName,
    o.ProductName,
    o.Amount
FROM Customers c
RIGHT JOIN Orders o
    ON c.CustomerID = o.CustomerID;


-- TASK 6
-- Orders Without Customers

SELECT
    o.OrderID,
    o.CustomerID,
    o.ProductName,
    o.Amount
FROM Customers c
RIGHT JOIN Orders o
    ON c.CustomerID = o.CustomerID
WHERE c.CustomerID IS NULL;


-- TASK 7
-- Full Customer and Order Analysis

SELECT
    c.CustomerID,
    c.CustomerName,
    o.OrderID,
    o.ProductName,
    o.Amount
FROM Customers c
FULL OUTER JOIN Orders o
    ON c.CustomerID = o.CustomerID;


-- TASK 8
-- Orders Above ₹10,000

SELECT
    c.CustomerName,
    o.OrderID,
    o.ProductName,
    o.Amount
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
WHERE o.Amount > 10000;


-- TASK 9
-- Customers From Delhi

SELECT
    c.CustomerName,
    c.City,
    o.OrderID,
    o.ProductName,
    o.Amount
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
WHERE c.City = 'Delhi';


-- TASK 10
-- Orders With Quantity Greater Than 2

SELECT
    c.CustomerName,
    o.ProductName,
    o.Quantity,
    o.Amount
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
WHERE o.Quantity > 2
ORDER BY o.Quantity DESC;


-- TASK 11
-- Total Amount Spent by Each Customer

SELECT
    c.CustomerID,
    c.CustomerName,
    COALESCE(SUM(o.Amount), 0) AS TotalAmount
FROM Customers c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID,
    c.CustomerName;


-- TASK 12
-- Number of Orders Per Customer

SELECT
    c.CustomerID,
    c.CustomerName,
    COUNT(o.OrderID) AS TotalOrders
FROM Customers c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID,
    c.CustomerName;


-- TASK 13
-- Average Order Amount

SELECT
    c.CustomerName,
    AVG(o.Amount) AS AverageOrderAmount
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID,
    c.CustomerName;


-- TASK 14
-- Highest Order Amount

SELECT
    c.CustomerName,
    o.OrderID,
    o.ProductName,
    o.Amount
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
WHERE o.Amount = (
    SELECT MAX(Amount)
    FROM Orders
);


-- TASK 15
-- Lowest Order Amount

SELECT
    c.CustomerName,
    o.OrderID,
    o.ProductName,
    o.Amount
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
WHERE o.Amount = (
    SELECT MIN(Amount)
    FROM Orders
);


-- TASK 16
-- Customer Order Summary

SELECT
    c.CustomerID,
    c.CustomerName,
    COUNT(o.OrderID) AS NumberOfOrders,
    COALESCE(SUM(o.Quantity), 0) AS TotalQuantity,
    COALESCE(SUM(o.Amount), 0) AS TotalAmount
FROM Customers c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID,
    c.CustomerName;


-- TASK 17
-- Customers With Total Spending Greater Than ₹20,000

SELECT
    c.CustomerID,
    c.CustomerName,
    SUM(o.Amount) AS TotalAmount
FROM Customers c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID,
    c.CustomerName
HAVING SUM(o.Amount) > 20000;


-- TASK 18
-- Customers With More Than One Order

SELECT
    c.CustomerID,
    c.CustomerName,
    COUNT(o.OrderID) AS NumberOfOrders
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID,
    c.CustomerName
HAVING COUNT(o.OrderID) > 1;


-- TASK 19
-- Compare Matching and Unmatched Records

SELECT
    c.CustomerID,
    c.CustomerName,
    c.City,
    o.OrderID,
    o.CustomerID AS OrderCustomerID,
    o.ProductName,
    o.Amount,
    CASE
        WHEN c.CustomerID IS NOT NULL
             AND o.OrderID IS NOT NULL
            THEN 'Customer Has Order'

        WHEN c.CustomerID IS NOT NULL
             AND o.OrderID IS NULL
            THEN 'Customer Without Order'

        WHEN c.CustomerID IS NULL
             AND o.OrderID IS NOT NULL
            THEN 'Order Without Customer'
    END AS RecordStatus
FROM Customers c
FULL OUTER JOIN Orders o
    ON c.CustomerID = o.CustomerID;


-- TASK 20
-- Business Order Report

SELECT
    c.CustomerID,
    c.CustomerName,
    c.City,
    o.OrderID,
    o.ProductName,
    o.Quantity,
    o.Amount,
    o.Quantity * o.Amount AS TotalValue
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID;
