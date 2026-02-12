-- =====================================================
-- ALL-IN-ONE SQL PRACTICE SCRIPT FOR MySQL WORKBENCH
-- =====================================================

-- Step 0: Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS sql_practice;

-- Step 1: Use the database
USE sql_practice;

-- Step 2: Drop old tables if they exist (safe to re-run)
DROP TABLE IF EXISTS Payments;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;

-- =====================================================
-- Step 3: CREATE TABLES
-- =====================================================

-- Customers table: stores user information
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    country VARCHAR(50)
);

-- Orders table: stores what each customer bought
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product VARCHAR(50),
    amount INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Payments table: how the order was paid
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    method VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- =====================================================
-- Step 4: INSERT SAMPLE DATA
-- =====================================================

INSERT INTO Customers (first_name, last_name, age, country) VALUES
('John','Doe',31,'USA'),
('Robert','Luna',22,'UK'),
('David','Robinson',22,'Nepal'),
('John','Reinhardt',25,'India'),
('Betty','Doe',28,'Nepal');

INSERT INTO Orders (customer_id, product, amount) VALUES
(1,'Laptop',80000),
(2,'Phone',30000),
(1,'Headphone',5000),
(3,'Keyboard',4000);

INSERT INTO Payments (order_id, method) VALUES
(1,'Esewa'),
(2,'Cash'),
(4,'Khalti');

-- =====================================================
-- Step 5: BASIC SELECT
-- =====================================================

SELECT * FROM Customers;
SELECT first_name, country FROM Customers;

-- =====================================================
-- Step 6: WHERE CONDITIONS
-- =====================================================

SELECT * FROM Customers WHERE country='Nepal';
SELECT * FROM Customers WHERE age > 25;

-- =====================================================
-- Step 7: ORDER BY
-- =====================================================

SELECT * FROM Orders ORDER BY amount DESC;

-- =====================================================
-- Step 8: INNER JOIN
-- Customers who placed orders
-- =====================================================
SELECT C.first_name, O.product, O.amount
FROM Customers C
INNER JOIN Orders O
ON C.customer_id = O.customer_id;

-- =====================================================
-- Step 9: LEFT JOIN
-- All customers, even if they didn't place an order
-- =====================================================
SELECT C.first_name, O.product
FROM Customers C
LEFT JOIN Orders O
ON C.customer_id = O.customer_id;

-- =====================================================
-- Step 10: RIGHT JOIN
-- All orders, even if customer missing
-- =====================================================
SELECT C.first_name, O.product
FROM Orders O
RIGHT JOIN Customers C
ON C.customer_id = O.customer_id;

-- =====================================================
-- Step 11: 3-TABLE JOIN
-- Customers + Orders + Payments
-- =====================================================
SELECT C.first_name, O.product, P.method
FROM Customers C
INNER JOIN Orders O
ON C.customer_id = O.customer_id
INNER JOIN Payments P
ON O.order_id = P.order_id;

-- =====================================================
-- Step 12: AGGREGATE FUNCTIONS
-- =====================================================
SELECT COUNT(*) AS total_customers FROM Customers;
SELECT SUM(amount) AS total_sales FROM Orders;
SELECT AVG(amount) AS average_order_value FROM Orders;

-- =====================================================
-- Step 13: GROUP BY
-- Total spent by each customer
-- =====================================================
SELECT customer_id, SUM(amount) AS total_spent
FROM Orders
GROUP BY customer_id;

-- =====================================================
-- Step 14: HAVING
-- Customers who spent more than 10,000
-- =====================================================
SELECT customer_id, SUM(amount) AS total_spent
FROM Orders
GROUP BY customer_id
HAVING total_spent > 10000;
