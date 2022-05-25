Use Northwind
Go

--1.      Create a view named “view_product_order_[your_last_name]”, list all products and total ordered quantity for that product.
CREATE VIEW view_product_order_Liao AS
SELECT p.ProductName, SUM(od.Quantity) Total
FROM Products p JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY p.ProductName

--2.      Create a stored procedure “sp_product_order_quantity_[your_last_name]” that accept product id as an input and total quantities of order as output parameter.
CREATE PROC sp_product_order_quantity_Liao
@ProductID int,
@TotalOrderQty int out
AS
BEGIN
	SELECT @totalOrderQty = SUM(od.Quantity)
	FROM [Order Details] od JOIN Products p ON od.ProductID = p.ProductID
	WHERE p.ProductID = @ProductID
END

BEGIN
DECLARE @OrderQ int
EXEC sp_product_order_quantity_Liao 1, @orderQ out
PRINT @OrderQ
END
--3.      Create a stored procedure “sp_product_order_city_[your_last_name]” that accept product name as an input and top 5 cities that ordered most that product combined with the total quantity of that product ordered from that city as output.
CREATE PROC sp_product_order_city_Liao
@ProductName VARCHAR(30)
AS
BEGIN
	SELECT TOP 5 o.ShipCity, SUM(s.Quantity) Total
	FROM (
			SELECT p.ProductID, od.OrderID, od.Quantity
			FROM Products p JOIN [Order Details] od ON p.ProductID = od.ProductID 
			WHERE p.ProductName = @ProductName
			) s
	JOIN Orders o ON s.OrderID = o.OrderID
	GROUP BY o.ShipCity
	ORDER BY SUM(s.Quantity)
END

--4.      Create 2 new tables “people_your_last_name” “city_your_last_name”. City table has two records: {Id:1, City: Seattle}, {Id:2, City: Green Bay}. People has three records: {id:1, Name: Aaron Rodgers, City: 2}, {id:2, Name: Russell Wilson, City:1}, {Id: 3, Name: Jody Nelson, City:2}. Remove city of Seattle. If there was anyone from Seattle, put them into a new city “Madison”. Create a view “Packers_your_name” lists all people from Green Bay. If any error occurred, no changes should be made to DB. (after test) Drop both tables and view.
CREATE TABLE people_Liao(ID INT, Name VARCHAR(30), CityCode INT)

CREATE TABLE city_Liao(ID INT, City VARCHAR(30))

INSERT INTO city_Liao VALUES(1, 'Seattle')
INSERT INTO city_Liao VALUES(2, 'Green Bay')

INSERT INTO people_Liao VALUES(1, 'Aaron Rodgers', 2)
INSERT INTO people_Liao VALUES(2, 'Russell Wilson', 1)
INSERT INTO people_Liao VALUES(3, 'Jody Nelson', 2)

DELETE FROM city_Liao WHERE City = 'Seattle'
INSERT INTO city_Liao VALUES(1, 'Madison')

CREATE VIEW Packers_KaiyuLiao AS
SELECT pe.Name
FROM people_Liao pe JOIN city_Liao ci ON pe.CityCode = ci.ID
WHERE ci.City = 'Green Bay'

DROP TABLE people_Liao
DROP TABLE city_Liao
DROP VIEW Packers_KaiyuLiao

--5.       Create a stored procedure “sp_birthday_employees_[you_last_name]” that creates a new table “birthday_employees_your_last_name” and fill it with all employees that have a birthday on Feb. (Make a screen shot) drop the table. Employee table should not be affected.
CREATE PROC sp_birthday_employees_Liao 
AS 
BEGIN
    CREATE TABLE birthday_employees_Liao ( Name VARCHAR(40), BirthDate DATETIME)
	INSERT INTO birthday_employees_Liao
	SELECT FirstName + ' ' + LastName, BirthDate
	FROM Employees
	WHERE MONTH(BirthDate) = 2
END

DROP TABLE birthday_employees_Liao
DROP PROC sp_birthday_employees_Liao

--6.      How do you make sure two tables have the same data?
--     UNION