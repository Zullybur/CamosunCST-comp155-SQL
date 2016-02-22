-- Run command: @/Users/MattCasiro/OneDrive/Camosun/comp155/labs/lab02.sql
set echo on
SPOOL /Users/MattCasiro/OneDrive/Camosun/comp155/labs/lab02sub.txt
SET PAGESIZE 300
SET LINESIZE 300

/*********************************
 Assignment - Lab 2 Solution
 
 By: Matthew Casiro
 Lab section: 1A
 Due: Thursday Jan 22 @ 1:00
 
 Time spent working on this lab: 1.0 hours
 **********************************/
 
/*** 1 ***/
/* Write a query to display the last name and salary for 
   all employees whose salary falls in the range of $2,500 
   to $2,600 inclusive. Label the columns Poor Employee and 
   Monthly Salary respectively.*/

/* SQL commands here */
SELECT last_name AS "Poor Employee", salary AS "Monthly Salary"
FROM employees
WHERE salary BETWEEN 2500 AND 2600;

/*** 2 ***/
/* Write a query to display the last name and department 
   number of all employees in departments 60, 70 and 90 
   in alphabetical order by last name descending. */

/* SQL commands here */
SELECT last_name, department_id
FROM employees
WHERE department_id IN (60,70,90)
ORDER BY last_name DESC;

/*** 3 ***/
/* Write a query to display the last names of all employees 
   where the third letter of their name is an a. */
   
/* SQL commands here */
SELECT last_name
FROM employees
WHERE last_name LIKE '__a%';

/*** 4 ***/
/* Write a query to display the first name, last name, salary, and 
   commission for all employees who earn commissions and have a 
   last name beginning with the letter S. Sort data in 
   descending order of salary and commissions. */
   
/* SQL commands here */
SELECT first_name, last_name, salary, commission_pct
FROM employees
WHERE commission_pct > 0 AND last_name LIKE 'S%'
ORDER BY salary, commission_pct DESC;

SPOOL OFF