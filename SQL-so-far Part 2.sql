-- CREATE DATABASE training_sq;
USE training_sql;

CREATE TABLE users (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
email VARCHAR(200) NOT NULL,
signup_date DATE
);

INSERT INTO users (name, email, signup_date)
VALUES ('partrick star', 'patrickstar@pizza.com', '2025-01-01');

SELECT * FROM users;
 
 
 SELECT COUNT(*) AS total_rows FROM users;
 SELECT * FROM users;
 
 INSERT INTO users (name, email, signup_date)
 VALUES ('sandy', 'sandy@pizza.com', '2025-04-01');
 
 DESCRIBE users;
 
 SELECT * FROM users 
 WHERE id = 2;
 
 SELECT * FROM users
 WHERE name = 'partrick star';
 
INSERT INTO users (name, email, signup_date)
VALUES ('plankton', 'plankton@pizza.com', '2012-01-01'),
('crabs', 'crabs@pizza.com', '2006-03-01'),
('puff', 'puff@pizza.com', '2006-03-01'); -- INDEPENDENTLY RUN THIS LINE OF CODE 
                                          -- 3 TO 5 TIMES TO CREATE DUPLICATES, 
                                          -- IT WILL AID YOU IN YOUR LEARNING

SELECT * FROM users;

CREATE TABLE users_backup AS SELECT * FROM users;
SELECT * FROM users_backup;



SELECT * FROM users WHERE name ='partrick star';

SELECT * FROM users WHERE signup_date = '2006-03-01';

SELECT * FROM users WHERE name <> 'sandy';

SELECT * FROM users WHERE name != 'sandy';

-- LESS THAN
SELECT * FROM users WHERE signup_date < '2025-01-01';

SELECT * FROM users WHERE id < 5;

-- GREATER THAN
SELECT * FROM users WHERE id > 8;


-- LESS THAN OR EQUAL TO
SELECT *FROM users WHERE id <= 5; -- returns id; i-5 

SELECT * FROM users WHERE signup_date <= '2012-01-01';


-- GREATER THAN OR EQUALS TO 
SELECT * FROM users WHERE signup_date >= '2012-01-01';

-- WHERE with  AND/OR/NOT
-- AND(both conditions must be true)
SELECT * FROM users 
WHERE name = 'plankton' AND signup_date < '2025-01-01';

SELECT * FROM users WHERE id > 4 AND id < 7;

-- OR (at least one condition is true)
SELECT * FROM users WHERE name ='plankton' OR name = 'bovi';

SELECT * FROM users 
WHERE signup_date < '2012-01-01' OR signup_date > '2006-01-01';

-- combining AND and OR
-- NOTE...
-- only the codition that displays 
-- a true boolean will be shown

SELECT * FROM users 
WHERE name = 'sandy' OR name = 'mr krbs' AND signup_date < '2012-01-01';

-- the AND is analyzed first before the OR. meaning the above query will
-- be run/seen as the below;

SELECT * FROM users 
WHERE name = 'sandy' OR (name = 'mr krbs' AND signup_date < '2012-01-01'); 
-- that  which is in parenthesis is false so it wil not be displayed in the grid


-- NOT(negation)
SELECT * FROM users WHERE NOT (name = 'plankton'); 
-- you must always use  parenthesis() when using NOT
-- as it is the ethical way, and makes readability easier 
-- SELECT * FROM users WHERE NOT name = 'plankton'; (works but ethically wrong)

-- we can also say this in another way. which is practically the same.
SELECT * FROM users WHERE name <> 'plankton';

-- combining NOT and AND
SELECT * FROM users 
WHERE name <> 'puff' AND name <> 'crabs';

-- or you can do it like this 
SELECT * FROM users 
WHERE NOT (name = 'plankton') AND NOT (name = 'crabs');


-- WHERE with LIKE
-- this allows you to match patterns intead of the exact string
-- istead of finding sandy you can instead look for names that start with "S" OR 
-- as "an" in it OR as "y" at the end' And the symbol used with it is the '%' 
-- which can be used before or after the charaters depending on the position of 
-- of the said character.

SELECT * FROM users WHERE name LIKE 's%';
-- this return the full details of sandy since she the only user with s in her name

SELECT * FROM users WHERE name LIKE 'p%';
-- this returns the full details of all users with 'P' in thier name

SELECT * FROM users WHERE name LIKE '%ton';
-- returns names that end with 'ton'

SELECT * FROM users WHERE name LIKE '%and%';
-- returns names with 'and' in between.alter

SELECT * FROM users WHERE email LIKE '%pizza.com';
-- find emails from pizza.con

SELECT * FROM users WHERE name LIKE '______%';
-- finds name that are at least 6 characters long. 
-- this depends on the number of underscores used before the '%'

-- NOTE!!!
-- SQL IS USUALLY CASE SENSITIVE, BUT THERE ARE SOME FUNTIONS THAT ARE
-- CASE INSRNSITIVE AND 'LIKE' IS ONE OF SUCH CASES 
SELECT * FROM users WHERE name LIKE 'PARTR%';

