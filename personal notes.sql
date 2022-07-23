7===============================================
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

8===============================================
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

-- |EMP|MANAGER|CONTACT|
-- ----------------------
-- CEO 		|NULL		| 1111	|
-- dep_manager | CEO 		| 2222	| 
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
================================================