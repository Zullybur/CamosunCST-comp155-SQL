-- Run command: @/Users/MattCasiro/OneDrive/Camosun/comp155/labs/lab07.sql
set echo on
SPOOL /Users/MattCasiro/OneDrive/Camosun/comp155/labs/lab07sub.txt
SET PAGESIZE 50
SET LINESIZE 300

/*********************************
 Assignment - Lab 7 Solution
 By Matthew Casiro
 Lab Section: 1A
 Due: Thursday, Feb 12 1:00 pm
 **********************************/
 
-- Get the date of the run for information
SELECT TO_CHAR(sysdate, 'Day Month DD HH24:MM') As "Script Run" 
FROM DUAL;

/*** 1 ***/
/* For each employee whose last name begins with an P, display the employee's
last name and calculate the number of months between today and the date the
employee was hired. Label the column "Months Worked" (note the case). Order
your results by the descending number of months employed. Round the number
of months so that there is only a single digit after the decimal. */

SELECT last_name AS "Last Name", 
   ROUND(MONTHS_BETWEEN(SYSDATE, hire_date), 1) AS "Months Worked"
FROM employees
WHERE last_name LIKE 'P%'
ORDER BY MONTHS_BETWEEN(SYSDATE, hire_date) DESC;

/*** 2 ***/
/* Your company is considering providing a special lunch every month for all
employees who have worked for the company at least 20 years. They will be
invited to the lunch in the month in which they were hired. To get an idea
of how many employees might come to a special lunch each month over the
calendar year, your boss has asked you to write a query to return the number
of employees who will have worked for the company at least 20 years divided
into groupings by month. Because your boss will want to run this query each
year, you are instructed to avoid hard-coding in any specific dates. If you
run the query on July 1st but some of the employees won't reach their 20 year
anniversary month until October, they should still be included in your results.
In other words, their anniversary is within the calendar year. (Note: Be sure
the months are listed in calendar order NOT in alphabetical order.) */

SELECT TO_CHAR(hire_date, 'Month') AS "Month", COUNT(*) AS "Number of Hires"
FROM employees
WHERE MONTHS_BETWEEN(TRUNC(SYSDATE, 'YYYY'), TRUNC(hire_date, 'YYYY')) >= 240
GROUP BY TO_CHAR(hire_date, 'Month')
ORDER BY TO_DATE(TO_CHAR(hire_date, 'Month'), 'MM');

/*** 3 ***/
/* Your company maintains a separate database on employee personal details.
This includes some information on their families. This database is kept in
a schema called COMP155. Your boss has told you that the company plans on
having a really big Christmas party this year on December 3rd complete with
a bar. Your boss wants to know how many people might come who are of legal
drinking age in British Columbia (in other words, are at least 19 as of
December 3rd). You need to write a query to count the number of people in
the people database who are at least 19 by that date. You will use the PEOPLE
table in the COMP155 schema for your query. */

SELECT 'The number of people who will be 19 or older as of December 3rd, '||
   TO_CHAR(SYSDATE, 'YYYY')||' is: '|| COUNT(*) 
   AS "Christmas Party"
FROM COMP155.people
WHERE MONTHS_BETWEEN(TO_DATE('12-03', 'MM-DD'), birth_date) >= 228;

SPOOL OFF
