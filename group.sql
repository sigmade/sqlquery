-- группирование
SELECT [type], AVG(price) AS [Средняя],MIN(price) AS [Минимальная], MAX(price)  AS [Максимальная]
FROM  titles
GROUP BY type

-- В какой категории больше всего товаров

SELECT ProductID, ProductName, CategoryID
FROM   Products
ORDER BY CategoryID

-- группирование по CategoryID
SELECT CategoryID, COUNT(*)
FROM   Products
GROUP BY CategoryID
ORDER BY COUNT(*) DESC

SELECT CategoryID  --, COUNT(*)
FROM   Products
GROUP BY CategoryID
ORDER BY COUNT(*) DESC OFFSET 0 ROWS FETCH FIRST 1 ROW ONLY;

-- —колько заказов было оформлено в каждый город?

SELECT TOP (3) WITH TIES ShipCity, COUNT(*)
FROM Orders
GROUP BY ShipCity
ORDER BY COUNT(*) DESC

-- группирование по вычисленной колонке

-- сколько заказов было сделано в каждом году
SELECT OrderID, OrderDate, YEAR(OrderDate) AS Год 
FROM Orders

SELECT YEAR(OrderDate) AS Год,COUNT(*) AS Kol
FROM Orders
GROUP BY YEAR(OrderDate)
ORDER BY Год

-- Группировка по нескольким колонкам

-- Сколько заказов было продано в каждую страну
SELECT ShipCountry,COUNT(*)
FROM Orders
GROUP BY ShipCountry
ORDER BY ShipCountry

-- Сколько заказов было продано в каждую страну в каждый год
SELECT ShipCountry,YEAR(OrderDate) AS Год, COUNT(*) As Kol
FROM Orders
GROUP BY ShipCountry, YEAR(OrderDate)
ORDER BY ShipCountry, Год

-- какие товары принесли выручку больше 10000

-- показать выручку от товара №1
SELECT SUM(UnitPrice*Quantity*(1-Discount)) AS GrandTotal
FROM   [Order Details]
WHERE ProductID = 1

-- какие выручку принес каждый товар
SELECT ProductID, SUM(UnitPrice*Quantity*(1-Discount)) AS GrandTotal
FROM   [Order Details]
GROUP BY ProductID

-- какие товары принесли выручку больше 10000
SELECT ProductID, SUM(UnitPrice*Quantity*(1-Discount)) AS GrandTotal
FROM   [Order Details]
GROUP BY ProductID
HAVING SUM(UnitPrice*Quantity*(1-Discount)) > 10000

-- какие товары принесли выручку больше 10000 (для товаров 1-20)
SELECT ProductID, SUM(UnitPrice*Quantity*(1-Discount)) AS GrandTotal
FROM   [Order Details]
WHERE  ProductID BETWEEN 1 AND 20
GROUP BY ProductID
HAVING SUM(UnitPrice*Quantity*(1-Discount)) > 10000

-- В каких категориях максимальная цена товара превышает 50?
SELECT CategoryID, ProductName,UnitPrice 
FROM Products
ORDER BY CategoryID


SELECT CategoryID, MAX(UnitPrice) AS MaxPrice
FROM   Products
GROUP BY CategoryID
HAVING MAX(UnitPrice) > 50


-- решение без показа макс цены
SELECT DISTINCT CategoryID
FROM   Products
WHERE  UnitPrice > 50