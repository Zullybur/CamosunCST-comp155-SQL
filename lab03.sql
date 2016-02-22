-- Run command: @/Users/MattCasiro/OneDrive/Camosun/comp155/labs/lab03.sql
set echo on
SPOOL /Users/MattCasiro/OneDrive/Camosun/comp155/labs/lab03sub.txt
SET PAGESIZE 300
SET LINESIZE 300

/*********************************
Assignment - Lab 3 Solution
By: Matthew Casiro
Lab Section: 01A
Due: Lab section 1A: due Tuesday Jan 27 @ 1:00 
Time spent on this lab: TODO hours
**********************************/

/*** 1 ***/
/* Write a query to display the last name, job, department number, and 
department name for all employees who work in Southlake. Be sure to 
handle case (i.e. upper and lower case) when checking that the city 
is Southlake - use a function to force a proper case comparison. Give 
the query in SQL:1999 and Oracle SQL. */

-- SQL:1999

SELECT last_name, job_title, department_id, department_name
FROM employees 
INNER JOIN departments USING (department_id)
INNER JOIN jobs USING (job_id)
INNER JOIN locations USING (location_id)
WHERE UPPER(city)='SOUTHLAKE';


-- Oracle SQL

SELECT last_name, job_title, e.department_id, department_name
FROM employees e, departments d, jobs j, locations l
WHERE e.department_id = d.department_id
AND j.job_id = e.job_id
AND l.location_id = d.location_id
AND UPPER(city)='SOUTHLAKE';

/*** 2 ***/
/* Write a query that will list all of the employees (last names), 
whose last name starts with 'G' (be sure to handle case - use a 
function), and the departments (give the name) to which they belong. 
Include all employees who have not yet been assigned to any department. 
Give the query in SQL:1999 and Oracle SQL. (Note: do not use IS NULL 
or IS NOT NULL in your query.) */

-- SQL:1999

SELECT last_name, department_name
FROM employees
LEFT OUTER JOIN departments USING (department_id)
WHERE UPPER(last_name) LIKE 'G%';

-- Oracle SQL

SELECT last_name, department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND UPPER(last_name) LIKE 'G%';


/*** 3 ***/
/* Display the employee last name and employee number along with their 
manager's last name and manager number (in other words the manager's 
employee id) for all employees whose last name begins with 'T' (be 
sure to handle case - use a function). Label the columns Employee, 
Emp#, Manager, and Mgr#, respectively (note the use of upper and lower 
case). Give the query in SQL:1999 and Oracle SQL. */

-- SQL:1999

SELECT e.last_name AS "Employee", e.employee_id AS "Emp#",
   m.last_name AS "Manager", e.manager_id AS "Mgr#"
FROM employees e INNER JOIN employees m
ON e.manager_id = m.employee_id
WHERE UPPER(e.last_name) LIKE 'T%';

-- Oracle SQL

SELECT e.last_name AS "Employee", e.employee_id AS "Emp#",
   m.last_name AS "Manager", e.manager_id AS "Mgr#"
FROM employees e, employees m
WHERE e.manager_id = m.employee_id
AND UPPER(e.last_name) LIKE 'T%';

SPOOL OFF