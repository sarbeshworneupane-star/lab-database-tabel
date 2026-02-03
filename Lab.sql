-- 1. Create database and switch to it
CREATE DATABASE dbemp;
USE dbemp;

-- 2. Create employee table
CREATE TABLE employee (
    EmployeeID VARCHAR(20) NOT NULL PRIMARY KEY,
    FirstName VARCHAR(20),
    LastName VARCHAR(20),
    Gender CHAR(1),
    DateofBirth DATE,
    Designation VARCHAR(50),
    DepartmentName VARCHAR(20),
    ManagerId VARCHAR(20),
    JoinedDate DATE,
    Salary DECIMAL(10,0)
);

-- 3. Insert employee records
INSERT INTO employee (
    EmployeeID,
    FirstName,
    LastName,
    Gender,
    DateofBirth,
    Designation,
    DepartmentName,
    ManagerId,
    JoinedDate,
    Salary
)
VALUES
(
    '0009',
    'Season',
    'Maharjan',
    'M',
    '1996-04-02',
    'Engineer',
    'Software Engineering',
    '0005',
    '2022-04-02',
    5000000
),
(
    '0010',
    'Ramesh',
    'Rai',
    'M',
    '2000-04-02',
    'Manager',
    'Software Engineering',
    '0003',
    '2022-04-02',
    1000000
);

-- 4. Update gender of an employee
UPDATE employee
SET Gender = 'M'
WHERE EmployeeID = '0009';

-- 5. Display all  records of employee above the age of 25
SELECT 
    FirstName,
    CURDATE() AS CurrentDate,
    DateofBirth,
    TIMESTAMPDIFF(YEAR, DateofBirth, CURDATE()) AS Age
FROM employee
WHERE TIMESTAMPDIFF(YEAR, DateofBirth, CURDATE()) > 25;

#6 Write a query to find the oldest employee.
select * from employee
where DateofBirth  = (select MIN(DateofBirth)
from employee);

#7 youngest employe
select * from employee where
DateofBirth = (select MAX (DateofBirth)
from employee);

# 8 Display the maximum salary department - wose.
select DepartmentName, Max(Salary) as MaxSalary
from employee Group by DepartmentName;

#9 List the employees who act as managers.
SELECT * from employee;
SELECT FirstName from employee
where EmployeeID in (Select ManagerID FROM employee);

#10 Display the details of the most recently joined employee
Select * from employee 
where JoinedDate = (select Max(JoinedDate) from employee);
