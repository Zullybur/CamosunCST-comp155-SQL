/*** Create the table ***/

CREATE TABLE mytextbooktable
(text_id NUMBER(5),
 text_name VARCHAR2(25),
 text_author VARCHAR2(50),
 text_publisher VARCHAR2(25),
 faculty_ref NUMBER(5));

/*** Insert some data ***/

INSERT INTO mytextbooktable
(text_name, text_author, text_publisher,faculty_ref)
VALUES
('All computers', 'Know It All', 'Self',3);

INSERT INTO mytextbooktable
(text_name, text_author, text_publisher,faculty_ref)
VALUES
('No Homework!', 'Tired Student', 'Publish',1);