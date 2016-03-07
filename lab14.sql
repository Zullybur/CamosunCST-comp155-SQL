-- Run command: @/Users/MattCasiro/OneDrive/Camosun/comp155/labs/lab14.sql

set echo on
SPOOL /Users/MattCasiro/OneDrive/Camosun/comp155/labs/lab14sub.txt
SET PAGESIZE 50

/*********************************
 Assignment - Lab 14 Solution
 By Matthew Casiro
 Lab Section: 1A
 **********************************/
 
/*** Step 1 Run script to create table & insert data ***/

@/Users/MattCasiro/OneDrive/Camosun/comp155/labs/lab14Create.sql

/*** Step 2 Create sequence ***/

CREATE SEQUENCE textbook_seq
START WITH 22
NOCACHE;

/*** Step 3 Update with sequence ***/

UPDATE mytextbooktable
SET text_id = textbook_seq.nextval;

/*** Step 4 Display details about textbook_seq ***/

SELECT sequence_name, max_value, increment_by, last_number
FROM user_sequences
WHERE sequence_name = 'TEXTBOOK_SEQ';

/*** Step 5 Make text_id the primary key ***/

ALTER TABLE mytextbooktable
ADD CONSTRAINT mytextbooktable_textid_pk
PRIMARY KEY (text_id);

/*** Step 6 Insert values ***/

INSERT INTO mytextbooktable
VALUES
    (textbook_seq.nextval, 'Relational Databases', 'Ted Codd', 'IT', 2);

INSERT INTO mytextbooktable
VALUES
    (textbook_seq.nextval, 'The greatest book ever', 'Matthew Casiro', 'Publish', 1);

/*** Step 7 List from MYTEXTBOOKTABLE ***/

SELECT text_id, text_author
FROM mytextbooktable;

/*** Step 8 Create non-unique index ***/

CREATE INDEX textname_idx ON
mytextbooktable(text_name);
      
/*** Step 9 Display details about indexes on textbook table ***/

SELECT index_name, index_type, uniqueness
FROM user_indexes
WHERE table_name = 'MYTEXTBOOKTABLE';
      
/*** Step 10 Create synonym ***/

CREATE SYNONYM text FOR mytextbooktable;
            
/*** Step 11 Use synonym to list ***/

SELECT text_id, text_author
FROM text;
      
/*** Step 12 Display synonym names ***/

SELECT *
FROM user_synonyms;
      
/*** Step 13 Drop schema objects ***/

DROP TABLE mytextbooktable PURGE;
DROP SEQUENCE textbook_seq;
DROP SYNONYM text;

/*** Step 14 End ***/

SPOOL OFF