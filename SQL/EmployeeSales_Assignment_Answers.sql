/* =========================================================
   EmployeeSales - Numeric, Date & Time, and NULL Functions
   Run the EmployeeSales dataset script first, then run this file.
   All queries are read-only SELECT statements.
   ========================================================= */


/* ---------------------------------------------------------
   SECTION A: NUMERIC FUNCTIONS (Tasks 1-7)
   --------------------------------------------------------- */

-- Task 1: Name, salary, and sales amount rounded to two decimal places
SELECT
    EmployeeName,
    Salary,
    ROUND(Salary, 2)      AS SalaryRounded,
    SalesAmount,
    ROUND(SalesAmount, 2) AS SalesAmountRounded
FROM EmployeeSales;

-- Task 2: Sales amount rounded to the nearest whole number
SELECT
    EmployeeName,
    SalesAmount,
    ROUND(SalesAmount, 0) AS SalesAmountWhole
FROM EmployeeSales;

-- Task 3: Ceiling and floor of each sales amount
SELECT
    EmployeeName,
    SalesAmount,
    CEILING(SalesAmount) AS SalesAmountCeiling,
    FLOOR(SalesAmount)   AS SalesAmountFloor
FROM EmployeeSales;

-- Task 4: Absolute difference between salary and 50,000
SELECT
    EmployeeName,
    Salary,
    ABS(Salary - 50000) AS SalaryDifferenceFrom50K
FROM EmployeeSales;

-- Task 5: Square of quantity sold
SELECT
    EmployeeName,
    Quantity,
    POWER(Quantity, 2) AS QuantitySquared
FROM EmployeeSales;

-- Task 6: Square root of sales amount, rounded to two decimal places
SELECT
    EmployeeName,
    SalesAmount,
    ROUND(SQRT(SalesAmount), 2) AS SalesAmountSqrt
FROM EmployeeSales;

-- Task 7: Average selling amount per unit, rounded to two decimal places
SELECT
    EmployeeName,
    SalesAmount,
    Quantity,
    ROUND(SalesAmount / Quantity, 2) AS SalesPerUnit
FROM EmployeeSales;


/* ---------------------------------------------------------
   SECTION B: DATE AND TIME FUNCTIONS (Tasks 8-14)
   --------------------------------------------------------- */

-- Task 8: Joining date with joining year, month, and day
SELECT
    EmployeeName,
    JoinDate,
    YEAR(JoinDate)  AS JoinYear,
    MONTH(JoinDate) AS JoinMonth,
    DAY(JoinDate)   AS JoinDay
FROM EmployeeSales;

-- Task 9: Year, month, and day of each sale date
SELECT
    EmployeeName,
    SaleDate,
    YEAR(SaleDate)  AS SaleYear,
    MONTH(SaleDate) AS SaleMonth,
    DAY(SaleDate)   AS SaleDay
FROM EmployeeSales;

-- Task 10: Completed years of service (accurate method)
-- Count whole years between JoinDate and today, then subtract 1
-- if the work anniversary for the current year has not yet occurred.
SELECT
    EmployeeName,
    JoinDate,
    DATEDIFF(YEAR, JoinDate, GETDATE())
        - CASE
            WHEN DATEADD(YEAR, DATEDIFF(YEAR, JoinDate, GETDATE()), JoinDate) > GETDATE()
            THEN 1
            ELSE 0
          END AS CompletedYearsOfService
FROM EmployeeSales;

-- Task 11: Days between JoinDate and SaleDate
SELECT
    EmployeeName,
    JoinDate,
    SaleDate,
    DATEDIFF(DAY, JoinDate, SaleDate) AS DaysJoinToSale
FROM EmployeeSales;

-- Task 12: Sale date and the date exactly 30 days later
SELECT
    EmployeeName,
    SaleDate,
    DATEADD(DAY, 30, SaleDate) AS SaleDatePlus30Days
FROM EmployeeSales;

-- Task 13: Sale date with the weekday name
SELECT
    EmployeeName,
    SaleDate,
    DATENAME(WEEKDAY, SaleDate) AS SaleWeekday
FROM EmployeeSales;

-- Task 14: Sale date with the last date of its month
SELECT
    EmployeeName,
    SaleDate,
    EOMONTH(SaleDate) AS MonthEndDate
FROM EmployeeSales;


/* ---------------------------------------------------------
   SECTION C: NULL FUNCTIONS (Tasks 15-20)
   --------------------------------------------------------- */

-- Task 15: Bonus with missing values replaced by 0
SELECT
    EmployeeName,
    Bonus,
    ISNULL(Bonus, 0) AS BonusValue
FROM EmployeeSales;

-- Task 16: Commission with missing values replaced by 0
SELECT
    EmployeeName,
    Commission,
    COALESCE(Commission, 0) AS CommissionValue
FROM EmployeeSales;

-- Task 17: Total incentive, treating missing bonus and commission as 0
SELECT
    EmployeeName,
    Bonus,
    Commission,
    ISNULL(Bonus, 0) + ISNULL(Commission, 0) AS TotalIncentive
FROM EmployeeSales;

-- Task 18: Discount availability status
SELECT
    EmployeeName,
    Discount,
    CASE
        WHEN Discount IS NULL THEN 'Not Provided'
        ELSE 'Available'
    END AS DiscountStatus
FROM EmployeeSales;

-- Task 19: Bonus if available, otherwise commission, otherwise 0
SELECT
    EmployeeName,
    Bonus,
    Commission,
    COALESCE(Bonus, Commission, 0) AS AvailableIncentive
FROM EmployeeSales;

-- Task 20: Sales amount per unit, safe from division by zero
SELECT
    EmployeeName,
    SalesAmount,
    Quantity,
    ISNULL(ROUND(SalesAmount / NULLIF(Quantity, 0), 2), 0) AS SalesPerUnitSafe
FROM EmployeeSales;
