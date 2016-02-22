CREATE TABLE casirom
(MEALDATE DATE,
 BREAKFAST VARCHAR2(50));

INSERT INTO casirom
VALUES
    ('15-FEB-2016', 'One Sip, Rotten Soylent');

INSERT INTO casirom
VALUES
    ('14-FEB-2016', 'Fried Chicken and Waffles');

INSERT INTO casirom
VALUES
    ('13-FEB-2016', 'Chicken and Pesto Eggs Benny');

INSERT INTO casirom
VALUES
    ('12-FEB-2016', 'One Bottle, Soylent');

INSERT INTO casirom
VALUES
    ('11-FEB-2016', 'One Bottle, Soylent');

INSERT INTO casirom
VALUES
    ('10-FEB-2016', 'One Bottle, Soylent');

INSERT INTO casirom
VALUES
    ('09-FEB-2016', 'One Bottle, Soylent');

SELECT *
FROM casiro.casirom;

GRANT SELECT ON casiro.casirom TO faris;

SELECT *
FROM kim.kimms;

GRANT SELECT ON casiro.casirom TO faris WITH GRANT OPTION;

GRANT SELECT ON kim.kimms TO faris;

SELECT *
FROM faris.fariss;

INSERT INTO faris.fariss
VALUES
    ('15-FEB-2016', 'One Sip, Rotten Broccoli');

GRANT INSERT ON casiro.casirom TO faris;

GRANT INSERT ON casiro.casirom TO kim;

INSERT INTO faris.fariss
VALUES
    ('15-FEB-2016', 'One Sip, Rotten Broccoli');

INSERT INTO kim.kimms
VALUES
    ('15-FEB-2016', 'One Sip, Rotten Broccoli');

COMMIT;

REVOKE SELECT ON casiro.casirom FROM faris;

SELECT *
FROM user_tab_privs_recd;

REVOKE INSERT ON casiro.casirom FROM faris;

REVOKE INSERT ON casiro.casirom FROM kim;

SELECT * FROM USER_TAB_PRIVS_MADE;

SELECT * FROM user_sys_privs;

GRANT UPDATE (MEALDATE) ON casiro.casirom TO kim, faris;

UPDATE faris.fariss
SET MEALDATE = SYSDATE;

SELECT * FROM casiro.casirom;

DROP TABLE casiro.casirom;