-- LIKE vs =
-- use the '=' when you want the exct match 
-- use the 'LIKE' when you  want partial matching


-- WHERE with IN
-- this allows you to check if a value from the query matches one of the
-- the many options in the table 
-- it is cleaner than using the 'OR' funtion in most cases
-- istead of saying "where name = 'sandy' OR name = 'partrick star' OR name = 'bovi' "
-- we can write...
SELECT * FROM users WHERE name IN ('sandy', 'partrick star', 'bovi', 'ricardo');
 
-- use NOT IN 
-- this finds users who are not in the given query
SELECT * FROM users WHERE name NOT IN ('sandy', 'partrick star', 'bovi', 'ricardo');

-- finding emails 
SELECT * FROM users WHERE email IN ('sandy@pizza.com', 'patrickstar@pizza.com', 'bovi', 'ricardo');

-- use IN with dates
SELECT * FROM users WHERE signup_date IN ('2025-01-01', '2012-01-01');

-- IN vs OR
-- short           |  long
-- harder to read  |  easy to read
-- used less in SQL|  used everywhere
-- more mistakes   |  cleaner and less mistakes 

SELECT * FROM users WHERE name IN ('sandy', 'partrick star', 'bovi');
-- neat and short 

SELECT * FROM users WHERE name = 'sandy' OR name = 'partrick star' OR name = 'bovi';
-- long and not so clean

-- IN with NULL
-- in does not match NULL values 
-- example
SELECT * FROM users WHERE signup_date IN (NULL);
-- this will return NULL/Nothing


-- next: ORDER BY
-- this tells you how to arrange the rows before showing them
-- whether i ascending (ASC) or descending(DESC) orders whether it be 
-- numbers or text.
-- the two funtions used alongside it are ASC and DESC

SELECT * FROM users ORDER BY name;
-- this shows all users sorted by name alphabetically by name.

-- ASC vs DESC
SELECT * FROM users ORDER BY name ASC;

SELECT * FROM users ORDER BY name DESC;

SELECT * FROM users ORDER BY signup_date;

-- sorting by multiple columns
SELECT * FROM users ORDER BY name ASC, signup_date DESC;

-- order by coming brfore WHERE 
SELECT * FROM users  WHERE name LIKE 'p%' ORDER BY signup_date ASC;

-- next lesson LIMIT
-- selects how many rows are returned by select.
SELECT * FROM users LIMIT 5;
SELECT * FROM users LIMIT 1;
SELECT * FROM users LIMIT 10;

-- LIMIT always comes last in an SQL statement 
SELECT * FROM users WHERE name LIKE 'p%' ORDER BY signup_date DESC LIMIT 3;

-- LIMIT witout ORDER BY IS DANGEROUS as it will give you the first or 
-- a random row within the table 
--  SELECT * from users LIMIT 1;
-- BUT IF YOU COMBINE LIMT WITH ORDER BY it gives you the recently or the newest registered users 
-- like what we have below 
SELECT * FROM users ORDER BY signup_date DESC LIMIT 3;

-- while this gives use the recent or the older entries of users
SELECT * FROM users ORDER BY signup_date ASC LIMIT 3;

-- LIMIT with OFFSET(OPTIONALOR BUT USEFUL)
-- how the structure works behind the scene 
-- LIMIT <offset>, <count>
-- it means to skip(offset) set of rows and dispay(count) the next set of row
-- example :
SELECT * FROM users ORDER BY name ASC LIMIT 4, 3; 


-- DISTINCT
-- this removes duplcate vsluesfrom te data set. 
-- it does not delete th erow from the table
SELECT DISTINCT  name FROM  users;

-- the codw means to show al unique names in the table
-- so it shows only one of each names and avoids showing duplicates
-- makin sure it only appears once
 
SELECT DISTINCT email FROM users; 
SELECT DISTINCT signup_date FROM ussrs;

-- this can also be done n multiole colomns 
SELECT DISTINCT name, email, signup_date FROM users;
SELECT DISTINCT name, signup_date FROM users;
SELECT DISTINCT name, signup_date FROM users LIMIT 3;
 

-- DISTINT and ORDER BY
SELECT DISTINCT name FROM users ORDER BY name ASC;
SELECT DISTINCT name FROM users ORDER BY name DESC;

-- DISTINCT vs DELETE
-- these two are different as they do not funtion the same
-- DISCTINCT does not alter the cotent of the table, 
-- so without it the query runs the original contents of the table 
-- DELETE alters the cotent of the table
-- without it the query runs with the altered content


-- GROUP BY
-- group by name
 SELECT name, COUNT(*) AS total_Users FROM users GROUP BY name;
 -- group by signup_date
 SELECT signup_date, COUNT(*) AS count_by_date FROM users GROuP BY signup_date;
 
 -- multipl columns in group by 
