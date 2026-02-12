-- 1. Create a fresh database (Schema)
CREATE DATABASE IF NOT EXISTS SpringfieldCorp;
USE SpringfieldCorp;

-- 2. Create the Departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

-- 3. Create the Employees table
CREATE TABLE employees (
    id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department_id INT,
    -- This connects the two tables
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- 4. Insert Department data
INSERT INTO departments (department_id, department_name) VALUES
(1, 'Sales'),
(2, 'Engineering'),
(3, 'Human Resources'),
(4, 'Customer Service'),
(5, 'Research And Development');

-- 5. Insert Employee data
INSERT INTO employees (id, employee_name, department_id) VALUES
(1, 'Homer Simpson', 4),
(2, 'Ned Flanders', 1),
(3, 'Barney Gumble', 5),
(4, 'Clancy Wiggum', 3),
(5, 'Moe Syzslak', NULL);

-- 6. View the final result (The Join)
SELECT 
    e.id, 
    e.employee_name, 
    d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;