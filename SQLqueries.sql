create database college;
use college;

CREATE TABLE student(
id INT PRIMARY KEY,
name VARCHAR(50),
age INT NOT NULL
);

INSERT INTO student VALUES(1,'sanket',26);
INSERT INTO student VALUES(2,'ankita',22);
INSERT INTO student(id,name,age) VALUES(3,'kishan',26),(4,'shikha',24);
SELECT * FROM student;
DROP TABLE student;

CREATE DATABASE IF NOT EXISTS college;
DROP TABLE IF EXISTS company;

CREATE TABLE teacher(
id INT,
name VARCHAR(50),
age INT NOT NULL CHECK(age>=18),
PRIMARY KEY (id,name)
);

INSERT INTO teacher(id,name,age) VALUES(1,'Sanket',18);
DROP TABLE teacher;

CREATE TABLE employee(
id INT,
salary INT DEFAULT 25000
);

INSERT INTO employee (id) VALUES(1);
SELECT * FROM employee;

CREATE TABLE monitors(
id INT,
age INT,
city varchar(50),
CONSTRAINT age_check CHECK (age>=18 AND city="DELHI") 
);

INSERT INTO monitors(id,age,city) VALUES (2,'19','DELHI');

CREATE TABLE student(
rollno INT PRIMARY KEY,
name VARCHAR(50),
marks INT NOT NULL,
grade VARCHAR(1),
city VARCHAR(20)
);

INSERT INTO student
(rollno,name,marks,grade,city)
VALUES
(101,"anil",78,"C","Pune"),
(102,"bhumika",93,"A","Mumbai"),
(103,"chetan",85,"B","Mumbai"),
(104,"dhruv",96,"A","Delhi"),
(105,"emanuel",12,"F","Delhi"),
(106,"farah",82,"B","Delhi");

SELECT * FROM student;
SELECT city FROM student;
SELECT DISTINCT city FROM student;
SELECT * FROM student WHERE marks > 80;
SELECT * FROM student WHERE city = "Mumbai";
SELECT * FROM student WHERE marks > 90 AND city = "Mumbai";
SELECT * FROM student WHERE marks BETWEEN 80 AND 90;
SELECT * FROM student WHERE city IN ("Delhi","Mumbai","Gurgaon");
SELECT * FROM student WHERE city NOT IN ("Delhi","Mumbai");
SELECT * FROM student WHERE marks > 75 LIMIT 3;
SELECT * FROM student ORDER BY marks DESC LIMIT 3;
SELECT COUNT(marks) FROM student;
SELECT MAX(marks) FROM student;
SELECT MIN(marks) FROM student;
SELECT AVG(marks) FROM student;
SELECT SUM(marks) FROM student;
SELECT city FROM student GROUP BY city;
SELECT city , COUNT(rollno) FROM student GROUP BY city ;
SELECT city , name, COUNT(name) FROM student GROUP BY city , name;
SELECT city , AVG(marks) FROM student GROUP BY city ;
SELECT city , AVG(marks) FROM student GROUP BY city ORDER BY AVG(marks);
SELECT city , AVG(marks) FROM student GROUP BY city ORDER BY AVG(marks) DESC;
SELECT grade , COUNT(rollno) FROM student GROUP BY grade ORDER BY grade;
SELECT city , COUNT(rollno) FROM student GROUP BY city HAVING MAX(marks) > 90;
SELECT city FROM student WHERE grade = "A" GROUP BY city HAVING MAX(marks) >= 93 ORDER BY city DESC;

SET SQL_SAFE_UPDATES = 0;

UPDATE student SET grade = "O" WHERE grade = "A";
UPDATE student SET marks = marks + 1;

DELETE FROM student WHERE marks  < 20;

CREATE TABLE dept(
id INT PRIMARY KEY,
name VARCHAR(50)
);

INSERT INTO dept VALUES(101,"English"),(102,"IT");
UPDATE dept SET id=103 WHERE id=102;
SELECT * FROM dept;

CREATE TABLE teacher(
id INT PRIMARY KEY,
name VARCHAR(50),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES dept(id)
ON UPDATE CASCADE
ON DELETE CASCADE
);

INSERT INTO teacher VALUES(101,"Adam",101),(102,"Eve",102);
SELECT * FROM teacher;

SELECT * FROM student;

ALTER TABLE student ADD COLUMN age INT NOT NULL DEFAULT 19;
ALTER TABLE student MODIFY COLUMN age VARCHAR(2);
ALTER TABLE student CHANGE age stu_age INT;
ALTER TABLE student DROP COLUMN stu_age;
ALTER TABLE stu RENAME TO student;

INSERT INTO student (rollno,name,marks,stu_age) VALUES(107,"gargi",68,100);
TRUNCATE TABLE student;

CREATE TABLE student(
id INT PRIMARY KEY,
name VARCHAR(50)
);

INSERT INTO student (id,name) VALUES (101,"adam"), (102,"bob"), (103,"casey");

CREATE TABLE course(
id INT PRIMARY KEY,
course VARCHAR(50)
);

INSERT INTO course (id,course) VALUES (102,"english"), (105,"math"), (103,"science"), (107,"computer science");

SELECT * FROM student as s INNER JOIN course as c ON s.id = c.id;
SELECT * FROM student as a LEFT JOIN course as b ON a.id = b.id;
SELECT * FROM student as a LEFT JOIN course as b ON a.id = b.id UNION SELECT * FROM student as a RIGHT JOIN course as b ON a.id = b.id;
SELECT * FROM student as a LEFT JOIN course as b ON a.id = b.id WHERE b.id IS NULL;
SELECT * FROM student as a RIGHT JOIN course as b ON a.id = b.id WHERE a.id IS NULL;
SELECT * FROM student as a LEFT JOIN course as b ON a.id = b.id WHERE b.id IS NULL UNION SELECT * FROM student as a RIGHT JOIN course as b ON a.id = b.id WHERE a.id IS NULL; ;

CREATE TABLE employee(id INT PRIMARY KEY,name VARCHAR(50),manager_id INT);
INSERT INTO employee(id,name,manager_id) VALUES (101,"adam",103), (102,"bob",104), (103,"casey",NULL), (104,"donald",103);
SELECT * FROM employee;
SELECT a.name as manager_name , b.name FROM employee as a JOIN employee as b ON a.id = b.manager_id;
SELECT name FROM employee UNION SELECT name FROM employee; 

SELECT AVG(marks) FROM student;
SELECT name,marks FROM student WHERE marks > (SELECT AVG(marks) FROM student);

SELECT rollno FROM student WHERE rollno % 2 = 0;
SELECT name,rollno FROM student WHERE rollno IN (SELECT rollno FROM student WHERE rollno % 2 = 0);

SELECT * FROM student WHERE city = "Delhi";
SELECT MAX(marks) FROM (SELECT * FROM student WHERE city = "Delhi") AS temp;
SELECT MAX(marks) FROM student WHERE city="delhi";

SELECT (SELECT MAX(MARKS) FROM student ), name FROM student;

CREATE VIEW view1 AS SELECT rollno, name, marks FROM student;
SELECT * FROM view1 WHERE marks > 90;
DROP VIEW view1;


