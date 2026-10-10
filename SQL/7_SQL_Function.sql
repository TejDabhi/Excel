
   PART 1: SETUP - Database, Table and Dataset
   --------------------------------------------------------------------- */
 
IF DB_ID('SQL_String_Functions') IS NULL
    CREATE DATABASE SQL_String_Functions;
GO
 
USE SQL_String_Functions;

 
DROP TABLE IF EXISTS dbo.Employees;

 
CREATE TABLE dbo.Employees
(
    employee_id   INT PRIMARY KEY,
    employee_name VARCHAR(100),
    email         VARCHAR(100),
    department    VARCHAR(50),
    city          VARCHAR(50)
);

 
INSERT INTO dbo.Employees (employee_id, employee_name, email, department, city)
VALUES
(101, 'Rahul Sharma',     'rahul.sharma@gmail.com',     'IT',        'Ahmedabad'),
(102, 'Priya Patel',      'priya.patel@gmail.com',      'HR',        'Mumbai'),
(103, 'Amit Shah',        'amit.shah@gmail.com',        'Finance',   'Ahmedabad'),
(104, 'Neha Mehta',       'neha.mehta@gmail.com',       'IT',        'Pune'),
(105, 'Rohan Desai',      'rohan.desai@gmail.com',      'Sales',     'Delhi'),
(106, '  Karan Joshi  ',  'karan.joshi@gmail.com',      'IT',        'Surat'),
(107, 'SIMRAN KAUR',      'simran.kaur@gmail.com',      'HR',        'Chandigarh'),
(108, 'vijay kumar',      'vijay.kumar@yahoo.com',      'Finance',   'Jaipur'),
(109, 'Anjali Verma',     'anjali.verma@company.com',   'Marketing', 'Ahmedabad'),
(110, 'Suresh Reddy',     'suresh.reddy@gmail.com',     'IT',        'Hyderabad'),
(111, 'Pooja Nair',       'pooja.nair@yahoo.com',       'Sales',     'Kochi'),
(112, '  Arjun Singh',    'arjun.singh@company.com',    'Finance',   'Delhi'),
(113, 'MEERA IYER',       'meera.iyer@gmail.com',       'HR',        'Chennai'),
(114, 'Nikhil Gupta',     'nikhil.gupta@company.com',   'IT',        'Noida'),
(115, 'Sneha Kapoor',     'sneha.kapoor@yahoo.com',     'Marketing', 'Mumbai'),
(116, 'Ravi Kumar',       'ravi.kumar@gmail.com',       'Sales',     'Bangalore'),
(117, '  Divya Shah  ',   'divya.shah@company.com',     'IT',        'Ahmedabad'),
(118, 'AARAV MALHOTRA',   'aarav.malhotra@gmail.com',   'Finance',   'Delhi'),
(119, 'Isha Patel',       'isha.patel@yahoo.com',       'HR',        'Surat'),
(120, 'Manish Tiwari',    'manish.tiwari@company.com',  'Marketing', 'Lucknow');

 
-- Verify dataset
SELECT * FROM dbo.Employees;
SELECT COUNT(*) AS Total_Employees FROM dbo.Employees;

 
 
SELECT
    employee_id,
    employee_name,
    UPPER(employee_name) AS Uppercase_Name,
    LOWER(employee_name) AS Lowercase_Name
FROM dbo.Employees;
 
SELECT
    employee_name,
    LEN(employee_name)        AS Character_Count,
    DATALENGTH(employee_name) AS Byte_Count
FROM dbo.Employees;
 

SELECT
    CONCAT(
        employee_id, ' | ',
        UPPER(TRIM(employee_name)), ' | ',
        UPPER(TRIM(department)), ' | ',
        UPPER(TRIM(city))
    ) AS Employee_Info
FROM dbo.Employees;
 
SELECT
    CONCAT_WS(' - ', TRIM(employee_name), TRIM(department), TRIM(city)) AS Employee_Profile
FROM dbo.Employees;
 
SELECT
    employee_name,
    LEFT(TRIM(employee_name), 3) AS Employee_Initials
FROM dbo.Employees;
 
SELECT
    employee_name,
    RIGHT(TRIM(employee_name), 5) AS Last_Five_Characters
FROM dbo.Employees;
 

 
-- Task 7 - Extract First Name (LEFT, CHARINDEX)
SELECT
    employee_name,
    CASE
        WHEN CHARINDEX(' ', TRIM(employee_name)) = 0 THEN TRIM(employee_name)
        ELSE LEFT(TRIM(employee_name), CHARINDEX(' ', TRIM(employee_name)) - 1)
    END AS First_Name
FROM dbo.Employees;
 
-- Task 8 - Extract Last Name (RIGHT, LEN, CHARINDEX)
SELECT
    employee_name,
    RIGHT(TRIM(employee_name),
          LEN(TRIM(employee_name)) - CHARINDEX(' ', TRIM(employee_name))) AS Last_Name
FROM dbo.Employees;
 
SELECT
    employee_name,
    CHARINDEX(' ', employee_name) AS Space_Position
FROM dbo.Employees;
 

