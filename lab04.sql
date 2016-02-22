-- Run command: @/Users/MattCasiro/OneDrive/Camosun/comp155/labs/lab04.sql
SET echo ON

SPOOL /Users/MattCasiro/OneDrive/Camosun/comp155/labs/lab04sub.txt
SET PAGESIZE 300
SET LINESIZE 300

/****************************
 Assignment - Lab 4 Solution
 
 By: Matthew Casiro
 Lab Section: 1A
 Due: Thursday Jan 27 @ 12:30
 
 Time spent working on this lab: 1 hour
*****************************/

/*** 1 ***/
-- The HR department wants to determine the names
-- and hire dates for all employees who were hired
-- BEFORE their managers, along with their managers'
-- names and hire dates. Write a query that will list
-- all of the names (first and last) plus the hire
-- date of the employees and their managers who meet
-- the requirement. Order the results in descending
-- order by the last name of the employee. To show
-- the HR department a sample of the results, limit
-- the result set to employees whose last name starts
-- with an 'S' or greater (e.g. also a 'T', 'U',
-- 'V' etc) Be sure to handle case - use a function.
-- Use either SQL:1999 or Oracle SQL

SELECT e.first_name, e.last_name, e.hire_date,
   m.first_name, m.last_name, m.hire_date
FROM employees e INNER JOIN employees m
   ON (e.manager_id = m.employee_id)
WHERE m.hire_date > e.hire_date
   AND INITCAP(e.last_name) >= 'S'
ORDER BY e.last_name DESC;

/*** 2 ***/
-- Write a script that will do the following:
-- Include the query you produced in #1 above.
-- Use column aliases in your SELECT statement to produce
-- nice column labels like those in the example below
-- (note the use of upper and lower case and spaces). Do
-- NOT use the SQL*Plus COLUMN command to create the labels.
-- Restrict the "Employee Name" and "Manager Name" column to
-- 20 characters (use a SQL*Plus command).
-- Set an appropriate pagesize and linesize (use SQL*Plus
-- commands)
-- Include the SPOOL command so that the spooled output
-- will automatically go to a file (use a SQL*Plus command)
-- The output should look similar to the table below (only
-- the names starting with an S are given as an example):

COLUMN "Employee Name" FORMAT A20
COLUMN "Manager Name" FORMAT A20

SELECT e.first_name || ' ' || e.last_name AS "Employee Name", 
   e.hire_date AS "Hire Date",
   m.first_name || ' ' || m.last_name AS "Manager Name",
   m.hire_date AS "Hire Date"
FROM employees e INNER JOIN employees m
   ON (e.manager_id = m.employee_id)
WHERE m.hire_date > e.hire_date
   AND INITCAP(e.last_name) >= 'S'
ORDER BY e.last_name DESC;

SPOOL OFF