-- Run command: @/Users/MattCasiro/OneDrive/Camosun/comp155/labs/lab06.sql
SET PAGESIZE 300
SET LINESIZE 300

set echo on
SPOOL /Users/MattCasiro/OneDrive/Camosun/comp155/labs/lab06sub.txt

/*********************************
 Assignment - Lab 6 Solution
 By: Matthew Casiro
 Section: 1A
 Due: Thursday, Feb 5 1:00 pm
 Time spent completing this lab: 1 hour
 **********************************/
 
/*** 1 ***/
/* Write a query to display the number of people with the same job. Use JOB_ID 
in your query and list the jobs by JOB_ID along with the number of people having
that job.*/

SELECT job_id, COUNT(job_id)
FROM employees
GROUP BY job_id;

/*** 2 ***/
/* Display the highest, lowest, sum, and average salary of all employees. Label 
the columns Maximum, Minimum, Sum, and Average, respectively (note the use of 
upper and lower case). Round your results to the nearest whole number. Do not use
the min_salary or max_salary attributes in the jobs table. */

SELECT MAX(salary) AS "Maximum", MIN(salary) AS "Minimum",
   SUM(salary) AS "Sum", AVG(salary) AS "Average"
FROM employees;
 
/*** 3 ***/ 
/* Modify the above (#2) to display the maximum, minimum, sum, and average 
salary for each job type  (assume each job_id represents a job type). Be 
sure to give the job type in your output.*/

SELECT job_id, MAX(salary) AS "Maximum", MIN(salary) AS "Minimum",
   SUM(salary) AS "Sum", AVG(salary) AS "Average"
FROM employees
GROUP BY job_id;

/*** 4 ***/ 
/* Display the manager number and the salary of the lowest paid employee for 
that manager. Exclude anyone whose manager is not known - in other words, 
exclude anyone who has a NULL manager_id. */

SELECT manager_id, MIN(salary)
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id;

/*** 5 ***/ 
/* Modify your query from above (#4) to exclude any groups where the minimum 
salary is less than or equal to $6,000. Sort the output in descending order of 
salary. */

SELECT manager_id, MIN(salary)
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(salary) > 6000
ORDER BY MIN(salary) DESC;

SPOOL OFF