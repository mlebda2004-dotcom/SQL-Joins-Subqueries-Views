
-- Part-2: Use AdventureWorks DB

-- Q 1 
SELECT SalesOrderID, ShipDate
FROM Sales.SalesOrderHeader
WHERE ShipDate BETWEEN '2002-07-28' AND '2014-07-29'

--Q 2 
SELECT ProductID,Name
FROM Production.Product
WHERE StandardCost < 110 

--Q 3 
SELECT ProductID,Name
FROM Production.Product
WHERE Weight IS NULL

--Q 4 
SELECT *
FROM Production.Product
WHERE Color IN ('Black','red','silver')

--Q 5
SELECT *
FROM Production.Product
WHERE NAME LIKE 'B%'

--Q 6 
UPDATE Production.ProductDescription
SET Description = 'Chromoly steel_High of defects'
WHERE ProductDescriptionID = 3

SELECT * FROM Production.ProductDescription
WHERE Description LIKE '%\_%' ESCAPE '\'


--Q 7
SELECT OrderDate,SUM(TOTALDUE) AS TOTAL_DUE
FROM Sales.SalesOrderHeader 
WHERE OrderDate BETWEEN '7/1/2001' AND '7/31/2014'
GROUP BY OrderDate

--Q 8 
SELECT DISTINCT HireDate , BusinessEntityID 
FROM HumanResources.Employee

--Q 9
SELECT AVG(distinct ListPrice) AS AVG_ListPrice
FROM Production.Product

--Q 10
SELECT CONCAT_WS(' ','THE',Name,'is only',ListPrice) AS PRICE
FROM Production.Product
WHERE ListPrice BETWEEN 100 AND 120 
ORDER BY ListPrice ASC