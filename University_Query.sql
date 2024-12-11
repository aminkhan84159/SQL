CREATE DATABASE University;
USE University;

CREATE TABLE Department (
ID INT PRIMARY KEY IDENTITY,
Name VARCHAR(100));

CREATE TABLE Student (
ID INT PRIMARY KEY IDENTITY,
Name VARCHAR(100) NOT NULL,
Dept_ID INT FOREIGN KEY REFERENCES Department(ID),
Gender CHAR(1),
CONSTRAINT Check_Constraint CHECK(Gender IN('M','F')));


INSERT INTO Department VALUES
('English'),
('Mathematics'),
('Biology'),
('IT'),
('Physics'),
('Chemistry')

SELECT * FROM Department;

INSERT INTO Student VALUES
('Tony',1,'M'),
('Steve',1,'M'),
('Thor',1,'M'),
('Hela',1,'F'),
('Thanos',1,'M'),
('Bruce',2,'M'),
('Hawkeye',2,'M'),
('Nebula',2,'F'),
('Scott',2,'M'),
('Ultron',2,'M'),
('Wanda',3,'F'),
('Vision',3,'M'),
('Jane',3,'F'),
('Gamora',4,'F'),
('Natasha',4,'F'),
('Quill',4,'M'),
('Rhoodie',4,'M'),
('Bucky',5,'M'),
('Groot',5,'M'),
('Peter',5,'M'),
('Strange',5,'M'),
('Loki',6,'M'),
('Peggy',6,'F'),
('Marry',6,'F')

SELECT * FROM Student;

SELECT
	d.Name Name,
	COUNT(s.Dept_ID) Students
FROM
	Department d
JOIN Student s
	ON s.Dept_ID = D.ID
GROUP BY
	d.Name
HAVING
	COUNT(s.Dept_ID) > 4
ORDER BY
	'Students' DESC,
	d.Name;

SELECT
	Name,
	LEN(Name) Length
FROM
	Department
WHERE
	LEN(Name) = (SELECT MIN(LEN(Name)) FROM Department)
UNION
SELECT
	Name,
	LEN(Name)
FROM
	Department
WHERE
	LEN(Name) = (SELECT MAX(LEN(Name)) FROM Department)

