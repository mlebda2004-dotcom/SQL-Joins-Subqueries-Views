-- Part-1: Use ITI DB

--Q 1
SELECT COUNT(St_Age) AS NUM_STUDENT
FROM Student 

--Q 2
SELECT DISTINCT Ins_Name
FROM Instructor

--Q 3
SELECT S.St_Id    
, isnull(S.St_Fname + ' '+ s.St_Lname , 'Null')  as Full_name
, ISNULL(D.Dept_Name,'Null') AS Dept_Name
FROM Student AS S
JOIN Department AS D
ON S.Dept_Id= D.Dept_Id

--Q 4
SELECT I.Ins_Name , D.Dept_Name
FROM Instructor AS I
LEFT JOIN Department AS D 
ON I.Dept_Id = D.Dept_Id

--Q 5
SELECT (S.St_Fname+ ' '+S.St_Lname) AS FULL_NAME , C.Crs_Name
FROM Student AS S
JOIN STUD_Course AS SC
ON S.St_Id = SC.St_Id
JOIN Course AS C
ON SC.Crs_Id = C.Crs_Id

--Q 6
SELECT T.Top_Name , COUNT(C.Crs_Id) AS NUM_COURSES
FROM Course AS C
JOIN Topic AS T
ON T.Top_Id = C.Top_Id
GROUP BY T.Top_Name

--Q 7
SELECT MIN(Salary) AS MIN_SAL , MAX(Salary) AS MAX_SAL
FROM Instructor

--Q 8
SELECT Ins_Name
FROM Instructor 
WHERE Salary <(
SELECT AVG(SALARY)
FROM Instructor
) 

--Q 9 
SELECT D.Dept_Name 
FROM Department AS D
JOIN Instructor AS I
ON D.Dept_Id = i.Dept_Id
where i.Salary = (
SELECT MIN(Salary)
FROM Instructor
)

--Q 10 
SELECT * FROM (
SELECT * , DENSE_RANK()  OVER(ORDER BY SALARY ASC) AS MAX_SALARY
FROM Instructor
) AS FF
WHERE MAX_SALARY <=2

--Q 11
SELECT  Ins_Name , COALESCE(Salary, 'instructor bonus ') AS SALARY
FROM Instructor 

--Q 12 
SELECT AVG(SALARY) AS AVG_SALARY
FROM Instructor

--Q 13 
SELECT
S.St_Fname , Sup.*
FROM Student S
LEFT JOIN Student Sup
ON S.St_super = Sup.St_Id

--Q 14 
go
CREATE OR ALTER VIEW Students_Grade

AS 
SELECT S.St_Fname+' '+S.St_Lname as Full_Name , c.Crs_Name 
FROM Student AS S  
JOIN Stud_Course AS SC 
ON S.St_Id= SC.St_Id
JOIN Course AS C
ON SC.Crs_Id = C.Crs_Id
WHERE SC.Grade > 50

go

--Q 15
CREATE OR ALTER VIEW MGR_TOPICS
AS
SELECT I.Ins_Name , T.Top_Name
FROM Instructor AS I
JOIN Ins_Course AS IC
ON I.Ins_Id = I.Ins_Id
JOIN Course AS C
ON C.Crs_Id = IC.Crs_Id
JOIN Topic AS T
ON T.Top_Id = C.Top_Id

--Q 16 
go
CREATE OR ALTER VIEW INS_DEPARTMENT
AS
SELECT I.Ins_Name
FROM Instructor AS I
JOIN Department AS D
ON I.Dept_Id = D.Dept_Id
WHERE D.Dept_Name IN ('SD', 'Java')
