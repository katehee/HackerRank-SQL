7==SELECT ORDER BY & GROUP BY ==================
SELECT name, address 
	FROM table 
	WHERE address = "x" OR address = "y"; 
-- equivalent to 
SELECT name, address 
	FROM table 
	WHERE address IN ("x" ,"y");

SELECT
	FROM
	GROUP BY 
	HAVING
	ORDER BY
================================================

8=======INSERT, UPDATE, DELETE==================
CREATE TABLE store (
	id INT AUTO_INCREMENT PRIMARY KEY, 
	name CHAR(4)); 
SELECT LAST_INSERT_ID(); #returns the last auto incremented id #
ALTER TABLE store AUTO_INCREMENT=100; #id starts from 100
SET @@auto_increment_increment=3; #every 3 number from 100. 103, 106, 109

DESC table; #describe()

#insert one data row
INSERT INTO table VALUES(col1_value, col2_value..)
#import data from other table with one statement 
INSERT INTO table_name 
	SELECT col FROM table2; 

#Update
UPDATE table
	SET col = 'y'#, col2 = '0'
	WHERE col = 'x'; #switch x to y 

#Delete
DELETE FROM table
	WHERE col LIKE '%' #% means including any character after %
================================================

9================INT, CHAR, FLOAT, DATE=========
SET @txt = "example"
SET @height = 160; 
SELECT @txt, name FROM table where height > @height; 

SET @count = 1; 
PREPARE any_val_name FROM 'SELECT name from table LIMIT ?'
EXECUTE any_val_name using @count; #count value replace '?''

SELECT CAST(AVG(price) AS SIGNED) average_price FROM table; #OR
SELECT CONVERT(AVG(price), SIGNED) average_price FROM table; 

SELECT CAST('2022%12%12' AS DATE); 

SELECT CONCAT('', '')
================================================

10====Join(inner, outer, cross, self)===========
#inner join
SELECT X.id, X.name, Y.prod_name
FROM x_table X
	INNER JOIN y_table Y
	ON x_table.id = y_table.id
[WHERE] x_table.id = '' #x_table content first then y table info follows 


#outer join (full: include both table)
SELECT
FROM first table
	<LEFT | RIGHT | FULL> OUTER JOIN <second table (right)>
	ON <join condition>
[WHERE]

#self joining one same table 
SELECT A.emp "employee" , B.emp "manager", B.phone "manager's manager contact"
   FROM emp_table A
      INNER JOIN emp_table B
         ON A.manager = B.emp
   WHERE A.emp = 'assistant';

-- |EMP 		|MANAGER 	|CONTACT|
-- ----------------------
-- CEO 			|NULL		| 1111	|
-- dep_manager  |CEO 		| 2222	| 
-- assistant 	|dep_manager| 3333	|

-- returns 
-- assistant | dep_manager | 1111

================================================

11: SQL Programming (If, Case, While) ==========
DELIMITER $$
CREATE PROCEDURE function_name #ex. count()
BEGIN
	<code>
	DECLARE variable_name INT; #option to declar var name 
	SET variable_name = 100; 
	IF var_name = 100 THEN 
		SELECT <>
	ELSE
		SELECT <>
	END IF; 
END $$
DELIMITER ; 
CALL <function_name>

DECLARE purchase_date DATE; 
SELECT purchase INTO purchase_date #put info into purchase_date variable
	FROM market_db.member
	WHERE mem_id = 112; 

 CASE
 	WHEN condition1 THEN 
 		<SQL command>
 	WHEN condition2 THEN 
 		<SQL command>
 	ELSE
 		<SQL command>
 END CASE; 

 #while 
 WHILE <condition> DO 
 	<sql command>;
 END WHILE; 

myWhile: 
 WHILE <condition> DO 
 	IF () THEN 
 		ITERATE myWhile; #goes to next while loop
 	END IF; 
 	IF () THEN 
 		LEAVE myWHile; #end while loop 
 	END IF; 
 END WHILE; 

#dynamic SQL: PREPARE AND EXECUTE ex. gate_entry_time indicating when (date/time) people passed the gate 
 PREPARE myQuery FROM 'SELECT * FROM member WHERE mem_id = 'ABC''; 
 EXECUTE myQuery; 
 DEALLOCATE PREPARE myQuery; 
================================================

13.PRIMARY, FOREIGN, UNIQUE, CHECK, DEFAULT ====
#3 ways to assign primary key 
DROP TABLE IF EXISTS member;
CREATE TABLE member 
( mem_id  CHAR(8) NOT NULL PRIMARY KEY);  

CREATE TABLE member 
( mem_id  CHAR(8) NOT NULL, 
  PRIMARY KEY (mem_id));

ALTER TABLE member
     ADD CONSTRAINT 
     PRIMARY KEY (mem_id);

#foreign 
CREATE TABLE buy 
(  num         INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
   mem_id      CHAR(8) NOT NULL, 
   FOREIGN KEY(mem_id) REFERENCES member(mem_id)
);

ALTER TABLE buy
    ADD CONSTRAINT 
    FOREIGN KEY(mem_id) REFERENCES member(mem_id)
    ON UPDATE CASCADE #******
    ON DELETE CASCADE; #******

#on upate/delete cascade allows to update linked keys 
UPDATE member SET mem_id = 'PINK' WHERE mem_id='BLK';

-- UNIQUE
CREATE TABLE member 
( email       CHAR(30)  NULL UNIQUE); #there will be no duplicate 

-- CHECK
CREATE TABLE member 
( height      TINYINT UNSIGNED NULL CHECK (height >= 100));

ALTER TABLE member
    ADD CONSTRAINT 
    CHECK  (phone1 IN ('416', '647')) ;

-- DEFAULT
CREATE TABLE member 
(height      TINYINT UNSIGNED NULL DEFAULT 160);

ALTER TABLE member
    ALTER COLUMN phone1 SET DEFAULT '416';
================================================