-- Run command: @/Users/MattCasiro/OneDrive/Camosun/comp155/labs/lab11.sql

set echo on
SPOOL /Users/MattCasiro/OneDrive/Camosun/comp155/labs/lab11sub.txt
set pagesize 20
set linesize 80

/*********************************
 Assignment - Lab 11 Solution
 By Matthew Casiro
 Lab Section: 1A
 Time Used Completing Lab: 1.0 hours
 **********************************/
 
/*** 1 Create MY_STUDENT ***/
 
CREATE TABLE my_student (
    mystudent_id NUMBER(5),
    mylname VARCHAR2(25),
    mystartdate DATE DEFAULT SYSDATE
    );
 
/*** 2 Describe ***/

DESC my_student

/*** 3 Modify MY_STUDENT ***/

ALTER TABLE my_student
MODIFY mylname VARCHAR(50);

/*** 4 Describe ***/

DESC my_student

/*** 5 Insert your name ***/

INSERT INTO my_student (mystudent_id, mylname)
VALUES (95003, 'Casiro');

/*** 6 List contents ***/

SELECT *
FROM my_student;

/*** 7 Add comment ***/
 
COMMENT ON TABLE my_student IS
'Lab 11 Table';

/*** 8 Confirm comment for MY_STUDENT ***/

SELECT *
FROM user_tab_comments
WHERE LOWER(table_name) = 'my_student';

/*** 9 Create table My_Student ***/

CREATE TABLE "My_Student" AS
SELECT mystudent_id AS "StudentNo", mylname AS "Last Name", mystartdate AS "BeginDate"
FROM my_student;

/*** 10 Describe ***/

DESC "My_Student"

/*** 11 Select from data dictionary ***/

SELECT table_name
FROM user_tables;
   
/*** 12 Drop MY_STUDENT ***/

DROP TABLE my_student PURGE;

/*** 13 Rename ***/

RENAME "My_Student" TO "MY_STUDENT";

/*** 14 Select from data dictionary ***/

SELECT table_name
FROM user_tables;

/*** 15 Drop MY_STUDENT ***/

DROP TABLE my_student PURGE;

/*** 16 Select from data dictionary ***/

SELECT table_name
FROM user_tables;

/*** 17 ***/

SPOOL OFF