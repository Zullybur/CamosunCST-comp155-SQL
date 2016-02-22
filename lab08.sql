-- Run command: @/Users/MattCasiro/OneDrive/Camosun/comp155/labs/lab08.sql
set echo on
SPOOL /Users/MattCasiro/OneDrive/Camosun/comp155/labs/lab08sub.txt
SET PAGESIZE 50

/*********************************
 Assignment - Lab 8 Solution
 By <give your name>
 Lab Section: 1A or 1B or 2A or 2B
 Time spent working on this lab: xx.x hrs
 **********************************/
 
/*** 1 ***/
/* Create a query to display the employee numbers, last names and
salaries of all employees who earn more than the average salary
and whose last_name begins with a 'G' or 'P' (be sure to handle
case of the last_names using a function). Sort the results in
descending order of salary. Pay close attention to your WHERE
clause. Recall the order of precedence for the AND and OR logical
operators. */

SELECT employee_id, last_name, salary
FROM employees
WHERE salary > 
   (SELECT AVG(salary)
    FROM employees)
AND 
   (INITCAP(last_name) LIKE 'G%'
    OR INITCAP(last_name) LIKE 'P%')
ORDER BY salary DESC;


/*** 2 ***/
/* Write a query that will display the last name and salary of every
employee who reports to Gerald Cambrault. (There is more than one
Cambrault in the database so you must be careful to check the first
name too.) Be sure to handle case in your comparison. */

SELECT last_name, salary
FROM employees
WHERE manager_id IN 
   (SELECT employee_id
    FROM employees
    WHERE LOWER(first_name) = 'gerald'
    AND LOWER(last_name) = 'cambrault');


/*** 3 ***/
/* How many people work in the same department as Gerald Cambrault?
Write a query to count the number of employees in Gerald's
department. Exclude Gerald from your count. (Remember, there is
more than one Cambrault in the database so be sure to check the
first name too.) Do NOT subtract one from the count in the SELECT
clause; use a subquery. */


SELECT COUNT(*) AS "# of Employees in Dept"
FROM employees
WHERE department_id = 
   (SELECT department_id
    FROM employees
    WHERE LOWER(first_name) = 'gerald'
    AND LOWER(last_name) = 'cambrault')
AND employee_id NOT IN
   (SELECT employee_id
    FROM employees
    WHERE LOWER(first_name) = 'gerald'
    AND LOWER(last_name) = 'cambrault')
ORDER BY employee_id;



/*** 4 ***/
/* Write a query to display the department IDs, employee IDs, last
names, and salaries of all employees who earn more than twice
(2 times) the average salary for the company, and who work in
the same department as any employee having a "u" anywhere in
their last name. (Remember the "u" could be at the beginning of
the name too.) Order your output by employee IDs. */
-- working in same dept as
SELECT department_id, employee_id, last_name, salary
FROM employees
WHERE salary > 
   (SELECT 2 * AVG(salary)
    FROM employees)
AND department_id IN
   (SELECT department_id
    FROM employees
    WHERE LOWER(last_name) LIKE '%u%')
ORDER BY employee_id;

SPOOL OFF