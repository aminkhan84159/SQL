USE EmployeeDb;

CREATE TABLE Emp (
ID INT PRIMARY KEY NOT NULL IDENTITY,
Emp_Id INT NOT NULL,
Emp_Name VARCHAR(200) NOT NULL,
Emp_Salary INT NOT NULL,
Emp_Dept INT NOT NULL)

INSERT INTO  Emp VALUES 
(1,'Jack',100000,1),
(2,'John',75000,1),
(3,'Bob',60000,2),
(4,'Alice',70000,2),
(5,'Ethan',80000,2),
(6,'Tommy',70000,1),
(7,'Jerry',70000,3),
(8,'William',90000,3),
(9,'Peter',75000,3),
(10,'Steve',80000,4),
(11,'Wanda',60000,4),
(12,'Hughei',50000,4),
(13,'Frenchei',55000,5),
(14,'MM',50000,5),
(15,'Homelander',85000,6),
(16,'Tony',85000,6),
(17,'Bruce',85000,7),
(18,'Natasha',65000,7),
(19,'Maive',80000,8),
(20,'Anny',60000,8)

UPDATE Emp
SET Emp_Name = 'Buthcer' WHERE Emp_Name LIKE 'William'
SELECT 
	Emp_Name Name,
	Emp_Salary Salary
FROM
	Emp
ORDER BY 
	Emp_Salary DESC
OFFSET 1 ROW
FETCH NEXT 1 ROW ONLY


SELECT TOP 1 WITH TIES
	Emp_Name Name,
	Emp_Salary Salary
FROM
	Emp
WHERE
	Emp_Salary < (
SELECT TOP 1
	Emp_Salary Salary
FROM
	Emp
WHERE
	Emp_Salary < (SELECT MAX(Emp_Salary) FROM Emp)
ORDER BY
	Emp_Salary DESC )
ORDER BY 
	Emp_Salary DESC



SELECT * FROM Emp;

SELECT
	Emp_Name Name,
	Emp_Salary Salary
FROM
	Emp e1
WHERE 
	3-1 = (SELECT 
			COUNT(DISTINCT Emp_Salary)
		FROM
			Emp e2
		WHERE
		e2.Emp_Salary > e1.Emp_Salary)




