CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    birth_day DATE, 
    sex VARCHAR(1),
    salary INT,
    super_id INT,
    branch_id INT
);

CREATE TABLE branch (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(40),
    mgr_id INT, 
    mgr_start_date DATE, 
    FOREIGN KEY(mgr_id) REFERENCES employee (emp_id) ON DELETE SET NULL
);

ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

CREATE TABLE client(
    client_id INT PRIMARY KEY,
    client_name VARCHAR(40),
    branch_id INT,
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) on DELETE SET NULL
);

CREATE TABLE works_with(
    emp_id INT,
    client_id INT, 
    total_sales INT,
    PRIMARY KEY(emp_id, client_id),
    FOREIGN KEY(emp_id) REFERENCES employee(emp_id) on DELETE CASCADE, 
    FOREIGN KEY(client_id) REFERENCES client(client_id) on DELETE CASCADE
);

CREATE TABLE branch_supplier(
    branch_id INT,
    supplier_name VARCHAR(40),
    supply_type VARCHAR(40),
    PRIMARY KEY(branch_id, supplier_name),
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) on DELETE CASCADE
);

-- Corporate
INSERT INTO employee VALUES(100, 'DAVID', 'WALLACE', '1967-11-17', 'M', 250000, NULL, NULL);

INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');

UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;

INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '1961-05-11','F', 110000, 100, 1);

-- Scranton
INSERT INTO employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;

INSERT INTO employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

-- Stamford
INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);


-- BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms');

-- CLIENT
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

-- WORKS_WITH
INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);

-- FIND ALL EMPLOYEES
SELECT *
FROM employee;

-- FIND ALL CLIENTS
SELECT *
FROM client;

-- FIND ALL EMPLOYEES ORDERED BY SALARY
SELECT *
FROM employee
ORDER BY salary DESC;

-- FIND ALL EMPLOYEES ORDERED BY SEX THEN NAME
SELECT *
FROM employee
ORDER BY sex, first_name, last_name;

-- FIND THE FIRST 5 EMPLOYEES IN THE TABLE
SELECT *
FROM employee
LIMIT 5;

-- FIND THE FIRST AND LAST NAMES OF ALL EMPLOYEES
SELECT first_name, last_name
FROM employee;

-- FIND THE FORENAME AND SURNAMES OF ALL EMPLOYEES
SELECT first_name AS forename, last_name AS surname
FROM employee;

-- FIND OUT ALL THE DIFFERENT GENDERS
SELECT DISTINCT sex
FROM employee;

-- FIND OUT DIFFERENT BRANCH IDS
SELECT DISTINCT branch_id
FROM employee;

-- FIND THE NUMBER OF EMPLOYEES
SELECT COUNT(emp_id)
FROM employee;

-- FIND THE NUMBER OF FEMALE EMPLOYEES BORN AFTER 1970
SELECT COUNT(emp_id)
FROM employee
WHERE sex = 'F' AND birth_day > '1970-12-31';

-- FIND THE AVERAGE OF ALL MALE EMPLOYEES' SALARIES
SELECT AVG(salary)
FROM employee
WHERE sex = 'M';

-- FIND THE SUM OF ALL EMPLOYEES' SALARIES
SELECT SUM(salary)
FROM employee;

-- FIND OUT HOW MANY MALES AND FEMALES THERE ARE
SELECT COUNT(sex), sex
FROM employee
GROUP BY sex;

-- FIND THE TOTAL SALES OF EACH SALESMAN
SELECT SUM(total_sales), emp_id
FROM works_with
GROUP BY emp_id;

-- FIND THE TOTAL SALES FROM EACH CLIENT
SELECT SUM(total_sales), client_id
FROM works_with
GROUP BY client_id;

-- WILDCARDS
-- % = any # characters, _ = one character

-- FIND ANY CLIENT WHO ARE AN LLC
SELECT *
FROM client
WHERE client_name LIKE  '%LLC'; -- any characters can come before LLC but the name will end with LLC

-- FIND ANY BRANCH SUPPLIERS WHO ARE IN THE LABEL BUSINESS
SELECT *
FROM branch_supplier
WHERE supplier_name LIKE '%Label%';

-- FIND ANY EMPLOYEE BORN IN OCTOBER
SELECT *
FROM employee
WHERE birth_day LIKE '____-10-__'; -- remember to use LIKE and not equal sign or can be '____-10%';

-- FIND ANY CLIENTS WHO ARE SCHOOLS
SELECT *
FROM client
WHERE client_name LIKE '%school%';


-- FIND A LIST OF EMPLOYEE AND BRANCH NAMES
SELECT first_name AS Names
FROM employee
UNION
SELECT branch_name
FROM branch 
UNION
SELECT client_name
FROM client; -- UNION FOR SIMILAR DATATYPES AND SAME NUMBER OF COULUMNS FROM BOTH TABLES

-- FIND A LIST OF ALL CLIENTS AND BRANCH SUPPLIERS' NAMES
SELECT client_name AS Client_And_Branch, client.branch_id
FROM client
UNION
SELECT supplier_name, branch_supplier.branch_id
FROM branch_supplier;

-- FIND  LIST OF ALL MONEY SPENT OR EARNED BY THE COMPANY
SELECT salary
FROM employee
UNION
SELECT total_sales
FROM works_with;







