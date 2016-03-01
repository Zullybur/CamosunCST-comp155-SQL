-- Run command: @/Users/MattCasiro/OneDrive/Camosun/comp155/labs/lab13.sql

set echo on
SPOOL /Users/MattCasiro/OneDrive/Camosun/comp155/labs/lab13sub.txt
SET PAGESIZE 50
SET LINESIZE 120

/*********************************
 Assignment - Lab 13 Solution
 By Matthew CAsiro
 Lab Section: 1A
 Approx. Time Spent: TODO hrs
 **********************************/

/*** Step 1 Create EMPLOYEES_VW ***/

CREATE VIEW employees_vw AS
SELECT employee_id, first_name || ' ' || last_name AS empname, department_id
FROM employees;

/*** Step 2 Display for Dept 90 ***/

SELECT *
FROM employees_vw
WHERE department_id = 90;

/*** Step 3 List Views from Dictionary ***/

SELECT view_name, text
FROM user_views
WHERE view_name = 'EMPLOYEES_VW';

/*** Step 4 Create DEPT50 view ***/

CREATE VIEW dept50 AS
SELECT employee_id AS empno, last_name AS employee, department_id AS deptno
FROM employees
WHERE department_id = 50
WITH CHECK OPTION CONSTRAINT dept50_emp_info;

/*** Step 5 Structure & Contents of DEPT50 ***/

DESC dept50

SELECT *
FROM dept50
WHERE rownum <= 10;

/*** Step 6 Reassign Matos ***/

UPDATE dept50
SET deptno = 80
WHERE INITCAP(employee) = 'Matos';

/*** Step 7 Why did you get an error? ***/

-- The "WITH CHECK OPTION" constraint disallows INSERT, UPDATE, and DELETE commands
-- that would impact the named column (in this case: deptno)

/*** Step 8 List views from USER_VIEWS ***/

SELECT view_name, text
FROM user_views
WHERE view_name = 'EMPLOYEES_VW'
OR view_name = 'DEPT50';
      
/*** Step 9 Drop the new views ***/

DROP VIEW employees_vw;
DROP VIEW dept50;

/*** Step 10 ***/

SPOOL OFF