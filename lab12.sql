-- Run command: @/Users/MattCasiro/OneDrive/Camosun/comp155/labs/lab12.sql

set echo on
SPOOL /Users/MattCasiro/OneDrive/Camosun/comp155/labs/lab12sub.txt
SET PAGESIZE 50
SET LINESIZE 120

/*********************************
 Assignment - Lab 12 Solution
 By Matthew Casiro
 Lab Section: 1A
**********************************/

/*** Step 1 Create NEW_STUDENTS ***/

CREATE TABLE new_students (
    temp_id number(5),
    prog_id char(4),
    fname varchar2(25),
    lname varchar2(25),
    reg_date date
    );

 
/*** Step 2 Add columns ***/ 

ALTER TABLE new_students
ADD created_by varchar2(30) NOT NULL;
ALTER TABLE new_students
ADD created_date date DEFAULT SYSDATE;

/*** Step 3 Confirm additions ***/     

DESC NEW_STUDENTS

/*** Step 4 Confirm constraints for NEW_STUDENTS ***/

SELECT constraint_name, constraint_type, search_condition
FROM user_constraints
WHERE table_name = 'NEW_STUDENTS';

/*** Step 5 Create PROGRAMMES ***/

CREATE TABLE programmes (
    prog_id char(4),
    prog_desc varchar2(30)
    );

/*** Step 6 Run insert script ***/

@/Users/MattCasiro/OneDrive/Camosun/comp155/labs/lab12inserts.sql

/*** Step 7 SELECT from created tables ***/

SELECT *
FROM new_students;

SELECT *
FROM programmes;
 
/*** Step 8 Alter PROGRAMMES ***/

ALTER TABLE programmes
ADD CONSTRAINT prog_id_pk
PRIMARY KEY (prog_id);

/*** Step 9 Alter NEW_STUDENTS ***/

ALTER TABLE new_students
ADD CONSTRAINT tempid_progid_pk
PRIMARY KEY (temp_id, prog_id);

/*** Step 10 Add foreign key constraint ***/

ALTER TABLE new_students
ADD CONSTRAINT prog_id_fk
FOREIGN KEY (prog_id) REFERENCES programmes (prog_id);

/*** Step 11 Confirm constraints for new tables ***/

SELECT table_name, constraint_name, constraint_type, search_condition
FROM user_constraints
WHERE table_name = 'NEW_STUDENTS'
OR table_name = 'PROGRAMMES'
ORDER BY table_name;

/*** Step 12 Insert into NEW_STUDENTS ***/

INSERT INTO new_students
VALUES
    (9517, 'econ', 'Bill', 'Gates', SYSDATE, 'Matthew Casiro', NULL);

/*** Step 13 Explain error ***/

--The table "programmes" does not contain a prog_ig 'econ' and so
--we cannot add this entry in to new_students. Prog_id is a foreign
--key in new_students referencing programmes which means all values
--for this column in new_students must exist in programmes.

/*** Step 14 Add date constraint ***/

ALTER TABLE new_students
ADD CONSTRAINT dates_ck
CHECK (reg_date > TO_DATE('January 1, 1997', 'Month dd, yyyy'));

/*** Step 15 Test date constraint ***/

REM SQL command here

/*** Step 16 List constraints for new tables ***/

REM SQL command here

/*** Step 17 Clean up schema ***/

DROP TABLE new_students PURGE;
DROP TABLE programmes PURGE;

/*** Step 18 End ***/

SPOOL OFF