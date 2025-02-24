-- CS 3430-101 - DR. TINGHAO FENG
-- JOHN KEARNEY - INCLASS ASSIGNMENT 7 (2/24/25)
SELECT DATABASE();
use Kearneyjm;

drop table if exists t1;
drop table if exists t2;

-- The below code is provided in the slides. Use it to answer questions below 
CREATE TABLE t1(
    id INT PRIMARY KEY,
    NAME CHAR(1),
    STATUS CHAR(1)
);

CREATE TABLE t2(
    id INT PRIMARY KEY,
    mobile CHAR(5)
);

INSERT INTO t1 VALUES
    (1, 'a', '1'),
    (2, 'b', '1'),
    (3, 'c', '1'),
    (4, 'd', '1'),
    (5, 'e', '1'),
    (6, 'f', '0'),
    (7, 'g', '0'),
    (8, 'h', '0'),
    (9, 'i', '0'),
    (10, 'j', '0');
    
INSERT INTO t2 VALUES
    (1,'12345'),
    (2,'23456'),
    (3,'34567'),
    (16,'67890'),
    (17,'78901'); 

-- TODO: Compare the results of these statements. Are they the same? 
SELECT * FROM t1 INNER JOIN t2 ON t1.id = t2.id AND t1.status = '1';
SELECT * FROM t1 INNER JOIN t2 ON t1.id = t2.id WHERE t1.status = '1';
-- These two statements produce the same result. The first statement uses an ON clause to join, then filter results.
-- The WHERE clause, however, filters as it preforms the join operation. Either way, the result is the same in this case. 

-- Compare the results of these statements. Are they the same? 
SELECT * FROM t1 LEFT JOIN t2 ON t1.id = t2.id AND t1.status = '1' AND t2.id<3;
SELECT * FROM t1 LEFT JOIN t2 ON t1.id = t2.id WHERE t1.status = '1' AND t2.id<3;
-- The results are not the same: the WHERE clause is filtering the results of the join to only include rows where t1.status = '1' and t2.id < 3.
-- However, the AND operation on ln 48 produces a variety of null values in id and mobile, and doesn't filter id's in the same way.


-- Compare the results of these statements. Are they the same? 
SELECT * FROM t1 LEFT JOIN t2 ON t1.id = t2.id AND t2.id<3 WHERE t1.status = '1';
SELECT * FROM t1 LEFT JOIN t2 ON t1.id = t2.id AND t1.status = '1' WHERE t2.id<3;
-- These statements are not the same. The first statement's ON clause filters the results of the join, but leaves values where id < 3 (id 1 and 2 still exist in the resulting table, along with 3-5)
-- The second statement only produces a table with id's 1 & 2, plus their associated values. 

