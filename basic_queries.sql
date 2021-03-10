DROP TABLE student;

CREATE TABLE student (
    student_id INT AUTO_INCREMENT, 
    name VARCHAR(20),
    major VARCHAR(20) DEFAULT 'undecided',
    PRIMARY KEY(student_id)
); 

SELECT * 
FROM student;

INSERT INTO student (name, major) VALUES('Jack', 'Biology');
INSERT INTO student (name, major) VALUES('Kate', 'Sociology');
INSERT INTO student (name, major) VALUES('Claire', 'Chemistry');
INSERT INTO student (name, major) VALUES('Jack', 'Biology');
INSERT INTO student (name, major) VALUES('Mike', 'Computer Science');

SELECT name
FROM student;

SELECT name, major
FROM student;

SELECT student.name, student.major
FROM student
ORDER BY name; --alphabetical order

SELECT student.name, student.major
FROM student
ORDER BY name DESC; --descending alphabetical order

SELECT *
FROM student
ORDER BY student_id ASC; --ascending student id number

SELECT *
FROM student
ORDER by major, student_id;

SELECT *
FROM student
ORDER by major, student_id DESC;

SELECT *
FROM student
ORDER BY student_id DESC
LIMIT 2;

SELECT name, major
FROM student
WHERE major = 'Chemistry' OR name = 'Kate';


-- < , > , <= , >= , = , <> , AND, OR

SELECT name, major
FROM student
WHERE major <> 'Chemistry' ; -- not equal to

SELECT *
FROM student
WHERE name in ('Claire', 'Kate', 'Mike');

SELECT *
FROM student
WHERE major IN ('Biology', 'Chemistry') AND student_id > 2;


