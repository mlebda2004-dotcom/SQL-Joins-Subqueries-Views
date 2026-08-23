# SQL Server Data Analysis Practice — Joins, Views & Reporting Queries

# 📌 Project Overview
A hands-on SQL Server lab covering two real-world style databases: a custom **ITI** academic database and Microsoft's **AdventureWorks2012** sample database. The project is split into two parts, each focused on a different set of SQL skills — from joins and subqueries to views, window functions, and string manipulation.

This lab demonstrates practical, day-to-day SQL querying skills used in real data analysis and reporting work.

# 🎯 Objective
The goal of this lab was to practice and demonstrate core T-SQL skills across two databases:
- Writing correct joins (INNER, LEFT, self-joins) to combine related tables
- Using aggregate functions and GROUP BY to summarize data
- Handling NULLs properly with ISNULL and COALESCE
- Building subqueries for filtering based on calculated values
- Using window functions (DENSE_RANK) for ranking logic
- Creating reusable views for common reporting needs
- Filtering with BETWEEN, LIKE, IN, and escape characters
- Formatting output strings with CONCAT_WS

# 📊 Databases Used
**ITI DB** (Part 1) — a custom academic database with tables for Student, Instructor, Department, Course, Topic, Stud_Course, and Ins_Course, modeling a training institute's students, instructors, and course enrollments.

**AdventureWorks2012** (Part 2) — Microsoft's official sample database simulating a manufacturing/sales company, using the Sales, Production, and HumanResources schemas.

# 🧩 Part 1 — ITI Database
This part focuses on joins, aggregation, subqueries, window functions, and views on the ITI academic dataset.

**Key tasks covered:**
- Counting students with a non-null age value
- Listing distinct instructor names
- Formatting student names safely with ISNULL, joined with their department
- Listing instructors with their department (including instructors with no department, via LEFT JOIN)
- Listing students with the courses they're enrolled in
- Counting courses per topic using GROUP BY
- Finding min/max instructor salary
- Finding instructors paid below the average salary (subquery)
- Finding the department of the lowest-paid instructor (subquery)
- Selecting the two lowest salaries using DENSE_RANK() as a window function
- Displaying instructor salary with a fallback "instructor bonus" label using COALESCE
- Calculating average instructor salary
- Self-joining the Student table to show each student with their supervisor's info
- Creating a view (`Students_Grade`) showing students and courses where their grade is above 50
- Creating a view (`MGR_TOPICS`) showing instructors and the topics they teach
- Creating a view (`INS_DEPARTMENT`) showing instructors in the 'SD' or 'Java' departments

```sql
-- Example: Instructors paid below the average salary
SELECT Ins_Name
FROM Instructor
WHERE Salary < (
    SELECT AVG(SALARY)
    FROM Instructor
)

-- Example: View for students with a passing grade
CREATE OR ALTER VIEW Students_Grade
AS
SELECT S.St_Fname + ' ' + S.St_Lname AS Full_Name, C.Crs_Name
FROM Student AS S
JOIN Stud_Course AS SC ON S.St_Id = SC.St_Id
JOIN Course AS C ON SC.Crs_Id = C.Crs_Id
WHERE SC.Grade > 50
```

Full script: [`part1_iti_queries.sql`](part1_iti_queries.sql)

# 🧩 Part 2 — AdventureWorks Database
This part focuses on date filtering, conditional filtering, string pattern matching, UPDATE statements, and string formatting on the AdventureWorks dataset.

**Key tasks covered:**
- Filtering sales orders by ship date range (BETWEEN)
- Filtering products by standard cost threshold
- Finding products with an unknown (NULL) weight
- Filtering products by a list of colors (IN)
- Pattern matching product names starting with "B" (LIKE)
- Updating a product description, then finding descriptions containing an underscore using an escape character
- Summing total order value grouped by order date
- Listing distinct employee hire dates
- Calculating the average of distinct list prices
- Formatting a custom price label using CONCAT_WS, filtered and sorted by list price

```sql
-- Example: Products with unknown weight
SELECT ProductID, Name
FROM Production.Product
WHERE Weight IS NULL

-- Example: Formatted price label using CONCAT_WS
SELECT CONCAT_WS(' ', 'THE', Name, 'is only', ListPrice) AS PRICE
FROM Production.Product
WHERE ListPrice BETWEEN 100 AND 120
ORDER BY ListPrice ASC
```

Full script: [`part2_adventureworks_queries.sql`](part2_adventureworks_queries.sql)

# 🛠️ Tools & Technologies
- Microsoft SQL Server (T-SQL)
- SQL Server Management Studio (SSMS)
- ITI custom academic database
- AdventureWorks2012 sample database

# 📂 Project Structure
```
sql-server-advanced-lab/
│
├── part1_iti_queries.sql              # All Part 1 queries and views (ITI DB)
├── part2_adventureworks_queries.sql   # All Part 2 queries (AdventureWorks DB)
└── README.md
```

# 🚀 Conclusion
This lab pulls together the core T-SQL toolkit needed for real analytical work — joins, subqueries, aggregation, window functions, views, and string formatting — applied across two different database structures. It's a compact but practical demonstration of writing correct, readable SQL for common business reporting scenarios.

---

Data Analyst | Transforming raw data into clear, actionable insights using Power BI, SQL, Excel, and Python.

📫 Connect with me on [www.linkedin.com/in/mahmoud-lebda728](#)
