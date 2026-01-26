CREATE DATABASE dbemp;
USE dbemp;

CREATE TABLE employee (
    EmployeeId VARCHAR(20) NOT NULL PRIMARY KEY,
    FirstName VARCHAR(20),
    LastName varchar(20),
    Gender char(1),
    DateofBirth DATE,
    Designation varchar(50),
    DepartmentName varchar(20),
    ManagerId varchar(20),
    JoinedDate DATE,
    Salary decimal(10,0)
);
