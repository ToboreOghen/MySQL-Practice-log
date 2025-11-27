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
('puff', 'puff@pizza.com', '2006-03-01');

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





