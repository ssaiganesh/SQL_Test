DROP TABLE student;

CREATE TABLE student (
    student_id INT AUTO_INCREMENT, 
    name VARCHAR(20),
    major VARCHAR(20) DEFAULT 'undecided',
    PRIMARY KEY(student_id)
); 

SELECT * FROM student;

INSERT INTO student (name) VALUES('Jack');
INSERT INTO student (name, major) VALUES('Kate', 'Sociology');
INSERT INTO student VALUES(3, 'Claire', 'Chemistry');
INSERT INTO student VALUES(4, 'Jack', 'Biology');
INSERT INTO student VALUES(5, 'Mike', 'Computer Science');

UPDATE student
SET major = 'Bio'
WHERE major = 'undecided';

UPDATE student
SET major = 'Bio'
WHERE major = 'Biology';


UPDATE student
SET major = 'Comp Sci'
WHERE major = 'Computer Science';

UPDATE student
SET major = 'Engineering'
WHERE student_id = 4;

UPDATE student
SET major = 'Biochemistry'
WHERE major = 'Bio' OR major = 'Chemistry';

UPDATE student
SET name= 'Tom', major = 'undecided'
WHERE student_id = 1;


UPDATE student
SET major = 'undecided'; --affects all 5 rows

DELETE FROM student
WHERE student_id = 5;

DELETE FROM student
WHERE name = 'Tom' and major = 'undecided';

