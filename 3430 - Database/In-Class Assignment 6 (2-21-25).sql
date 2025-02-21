-- CS 3430-101 - DR. TINGHAO FENG
-- JOHN KEARNEY (02-21-2025)

DROP TABLE IF EXISTS REGISTRATION;

CREATE TABLE REGISTRATION (
	stu_name VARCHAR(100),
    course VARCHAR(10),
    grade INT
);

INSERT INTO REGISTRATION (stu_name, course, grade) VALUES
('Tom', 'CS3430', 85),
('Jerry', 'CS3430', 92),
('Tom', 'CS2440', 93),
('Mickey', 'CS2440', 89),
('Tom', 'CS2490', 95),
('Jerry', 'CS2490', 79),
('Mickey', 'CS2490', 72),
('Tom', 'CS3667', 83);

-- T1: Find how many students are on the table
SELECT COUNT(DISTINCT stu_name) AS num_students FROM REGISTRATION;

-- T2: Find the average grade for Tom.
SELECT AVG(grade) AS tom_avg_grade FROM REGISTRATION WHERE stu_name = 'Tom';

-- Average the grades for each student, and display average grades that are greater than 88, along with the associated stu_name.
SELECT stu_name, AVG(grade) AS avg_grade FROM REGISTRATION GROUP BY stu_name HAVING avg_grade > 88;