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