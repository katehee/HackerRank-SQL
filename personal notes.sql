================================================
SELECT name, address 
	FROM table 
	WHERE address = "x" OR address = "y"; 
-- equivalent to 
SELECT name, address 
	FROM table 
	WHERE address IN ("x" ,"y");
================================================