SELECT
    employee_id,
    employee_name,
    PATINDEX('%ah%', employee_name) AS Position_Of_ah,
    CHARINDEX('ah', employee_name)  AS CharIndex_Position
FROM dbo.Employees
WHERE PATINDEX('%ah%', employee_name) > 0;
 

SELECT
    email,
    LEFT(email, CHARINDEX('@', email) - 1) AS Email_Username
FROM dbo.Employees;
 
SELECT
    email,
    SUBSTRING(
        email,
        CHARINDEX('@', email) + 1,
        LEN(email) - CHARINDEX('@', email)
    ) AS Email_Domain
FROM dbo.Employees;
 
 


SELECT
    employee_id,
    LOWER(REPLACE(TRIM(employee_name), ' ', '.')) AS Username
FROM dbo.Employees;
 

SELECT
    employee_name,
    UPPER(LEFT(TRIM(employee_name), 1))
        + LOWER(SUBSTRING(TRIM(employee_name), 2, LEN(TRIM(employee_name)))) AS Standardized_Name
FROM dbo.Employees;
 
SELECT
    email AS Original_Email,
    REPLACE(email, 'gmail.com', 'company.com') AS Updated_Email
FROM dbo.Employees;
 

SELECT
    CONCAT('EMP-', employee_id, '-', UPPER(TRIM(department))) AS Employee_Code
FROM dbo.Employees;
 
SELECT
    employee_name AS Original_Name,
    REVERSE(TRIM(employee_name)) AS Reversed_Name
FROM dbo.Employees;
 
 
 

SELECT
    CONCAT(TRIM(employee_name), REPLICATE('*', 10)) AS Formatted_Name
FROM dbo.Employees;
 
SELect
    department AS Department,
    COUNT(*)   AS Employee_Count,
    STRING_AGG(TRIM(employee_name), ', ')
        WITHIN GROUP (ORDER BY employee_id) AS Employees
FROM dbo.Employees
GROUP BY department;
 

SELECT
    e.employee_id,
    e.employee_name AS Original_Name,
    c.Clean_Name,
    LEFT(c.Clean_Name, CHARINDEX(' ', c.Clean_Name) - 1)                     AS First_Name,
    RIGHT(c.Clean_Name, LEN(c.Clean_Name) - CHARINDEX(' ', c.Clean_Name))    AS Last_Name,
    LOWER(REPLACE(c.Clean_Name, ' ', '.'))                                   AS Username,
    LEFT(e.email, CHARINDEX('@', e.email) - 1)                               AS Email_Username,
    SUBSTRING(e.email, CHARINDEX('@', e.email) + 1, LEN(e.email))            AS Email_Domain,
    LEN(c.Clean_Name) AS Name_Length,
    CASE
        WHEN LEN(c.Clean_Name) > 12                   THEN 'Long Name'
        WHEN LEN(c.Clean_Name) BETWEEN 8 AND 12       THEN 'Medium Name'
        ELSE 'Short Name'
    END AS Name_Category
FROM dbo.Employees AS e
CROSS APPLY (SELECT UPPER(TRIM(e.employee_name)) AS Clean_Name) AS c;
GO
 
 
 
-- 1. Employees whose email domain is gmail.com
SELECT *
FROM dbo.Employees
WHERE SUBSTRING(email, CHARINDEX('@', email) + 1, LEN(email)) = 'gmail.com';
 
-- 2. Count employees from each city
SELECT
    city,
    COUNT(*) AS Employee_Count
FROM dbo.Employees
GROUP BY city
ORDER BY city;
 
-- 3. Unique departments in uppercase
SELECT DISTINCT
    UPPER(TRIM(department)) AS Department
FROM dbo.Employees;
 
-- 4. Employees whose cleaned names have more than 10 characters
SELECT
    employee_id,
    TRIM(employee_name)            AS Clean_Name,
    LEN(TRIM(employee_name))       AS Name_Length
FROM dbo.Employees
WHERE LEN(TRIM(employee_name)) > 10;
 
-- 5. Employees whose names have leading or trailing spaces
SELECT
    employee_id,
    employee_name
FROM dbo.Employees
WHERE employee_name <> TRIM(employee_name);
 
-- 6. Department-wise employee list using STRING_AGG
SELECT
    department AS Department,
    STRING_AGG(TRIM(employee_name), ', ')
        WITHIN GROUP (ORDER BY employee_name) AS Employee_List
FROM dbo.Employees
GROUP BY department;
 
-- 7. Employees whose cleaned names start with 'A'
SELECT
    employee_id,
    TRIM(employee_name) AS Clean_Name
FROM dbo.Employees
WHERE TRIM(employee_name) LIKE 'A%';
 
-- 8. Unique employee code using CONCAT and REPLICATE (zero-padded ID)
-- Example: 101 -> EMP-00101-IT
SELECT
    employee_id,
    CONCAT(
        'EMP-',
        REPLICATE('0', 5 - LEN(CAST(employee_id AS VARCHAR(10)))),
        CAST(employee_id AS VARCHAR(10)),
        '-',
        UPPER(TRIM(department))
    ) AS Unique_Employee_Code
FROM dbo.Employees;
GO
