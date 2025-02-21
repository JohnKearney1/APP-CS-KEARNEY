select database();
use kearneyjm;

-- Drop table each time for a fresh run
drop table if exists GRADE;

-- Create the new table
create table GRADE (
	id INT AUTO_INCREMENT,
    student VARCHAR(15) NOT NULL,
    exam INT CHECK (exam >= 0),
    PRIMARY KEY (id)
);

-- Insert dummy data as per slides
INSERT INTO GRADE (student, exam) VALUES 
	('Tom', null),
	('Jerry', 53),
	('Mickey', 73),
	('Minnie', 98);
    
SELECT * FROM grade;

-- Add 5 points to exam for every student
UPDATE GRADE SET exam=exam+5;
SELECT * FROM grade;

-- Modify any exam higher than 100 down to 100
UPDATE GRADE SET exam=100 WHERE (exam > 100);
SELECT * FROM grade;

-- Modify any exam between 55 and 60 to 60
UPDATE GRADE SET exam=60 WHERE (exam <= 60 && exam >= 55);
SELECT * FROM grade;

-- Use DELETE FROM statement to empty the 'grade' table
DELETE FROM grade;

-- Insert a new record by providing null to id
INSERT into GRADE (id, student) VALUES (null, 'John Doe');
select * from grade;

-- Use TRUNCATE to empty the grade table
TRUNCATE TABLE grade;

-- insert a new record by providing null to the id
INSERT into GRADE (id, student) VALUES (null, 'Jane Doe');
select * from grade;