CREATE DATABASE dbemp;
USE dbemp;

CREATE TABLE employee (
    EmployeeId VARCHAR(20) PRIMARY KEY,
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
