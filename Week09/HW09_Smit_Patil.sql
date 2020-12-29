USE DWBI;

-- Creating Tables for both test cases
CREATE TABLE test (id CHAR(5))
CREATE TABLE test2 (id CHAR(5))

-- Inserting Values in test table
INSERT INTO test VALUES ('ca-1')
INSERT INTO test VALUES ('ca-2')
INSERT INTO test VALUES ('ca-3')
INSERT INTO test VALUES ('ca-4')
INSERT INTO test VALUES ('ca-5')
INSERT INTO test VALUES ('ca-10')
INSERT INTO test VALUES ('ca-20')

-- Viewing the order of id for test table
SELECT * FROM test ORDER BY 1

-- Inserting Values in test table
INSERT INTO test2 VALUES ('ca-01')
INSERT INTO test2 VALUES ('ca-02')
INSERT INTO test2 VALUES ('ca-03')
INSERT INTO test2 VALUES ('ca-04')
INSERT INTO test2 VALUES ('ca-05')
INSERT INTO test2 VALUES ('ca-10')
INSERT INTO test2 VALUES ('ca-20')

-- Viewing the order of id for test1 table
SELECT * FROM test2 ORDER BY 1

-- Creating a SQL statement to pad "0" for values less than 10
SELECT CASE 
	   WHEN SUBSTRING(id, 4, 5) < 10 THEN LEFT(id, 3) + '0' + SUBSTRING(id, 4, 5)
	   ELSE id
	   END AS id
FROM test
ORDER BY 1

-- Creating a test3 table to perform the transformation using SSIS
CREATE TABLE test3 (id CHAR(5))

-- Viewing the order of id for test3 table
SELECT * FROM test3 ORDER BY 1