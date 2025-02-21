select database();
use kearneyjm;

-- Ensure we start with no tables where we intend to work
drop table if exists STUDENTS;
drop table if exists STUDENTS1;
drop table if exists PARTS;

-- Create two tables, PARTS and STUDENTS
create table PARTS (
	id INT AUTO_INCREMENT,
	part CHAR(8),
    primary key (id)
);
create table STUDENTS (
    id INT AUTO_INCREMENT,
    name CHAR(10) NOT NULL,
    cell CHAR(10),
    part INT,
    FOREIGN KEY (part) REFERENCES PARTS (id),
    PRIMARY KEY (id)
);

-- Insert Data into PARTS and STUDENTS
INSERT INTO PARTS (part) VALUES 
	('Soprano'),
	('Alto'),
	('Tenor'),
	('Bass'); 
    
INSERT INTO STUDENTS (name, cell) VALUES 
	('Tom', 1112223333),
	('Jerry', 8884447777),
	('Mickey', 2225556666),
	('Minnie', 6663332222),
	('Goofy', 7776669999);
    
-- Method 1 
-- create table STUDENTS1 (
--     id INT AUTO_INCREMENT,
--     name CHAR(10) NOT NULL,
--     cell CHAR(10),
--     part INT,
--     FOREIGN KEY (part) REFERENCES PARTS (id),
--     PRIMARY KEY (id)
-- );
-- INSERT INTO STUDENTS1 SELECT * FROM STUDENTS;

-- Method 2 
CREATE TABLE STUDENTS1 AS SELECT * FROM STUDENTS;

desc PARTS;
desc STUDENTS;
desc STUDENTS1;