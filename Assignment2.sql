Use AdventureWorks2019
Go

--1. Write a query that lists the country and province names from person. CountryRegion and person. StateProvince tables. Join them and produce a result set similar to the following.
--    Country                        Province
SELECT c.Name AS Country, s.Name AS Province
From person.CountryRegion c JOIN person.StateProvince s ON c.CountryRegionCode = s.CountryRegionCode
ORDER BY c.Name



--2. Write a query that lists the country and province names from person. CountryRegion and person. StateProvince tables and list the countries filter them by Germany and Canada.
--Join them and produce a result set similar to the following.
--    Country                        Province
SELECT c.Name AS Country, s.Name AS Province
From person.CountryRegion c JOIN person.StateProvince s ON c.CountryRegionCode = s.CountryRegionCode
WHERE c.Name IN ('Germany', 'Canada')
ORDER BY c.Name 



Use Northwind
GO


--3. List all Products that has been sold at least once in last 25 years.
SELECT DISTINCT p.ProductName
FROM Products p JOIN [Order Details] od ON p.ProductID = od.ProductID JOIN Orders o ON o.OrderID = od.OrderID 
WHERE YEAR(getdate()) - YEAR(o.OrderDate) <= 25


--4. List top 5 locations (Zip Code) where the products sold most in last 25 years.
SELECT TOP 5 o.ShipPostalCode, SUM(od.Quantity)
FROM Products p JOIN [Order Details] od ON p.ProductID = od.ProductID JOIN Orders o ON o.OrderID = od.OrderID
WHERE o.ShipPostalCode IS NOT NULL
GROUP BY o.ShipPostalCode
ORDER BY SUM(od.Quantity) DESC


--5. List all city names and number of customers in that city. 
SELECT c.City CityName, COUNT(c.CustomerID) TotalCustomer
FROM Customers c
GROUP BY c.City
ORDER BY TotalCustomer


--6. List city names which have more than 2 customers, and number of customers in that city
SELECT c.City CityName, COUNT(c.CustomerID) TotalCustomer
FROM Customers c
GROUP BY c.City
HAVING COUNT(c.CustomerID) > 2
ORDER BY TotalCustomer DESC


--7. Display the names of all customers  along with the  count of products they bought
SELECT c.CompanyName, SUM(od.Quantity) Total
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY c.CompanyName
ORDER BY Total DESC


--8. Display the customer ids who bought more than 100 Products with count of products.
SELECT c.CompanyName, SUM(od.Quantity) Total
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY c.CompanyName
HAVING SUM(od.Quantity) > 100
ORDER BY Total DESC


--9. List all of the possible ways that suppliers can ship their products. Display the results as below

--    Supplier Company Name                Shipping Company Name
    ---------------------------------            ----------------------------------
SELECT DISTINCT su.CompanyName SupplierCompany, sh.CompanyName ShippingCompany
FROM Suppliers su JOIN Products p ON p.SupplierID = su.SupplierID JOIN [Order Details] od ON od.ProductID = p.ProductID JOIN Orders o ON o.OrderID = od.OrderID JOIN Shippers sh ON sh.ShipperID = o.ShipVia  
ORDER BY su.CompanyName 

--10. Display the products order each day. Show Order date and Product Name.
SELECT o.OrderDate, p.ProductName
FROM Orders o JOIN [Order Details] od ON o.OrderID = od.OrderID JOIN Products p ON od.ProductID = p.ProductID
ORDER BY o.OrderDate


--11. Displays pairs of employees who have the same job title.
SELECT e1.FirstName + ' ' + e1.LastName Person1, e2.FirstName + ' ' + e2.LastName Person2, e1.Title
FROM Employees e1 JOIN Employees e2 ON e1.ReportsTo = e2.ReportsTo
WHERE e1.EmployeeID != e2.EmployeeID AND e1.Title = e2.Title


--12. Display all the Managers who have more than 2 employees reporting to them.
SELECT e2.EmployeeID, e2.FirstName +' '+ e2.LastName ManagerName, e2.Title
FROM Employees e1 JOIN Employees e2 ON e1.ReportsTo = e2.EmployeeID
GROUP BY e1.ReportsTo, e2.FirstName, e2.LastName, e2.EmployeeID, e2.Title
HAVING COUNT(e1.EmployeeID)>2


--13. Display the customers and suppliers by city. The results should have the following columns
--City
--Name
--Contact Name,
--Type (Customer or Supplier)
--All scenarios are based on Database NORTHWIND.
SELECT city, CompanyName, ContactName, 'Customer' AS 'Tpye' 
FROM Customers
UNION
SELECT city,  CompanyName, ContactName, 'Supplier' AS 'Tpye' 
FROM Suppliers

--14. List all cities that have both Employees and Customers.
SELECT DISTINCT e.City
FROM Employees e JOIN Customers c ON e.City = c.City

--15. List all cities that have Customers but no Employee.
--a.    
--Use
--sub-query
SELECT DISTINCT City
FROM Customers 
WHERE City NOT IN
(
SELECT City
FROM Employees)

--b.   
-- Do
--not use sub-query
SELECT DISTINCT c.City
FROM Customers c LEFT JOIN Employees e ON c.City = e.City
WHERE e.EmployeeID IS NULL

--16. List all products and their total order quantities throughout all orders.
SELECT p.ProductName, SUM(od.Quantity) Total
FROM Products p JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY Total 

--17. List all Customer Cities that have at least two customers.
--a. 
-- Use
--union
SELECT City
FROM Customers
GROUP BY City
HAVING COUNT(CustomerID) > 2
UNION
SELECT City
FROM Customers
GROUP BY City
HAVING COUNT(CustomerID) = 2

--b.     
-- Use
--sub-query and no union
SELECT City
FROM Customers 
GROUP BY City
HAVING COUNT(CustomerID)>1


--18. List all Customer Cities that have ordered at least two different kinds of products.
SELECT DISTINCT c.City
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID JOIN [Order Details] od ON od.OrderID = o.OrderID
GROUP BY c.City, od.ProductID
HAVING COUNT(od.ProductID) > 1


--19. List 5 most popular products, their average price, and the customer city that ordered most quantity of it.

 --Haven't solved this question


--20. List one city, if exists, that is the city from where the employee sold most orders (not the product quantity) is, and also the city of most total quantity of products ordered
--from. (tip: join  sub-query)

--Haven't solved this question



--21. How do you remove the duplicates record of a table?
-- Use DISTINCT
-- Use GROUP BY

