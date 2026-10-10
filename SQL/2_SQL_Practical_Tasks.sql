-- SQL Lecture 2 – Practical Tasks

-- Task 1: Create a database named SchoolDB
CREATE DATABASE SchoolDB;

-- Task 2: Use the SchoolDB database
USE SchoolDB;

-- Task 3: Create Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Age INT,
    Course VARCHAR(100),
    Marks DECIMAL(5,2)
);

-- Task 4: Insert at least 5 records
INSERT INTO Students (StudentID, StudentName, Age, Course, Marks)
VALUES
(1, 'Rahul Sharma', 20, 'Computer Engineering', 85.50),
(2, 'Priya Patel', 21, 'Information Technology', 91.00),
(3, 'Amit Shah', 19, 'Artificial Intelligence', 78.50),
(4, 'Neha Mehta', 20, 'Data Science', 88.00),
(5, 'Rohan Desai', 22, 'Computer Engineering', 82.00);

-- Task 5: Display all records from Students
SELECT * FROM Students;


-- Task 8: Create Employees table using different data types
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Salary DECIMAL(10,2),
    JoiningDate DATE,
    IsActive BOOLEAN
);

-- Task 9: Insert 2–3 records into Employees
INSERT INTO Employees (EmployeeID, EmployeeName, Salary, JoiningDate, IsActive)
VALUES
(101, 'Raj Patel', 45000.00, '2025-01-15', TRUE),
(102, 'Anjali Shah', 52000.50, '2024-08-20', TRUE),
(103, 'Karan Mehta', 38000.75, '2025-06-10', FALSE);

-- Display all Employees data
SELECT * FROM Employees;
