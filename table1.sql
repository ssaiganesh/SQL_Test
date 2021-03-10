/*
INT             -- Whole Numbers
DECIMAL(M,N)    -- Decimal Numbers - Exact value number of digits M - total, N - after decimal place 
VARCHAR(1)      -- String of text of length 1
BLOB            -- Binary Large Object, Stores Large Data
DATE            -- 'YYYY-MM-DD'
TIMESTAMP       -- 'YYYY-MM-DD HH:MM:SS' - used for recording
*/

CREATE TABLE student (
    student_id INT PRIMARY KEY, 
    name VARCHAR(20) NOT NULL,
    major VARCHAR(20) UNIQUE
    
); --creates table --PRIMARY KEY(student_id)

DESCRIBE student; --describes table

DROP TABLE student;  --deletes table

ALTER TABLE student ADD gpa DECIMAL(3,2); --adds gpa column with values of 3 digits and 2 of the digits after dp

ALTER TABLE student DROP COLUMN gpa;  --removes gpa column

SELECT * FROM student;

INSERT INTO student VALUES(1, 'Jack', 'Biology');
INSERT INTO student VALUES(2, 'Kate', 'Sociology');
--INSERT INTO student(student_id, name) VALUES(3, 'Claire'); --cannot insert the same primary key again
INSERT INTO student VALUES(3, 'Claire', 'Chemistry');
INSERT INTO student VALUES(4, 'JACK', 'Biology');
INSERT INTO student VALUES(5, 'Mike', 'Computer Science');