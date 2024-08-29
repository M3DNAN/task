--Create a new database named "CompanyDB."
Create  database CompanyDB
--Create a schema named "Sales" within the "CompanyDB" database.
Create schema Sales 
GO
--Create a table named "employees" with columns: employee_id (INT), first_name (VARCHAR), last_name (VARCHAR), and salary (DECIMAL) within the "Sales" schema.
Create table  sales.employees (
employee_id INT  DEFAULT (NEXT VALUE FOR SALES.employees_SEQ),
first_name VARCHAR (255),
last_name VARCHAR (255),
 salary DECIMAL )

 --Note: on employee_id use squence NOT identity.
CREATE Sequence SALES.employees_SEQ 
AS INT 
START WITH 1 
 INCREMENT BY 1 

 --Alter the "employees" table to add a new column named "hire_date" with the data type DATE.
 ALTER TABLE sales.employees
 ADD hire_date DATE
 
 -- Select all columns from the "employees" table.
 SELECT *
 FROM sales.employees

 --Retrieve only the "first_name" and "last_name" columns from the "employees" table.
 SELECT first_name , last_name
 FROM sales.employees

 --Retrieve “full name” as a one column from "first_name" and "last_name" columns from the "employees" table.
 SELECT first_name+ ' ' + last_name  'full name'
 FROM sales.employees

 --Show the average salary of all employees.
 SELECT  avg (salary )
 FROM sales.employees



 --Select employees whose salary is greater than 50000.
SELECT *
FROM sales.employees
WHERE Salary > 50000;

--Retrieve employees hired in the year 2020.
SELECT *
FROM sales.employees
WHERE hire_date LIKE '2020%';

--List employees whose last names start with 'S.'
SELECT *
FROM sales.employees
WHERE last_name LIKE 'S%';

--Display the top 10 highest-paid employees.
SELECT *
FROM sales.employees 
ORDER BY salary 
OFFSET 0 ROWS 
FETCH FIRST 10 ROWS ONLY;

--Find employees with salaries between 40000 and 60000.
SELECT *
FROM sales.employees
WHERE Salary BETWEEN 40000  AND  60000;

--Show employees with names containing the substring 'man.'
SELECT *
FROM sales.employees
WHERE first_name LIKE '%man%' OR last_name LIKE '%man%' ;

--Display employees with a NULL value in the "hire_date" column.
SELECT *
FROM sales.employees
WHERE hire_date IS NULL ;

--Select employees with a salary in the set (40000, 45000, 50000).

SELECT *
FROM sales.employees
WHERE Salary IN (40000, 45000, 50000);

 --Retrieve employees hired between '2020-01-01' and '2021-01-01.'
SELECT *
FROM sales.employees
WHERE hire_date BETWEEN '2020-01-01' and '2021-01-01' ;

--List employees with salaries in descending order.
SELECT *
FROM sales.employees 
ORDER BY salary DESC

--Show the first 5 employees ordered by "last_name" in ascending order.
SELECT *
FROM sales.employees 
ORDER BY last_name 
OFFSET 0 ROWS 
FETCH FIRST 5 ROWS ONLY;

--Display employees with a salary greater than 55000 and hired in 2020.
SELECT *
FROM sales.employees
WHERE hire_date LIKE '2020%' and salary>55000 ;

--Select employees whose first name is 'John' or 'Jane.'

SELECT *
FROM sales.employees
WHERE first_name LIKE 'John' OR first_name LIKE 'Jane' ;

--List employees with a salary less than or equal to 55000 and a hire date after '2022-01-01.'
SELECT *
FROM sales.employees
WHERE hire_date > CAST('2022-01-01' AS DATE) and salary<=55000 ;

--Retrieve employees with a salary greater than the average salary.
SELECT *
FROM sales.employees
WHERE  salary> (SELECT  avg (salary )
FROM sales.employees) ;

--Display the 3rd to 7th highest-paid employees.
SELECT *
FROM sales.employees 
ORDER BY salary DESC 
OFFSET 2 ROWS 
FETCH NEXT 5 ROWS ONLY;

--List employees hired after '2021-01-01' in alphabetical order.
SELECT *
FROM sales.employees
WHERE hire_date > CAST('2021-01-01' AS DATE) 
ORDER BY first_name , last_name 

--Retrieve employees with a salary greater than 50000 and last name not starting with 'A.'
SELECT *
FROM sales.employees
WHERE last_name NOT LIKE 'A%' and salary>=50000 ;

--Display employees with a salary that is not NULL.
SELECT *
FROM sales.employees
WHERE salary IS NOT NULL ;

--Show employees with names containing 'e' or 'i' and a salary greater than 45000.
SELECT *
FROM sales.employees
WHERE( first_name LIKE '%E%' OR first_name LIKE '%I%') and salary>=45000 ;