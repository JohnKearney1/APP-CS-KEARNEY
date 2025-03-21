-- CS 3430-101 - DR. TINGHAO FENG
-- JOHN KEARNEY - INCLASS ASSIGNMENT 9 (3/21/25)
SELECT DATABASE();
use Kearneyjm;

drop table if exists course_info;

CREATE TABLE course_info (
	course_number CHAR(8) PRIMARY KEY,
    course_name VARCHAR(30)
);

INSERT INTO course_info VALUES
    ('CS1440', 'CS I'),
    ('CS2440', 'CS II'),
    ('CS3430', 'Database'),
    ('CS3460', 'Data Structure'),
    ('CS4755', 'Machine Learning'),
    ('MAT1110', 'Calculus I'),
    ('MAT1120', 'Calculus II'),
    ('STT3850', 'Statistic');

DELIMITER //

CREATE FUNCTION fn_get_course_name(courseNum CHAR(8))
RETURNS VARCHAR(30)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE courseName VARCHAR(30);
    SELECT course_name INTO courseName FROM course_info WHERE course_number = courseNum;
    RETURN courseName;
END;
//

CREATE PROCEDURE sp_get_course_name(IN courseNum CHAR(8), OUT courseName VARCHAR(30))
BEGIN
    SELECT course_name INTO courseName FROM course_info WHERE course_number = courseNum;
END;
//

DELIMITER ;