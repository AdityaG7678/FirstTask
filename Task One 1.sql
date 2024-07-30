CREATE DATABASE Emp;
use Emp;
CREATE TABLE Employees1 (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Salary INT NOT NULL,
    Department VARCHAR(50)
);
INSERT INTO Employees1 (EmployeeID, FirstName, LastName, Email, Salary, Department) VALUES
(1, 'John', 'Doe', 'john.doe@company.com', 60000, 'Marketing'),
(2, 'Jane', 'Smith', 'jane.smith@company.com', 75000, 'Sales'),
(3, 'Michael', 'Johnson', 'michael.johnson@company.com', 85000, 'Marketing'),
(4, 'Emily', 'Williams', 'emily.williams@company.com', 72000, 'IT'),
(5, 'David', 'Brown', 'david.brown@company.com', 65000, 'Sales'),
(6, 'Sarah', 'Davis', 'sarah.davis@company.com', 90000, 'IT'),
(7, 'Robert', 'Miller', 'robert.miller@company.com', 70000, 'Finance'),
(8, 'Jessica', 'Wilson', 'jessica.wilson@company.com', 65000, 'Finance'),
(9, 'Daniel', 'Anderson', 'daniel.anderson@company.com', 72000, 'IT'),
(10, 'Ashley', 'Taylor', 'ashley.taylor@company.com', 58000, 'Sales'),
(11, 'William', 'Brown', 'william.brown@company.com', 78000, 'Marketing'),
(12, 'Sophia', 'Davis', 'sophia.davis@company.com', 62000, 'HR');

select * From Employees1;

CREATE TABLE Employees1 (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Salary INT NOT NULL CHECK (Salary > 0),
    Department VARCHAR(50)
);

/*Create a foreign key constraint in the Employees table to reference the DepartmentID in the Departments table.*/
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);

CREATE TABLE Employees2 (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Salary INT NOT NULL CHECK (Salary > 0),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Marketing'),
(2, 'Sales'),
(3, 'IT'),
(4, 'Finance'),
(5, 'HR');

INSERT INTO Employees2 (EmployeeID, FirstName, LastName, Email, Salary, DepartmentID) VALUES
(1, 'John', 'Doe', 'john.doe@company.com', 60000, 1),
(2, 'Jane', 'Smith', 'jane.smith@company.com', 75000, 2),
(3, 'Michael', 'Johnson', 'michael.johnson@company.com', 85000, 1),
(4, 'Emily', 'Williams', 'emily.williams@company.com', 72000, 3),
(5, 'David', 'Brown', 'david.brown@company.com', 65000, 2),
(6, 'Sarah', 'Davis', 'sarah.davis@company.com', 90000, 3),
(7, 'Robert', 'Miller', 'robert.miller@company.com', 70000, 4),
(8, 'Jessica', 'Wilson', 'jessica.wilson@company.com', 65000, 4),
(9, 'Daniel', 'Anderson', 'daniel.anderson@company.com', 72000, 3),
(10, 'Ashley', 'Taylor', 'ashley.taylor@company.com', 58000, 2),
(11, 'William', 'Brown', 'william.brown@company.com', 78000, 1),
(12, 'Sophia', 'Davis', 'sophia.davis@company.com', 62000, 5);

select * From  Employees2 ;

/*Create a unique constraint on the Email column in the Employees table*/

CREATE TABLE Employees1 (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Salary INT NOT NULL CHECK (Salary > 0),
    Department VARCHAR(50)
);

/*Create a foreign key constraint in the Projects table to reference the DepartmentID in the Departments table.*/
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
INSERT INTO Projects (ProjectID, ProjectName, DepartmentID) VALUES
(1, 'Website Redesign', 1),
(2, 'Sales Strategy', 2),
(3, 'IT Infrastructure Upgrade', 3),
(4, 'Financial Audit', 4),
(5, 'Employee Training Program', 5);

select * From projects;


/*Insert a new employee with a DepartmentID that does not exist in the Departments table and observe the foreign key constraint violation.*/
INSERT INTO Employees2 (EmployeeID, FirstName, LastName, Email, Salary, DepartmentID) VALUES
(13, 'Alice', 'Wonderland', 'alice.wonderland@company.com', 68000, 99);

-- error
/*Attempt to insert a duplicate email address into the Employees table and observe the unique constraint violation.*/
INSERT INTO Employees2 (EmployeeID, FirstName, LastName, Email, Salary, DepartmentID) VALUES
(13, 'Alice', 'Wonderland', 'john.doe@company.com', 68000, 1);

/*Delete a department from the Departments table that is being referenced by the Employees table and observe the foreign key constraint violation.*/
DELETE FROM Departments WHERE DepartmentID = 1;


UPDATE Employees1
SET DepartmentID = 99
WHERE EmployeeID = 1;

