-- Run command: @/Users/MattCasiro/OneDrive/Camosun/comp155/labs/lab05.sql
set echo on
SET PAGESIZE 300
SET LINESIZE 300

SPOOL /Users/MattCasiro/OneDrive/Camosun/comp155/labs/lab05sub.txt

/*********************************
 Assignment - Lab 5 Solution
 By: Matthew Casiro
 Section: 1A
 Due: Tuesday, Feb 3 10:30 am

 Time spent completing this lab: 1 hour
 **********************************/
 
/*** 1 ***/
/* Run the script to add a couple of records to your HR employees table.*/
INSERT INTO employees
(employee_id, first_name, last_name, email, hire_date, job_id, salary)
VALUES
(9989, 'bill', 'rIm', 'rim@home.com', sysdate, 'PU_CLERK', 1500.25);

INSERT INTO employees
(employee_id, first_name, last_name, email, hire_date, job_id, salary)
VALUES
(9988, 'LARRY', 'rIMMER', 'rimmer@myhome.com', sysdate, 'PU_CLERK', 1600.25);

/*** 2 ***/
/* For all employees whose last name starts with the letter R, display the 
   employee's last names with the first letter capitalized and all other 
   letters lowercase (be sure to use a function), and give the length of their 
   last name. Give each column an appropriate label using SQL (i.e. do not use 
   the column name default). Sort the results in descending order by the 
   employee's last name. */

SELECT INITCAP(LOWER(last_name)) AS "Last Name", 
   LENGTH(last_name) AS "NumChars"
FROM employees
WHERE INITCAP(last_name) LIKE 'R%'
ORDER BY LOWER(last_name) DESC;

/*** 3 ***/
/* Your boss was at a company party and met a fellow employee named Olson, or 
was it Olsen, or may something else like that. He wasn't quite sure (his 
hearing is bad when he drinks). He wants you to run a query that will get 
all employees whose name sounds like Olson and the name of the department 
for which they work. He is sure once he sees the name and department he 
will remember the person. Make sure you use a function to check for the sound 
of the name. */

-- Traditional

SELECT INITCAP(LOWER(e.first_name)) || ' ' || INITCAP(LOWER(e.last_name))
   AS "Name",
   department_name AS "Department"
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
   AND SOUNDEX(e.last_name) = SOUNDEX('olson');

-- SQL/92 

SELECT INITCAP(LOWER(first_name)) || ' ' || INITCAP(LOWER(last_name)) AS "Name",
   department_name AS "Department"
FROM employees
LEFT OUTER JOIN departments
   USING (department_id)
WHERE SOUNDEX(last_name) = SOUNDEX('olson');

/*** 4 ***/
/* Write a query that produces the following for each employee whose last 
name begins with an R: <employee last name> earns <salary> monthly but 
wants <3 times salary>. Label the column Dream Salaries. */

SELECT last_name || ' earns ' || LTRIM(TO_CHAR(salary, '$999,999,999.00')) || ' monthly but wants ' || LTRIM(TO_CHAR(salary * 3, '$999,999,999.00')) ||'.' AS "Dream Salaries"
FROM employees
WHERE INITCAP(last_name) LIKE 'R%';


/*** 5 ***/
ROLLBACK;

SPOOL OFF