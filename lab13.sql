-- Run command: @/Users/MattCasiro/OneDrive/Camosun/comp155/labs/lab13.sql

set echo on
SPOOL /Users/MattCasiro/OneDrive/Camosun/comp155/labs/lab13sub.txt
SET PAGESIZE 50

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

REM SQL command here

/*** Step 3 List Views from Dictionary ***/

REM SQL command here

/*** Step 4 Create DEPT50 view ***/

REM SQL command here

/*** Step 5 Structure & Contents of DEPT50 ***/

REM SQL command here (structure)
REM SQL command here (contents)

/*** Step 6 Reassign Matos ***/

REM SQL command here

/*** Step 7 Why did you get an error? ***/

REM Explain the error here

/*** Step 8 List views from USER_VIEWS ***/

REM SQL command here
      
/*** Step 9 Drop the new views ***/

REM SQL command here

/*** Step 10 ***/

SPOOL OFF