select database();
use kearneyjm;
 
drop table if exists DEPENDENT;

CREATE table DEPENDENT(
	Essn INT,
    Dependent_name VARCHAR(20),
    Sex CHAR(6),
    Bdate DATE,
    Relationship CHAR(10) NOT NULL,
    PRIMARY KEY (Essn, Dependent_name)
);

desc DEPENDENT;