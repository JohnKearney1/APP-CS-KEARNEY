-- CS 3430-101 - DR. TINGHAO FENG
-- JOHN KEARNEY - INCLASS ASSIGNMENT 8 (2/26/25)
SELECT DATABASE();
use Kearneyjm;

-- drop table if exists prerequisite;
-- drop table if exists grade_report;
-- drop table if exists section;
drop table if exists course;
drop table if exists instructor;

CREATE TABLE instructor(
      instructor_no INT PRIMARY KEY,
      instructor_name CHAR(20),
      phone CHAR(10)
);

CREATE TABLE course(
      course_no INT PRIMARY KEY,
      course_number CHAR(6),
      course_name CHAR(50),
      credit_hours INT,
      instructor_no INT,
      FOREIGN KEY (instructor_no) REFERENCES instructor (instructor_no)
);

INSERT INTO instructor VALUES
      (1, 'Tom', '1111111111'), 
      (2, 'Jerry', '2222222222'), 
      (3, 'Mickey', '3333333333');

INSERT INTO course VALUES
      (1, 'CS3430', 'Database', 3, 1), 
      (2, 'CS4755', 'Machine Learning', 3, 1), 
      (3, 'CS1440', 'Java', 3, 2);


-- T1: Construct a query to retrieve instructors (print the name) who are NOT teaching a course.
SELECT instructor_name
FROM instructor
WHERE instructor_no NOT IN (SELECT instructor_no FROM course);

-- T1-2: JOIN two tables.
SELECT instructor_name, course_name
FROM instructor JOIN course
ON instructor.instructor_no = course.instructor_no;

-- T2: JOIN two tables with a nested query using `IN (NOT IN)`.
SELECT instructor_name, course_name
FROM instructor JOIN course
ON instructor.instructor_no = course.instructor_no
WHERE instructor.instructor_no IN (SELECT instructor_no FROM course WHERE course_name = 'Database');

-- T3: How do we retrieve table_schema that contains more than 20 tables? Use a nested Query in the FROM clause.
SELECT table_schema, COUNT(table_name) AS num_tables
FROM information_schema.tables GROUP BY table_schema
HAVING num_tables > 20;
