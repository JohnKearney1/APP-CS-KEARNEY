select database();
use kearneyjm;

drop table if exists student;
CREATE table student(
	stu_no INT PRIMARY KEY,
    stu_name VARCHAR(20) NOT NULL,
    course CHAR(10) DEFAULT 'CS3430'
);
INSERT INTO student VALUES(1, 'John', DEFAULT);
INSERT INTO student (stu_no, stu_name) VALUES (2, 'Jerry');
desc student;

drop table if exists exam;
CREATE table exam(
	exam_class CHAR(3),
    exam_date date,
    course CHAR(30),
    PRIMARY KEY (exam_class, exam_date)
);