SELECT name, signup_date, COUNT(*) AS duplicates FROM users GROUP BY name, signup_date;

-- GROUPP BY + ORDER BY 
SELECT name, COUNT(*) AS total_users FROM users GROUP BY name ORDER BY total_users DESC;

-- RULES in GROUP BY  
--  every column in selected must be wrapped in group by or in its corresponding function 
--  count, sum etc.


-- AGGREGATE FUNCTIONS
-- These work together with group by. e.g 
-- COUNT()
-- SUM()
-- AVG()
-- MIN()
-- MAX()

-- COUNT() - COUNTS ROWS 
-- this returns the number of rows
SELECT COUNT(*) FROM users;

-- counting rows with conditions 
SELECT COUNT(*) FROM users WHERE name = 'plankton';

-- this group rows with similar names and return the total of each group
SELECT name, COUNT(*) AS total FROM users GROUP BY name;

-- MIN() - smallest vaue
-- this works with numbers, dates, text(alphabetical order)

-- Earliest signup_date
SELECT MIN(signup_date)AS earliest FROM users;
-- lowest ID
SELECT MIN(id) FROM users;

-- MAX() - largest value 
-- this works with numbers, dates, text(alphabetical order) 
-- while picking the largest number in any given row. 

-- latest signup date 
SELECT MAX(signup_date) AS latest FROM users;

-- HIGHEST ID
SELECT MAX(id) FROM users;

-- SUM() - add values together
-- SUM only works on nummeric columns 
-- I'll work with the salary column which will be adding now, below.

ALTER TABLE users ADD COLUMN salary INT;
DESCRIBE users;
SET SQL_SAFE_UPDATES = 0;
SELECT * FROM users; -- WHERE name = 'sandy';
UPDATE users SET salary = 90000 WHERE name = 'sandy';
UPDATE users SET salary = 150000 WHERE name = 'crabs';
UPDATE users SET salary = 90000 WHERE name = 'plankton';
UPDATE users SET salary = 120000 WHERE name = 'puff';
UPDATE users SET salary = 50000 WHERE name = 'partrick star';
SET SQL_SAFE_UPDATES = 1;


-- SUM()
SELECT SUM(salary) AS total_salary FROM users;

-- multiple salary calculation for a single person 
SELECT SUM(salary) AS crabs_total FROM users WHERE name = 'crabs';

-- total salaries per names (using GROUP BY)
SELECT name, SUM(salary) AS total_salary FROM users GROUP BY name;


-- AVG() - avearage of the total values in anumerical column
-- average sa;ary of all users 
SELECT AVG(salary) AS avg_salary FROM users;

-- if you have multiple rows per name. this gives you their mean salary
SELECT name, AVG(salary) AS avg_salary FROM users GROUP BY name;

-- average salary per signup date
SELECT signup_date, AVG(salary) AS avg_salary FROM users GROUP BY signup_date;


-- SUM + AVG + ORDER BY (a very common combo)
-- highest total salary 
SELECT name, SUM(salary) AS total_salary FROM users
GROUP BY name ORDER BY total_salary DESC;

-- HIGHEST average salary 
SELECT name, AVG(salary)AS avg_salary FROM users 
GROUP BY name ORDER BY avg_salary DESC;


-- HAVING 
-- this filters groups. yes groups not rows unlike WHERE
--  which cannot filter aggregate result. e.g.
-- (WHERE SUM(SALARY) > 100000) this is invalid
-- having filters after group by, meaning it can use aggregate functions.

SELECT name, SUM(salary) AS total_salary FROM users 
GROUP BY name HAVING total_salary > 100000;

-- HAVING vss WHERE 
-- WHERE = filters rows
-- HAVING filters GROUP, after GROUP BY AND all its related functions are done
-- with there calculation or oretional roles 

-- WHERE filters rows before grouping
SELECT name, SUM(salary) FROM users WHERE signup_date > '2012-01-01'
GROUP BY name;

-- HAVING filters groups after grouping is done
SELECT name, SUM(salary) FROM users GROUP BY name HAVING SUM(salary) > 90000;

-- HAVING with count
-- this shows only names that appear more than ones
SELECT name, COUNT(*) AS total FROM users GROUP BY name HAVING total > 1;

SELECT name, COUNT(*) AS total FROM users GROUP BY name HAVING COUNT(*) > 1;

SELECT signup_date, COUNT(*) AS total FROM users GROUP BY signup_date 
HAVING COUNT(*) > 1;

-- HAVING with ORDER BY 
SELECT name, SUM(salary) AS total_salary FROM USERS GROUP BY name HAVING 
total_salary > 50000 ORDER BY total_salary DESC;

-- you can use HAVING without GROUP BY
-- in this case you calculate the total sum  of the salary on the table
-- without grouping them. use having to chect if the total is greater than your 
-- expected figure (200000) if it is we'll get an answer if it isn't we won't
-- get a return.
SELECT SUM(salary) AS total_salary FROM users HAVING total_salary > 200000;



