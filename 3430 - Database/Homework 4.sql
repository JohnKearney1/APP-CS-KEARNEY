SELECT DATABASE();
use kearneyjm;

-- STEP 1: INSERT TABLES

DROP TABLE IF EXISTS GRADE_REPORT;
DROP TABLE IF EXISTS STUDENT;
DROP TABLE IF EXISTS SECTION;
DROP TABLE IF EXISTS PREREQUISITE;
DROP TABLE IF EXISTS COURSE;

-- STUDENT Table
CREATE TABLE STUDENT (
 Student_number INT PRIMARY KEY, -- Primary Key
 Name VARCHAR(100) NOT NULL, -- Cannot be NULL
 Class VARCHAR(50),
 Major VARCHAR(50)
);

-- COURSE Table
CREATE TABLE COURSE (
 Course_number VARCHAR(100) PRIMARY KEY, -- Primary Key
 Course_name VARCHAR(100) UNIQUE, -- Unique constraint
 Credit_hours INT NOT NULL DEFAULT 4, -- Cannot be NULL, Default value = 4
 Department VARCHAR(100) NOT NULL -- Cannot be NULL
);

-- SECTION Table
CREATE TABLE SECTION (
 Section_identifier INT PRIMARY KEY, -- Primary Key
 Course_number VARCHAR(15) NOT NULL, -- Foreign Key reference to COURSE
 Semester VARCHAR(50) NOT NULL, -- Cannot be NULL
 Year INT NOT NULL, -- Cannot be NULL
 Instructor VARCHAR(100),
 FOREIGN KEY (Course_number) REFERENCES COURSE(Course_number)
);

-- GRADE_REPORT Table
CREATE TABLE GRADE_REPORT (
 Student_number INT NOT NULL, -- Foreign Key reference to STUDENT
 Section_identifier INT NOT NULL, -- Foreign Key reference to SECTION
 Grade CHAR(2),
 PRIMARY KEY (Student_number, Section_identifier), -- Composite Primary Key
 FOREIGN KEY (Student_number) REFERENCES STUDENT(Student_number),
 FOREIGN KEY (Section_identifier) REFERENCES SECTION(Section_identifier)
);

-- PREREQUISITE Table
CREATE TABLE PREREQUISITE (
 Course_number VARCHAR(15) NOT NULL, -- Foreign Key reference to COURSE
 Prerequisite_number VARCHAR(15) NOT NULL, -- Foreign Key reference to COURSE
 PRIMARY KEY (Course_number, Prerequisite_number), -- Composite Primary Key
 FOREIGN KEY (Course_number) REFERENCES COURSE(Course_number),
 FOREIGN KEY (Prerequisite_number) REFERENCES COURSE(Course_number)
);

-- BEGIN HOMEWORK 4 SPECIFIC WORK:

-- Insert the data into each table, then use desc to show the result
INSERT INTO STUDENT (Name, Student_number, Class, Major) VALUES
('Smith', 17, 1, 'CS'),
('Brown', 8, 2, 'CS');

INSERT INTO COURSE (Course_name, Course_number, Credit_hours, Department) VALUES
('Intro to Computer Science', 'CS1310', 4, 'CS'),
('Data Structures', 'CS3320', 4, 'CS'),
('Discrete Mathematics', 'MATH2410', 3, 'MATH'),
('Database', 'CS3380', 3, 'CS');

INSERT INTO SECTION (Section_identifier, Course_number, Semester, Year, Instructor) VALUES
(85, 'MATH2410', 'Fall', 07, 'King'),
(92, 'CS1310', 'Fall', 07, 'Anderson'),
(102, 'CS3320', 'Spring', 08, 'Knuth'),
(112, 'MATH2410', 'Fall', 08, 'Chang'),
(119, 'CS1310', 'Fall', 08, 'Anderson'),
(135, 'CS3380', 'Fall', 08, 'Stone');

INSERT INTO GRADE_REPORT (Student_number, Section_identifier, Grade) VALUES
(17, 112, 'B'),
(17, 119, 'C'),
(8, 85, 'A'),
(8, 92, 'A'),
(8, 102, 'B'),
(8, 135, 'A');

INSERT INTO PREREQUISITE (Course_number, Prerequisite_number) VALUES
('CS3380', 'CS3320'),
('CS3380', 'MATH2410'),
('CS3320', 'CS1310');

SELECT * FROM STUDENT;
SELECT * FROM COURSE;
SELECT * FROM SECTION;
SELECT * FROM GRADE_REPORT;
SELECT * FROM PREREQUISITE;

-- STEP 2: CHANGE THE CLASS OF BROWN TO 1
UPDATE STUDENT SET Class=1 WHERE Name='Brown';

-- STEP 3: INSERT A NEW COURSE
INSERT INTO COURSE (Course_name, Course_number, Credit_hours, Department) VALUES
('Knowledge Engineering', 'CS4390', 3, 'CS');

-- STEP 4: REMOVE ALL RECORDS OF SMITH 
DELETE from GRADE_REPORT WHERE Student_number=17;
DELETE from STUDENT WHERE Student_number=17;

SELECT * FROM STUDENT;
SELECT * FROM COURSE;
SELECT * FROM GRADE_REPORT;

-- STEP 5: INSERT A NEW STUDENT
INSERT INTO STUDENT (Name, Student_number, Class, Major) VALUES
('Johnson', 25, 1, 'Math');
SELECT * FROM STUDENT;

-- STEP 6: FABRICATE AT LEAST TWO OF JOHNSON'S GRADE RECORDS AND INSERT THEM INTO THE GRADE_REPORT TABLE
INSERT INTO GRADE_REPORT (Student_number, Section_identifier, Grade) VALUES
(25, 112, 'A'),
(25, 119, 'B');

SELECT * FROM GRADE_REPORT;
