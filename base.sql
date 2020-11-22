-- Горизонтальная фильтрация 

-- Показать ФИО авторов
SELECT au_fname, au_lname
FROM authors

-- Алиасы
SELECT au_fname + ' ' + au_lname AS "Ф И О" 
FROM authors

SELECT au_fname + ' ' + au_lname AS [Ф И О]
FROM authors

SELECT au_fname + ' ' + au_lname AS ФИО
FROM authors

---
--Функции агрегации---
---
SELECT price
FROM titles

SELECT AVG(price),MIN(price), MAX(price), SUM(price)
FROM  titles

SELECT AVG(price),MIN(price), MAX(price), SUM(price)
FROM  titles
WHERE [type] = 'business'

-- вертикальная фильтрация

-- Показать книги, цена которых в диапазоне от 10 (не включая) до 15.
SELECT title_id, title, price
FROM   titles
WHERE  price > 10 AND price <= 15

SELECT title_id, title, price
FROM   titles
WHERE  price BETWEEN 10 AND 15 -- включает граничные условия

SELECT title_id, title, price
FROM   titles
WHERE  price >= 10 AND price <= 15 -- эквивалент BETWEEN

-- примеры встроенных символьных функций
SELECT title,
       LEN(title) AS [Длина названия],
	   LEFT(title,10),
	   REVERSE(Title)
FROM   titles


--особенности null

SELECT * FROM titles
WHERE  price = NULL  -- не правильно

SELECT * FROM titles
WHERE  price <> NULL -- не правильно

SELECT * FROM titles
WHERE  price IS NULL -- правильно !!!

SELECT * FROM titles
WHERE  price IS NOT NULL -- правильно !!!

SELECT * FROM titles
ORDER BY price  -- NULL - самое маленькое значение
SELECT title, notes, Title + '**** ' + ISNULL(Notes,' Нет примечания')
FROM titles

SELECT title, notes, Title + '**** ' + COALESCE(Notes,' Нет примечания')
FROM titles

SELECT title, notes,CONCAT (Title,'**** ',Notes)
FROM titles

-- примеры сортировок
SELECT CustomerID, ContactName,City
FROM  Customers
WHERE City IN ('London','Rio de Janeiro','Sao Paulo')
ORDER BY City DESC,ContactName

-- какой продавец оформил последний заказ в Париж?
SELECT TOP (1) WITH TIES EmployeeID --, OrderDate
FROM Orders
WHERE ShipCity = 'Paris'
ORDER BY OrderDate DESC

-- устранение дубликатов

-- ѕоказать страны, откуда наши клиенты
SELECT DISTINCT Country
FROM Customers

-- ѕоказать страны и города, откуда наши клиенты
SELECT DISTINCT Country, City
FROM Customers

SELECT Country, City, CustomerID -- CustomerID - колонка с уникальными значени¤ми
FROM Customers                   -- поэтому DISTINCR - бесполезен

-- пример на пор¤док выполнени¤
-- в каком ключевом поле можно использовать заголоки колонок
SELECT CONCAT(FirstName,' ',LastName) AS Фио
FROM Employees
--WHERE ‘ио LIKE 'Andrew%'
WHERE CONCAT(FirstName,' ',LastName) LIKE 'Andrew%'

SELECT FirstName +' ' +LastName AS Фио
FROM Employees
WHERE FirstName +' ' +LastName LIKE 'Andrew%'

SELECT FirstName +' ' +LastName AS Фио
FROM Employees
ORDER BY Фио

-- команды модификации данных
SELECT *
FROM authors

-- INSERT (добавление строк в таблицу)
INSERT INTO authors ([contract],[phone],[au_fname],[au_lname],[au_id],[city])
VALUES (0,'499 123-4567','Федор','Достоевский','111-22-7777','Москва');

-- UPDATE (изменение существующих строк)
UPDATE authors
SET [City] = 'Петербург',[contract] = 1
WHERE au_id = '111-22-7777'

-- DELETE (удаление строк)
DELETE FROM authors
WHERE au_id = '111-22-7777'

-- 2 формы функции COUNT

-- 1 форма 
SELECT COUNT(*)
FROM  titles

-- 2 форма
SELECT COUNT(price)
FROM  titles

-- применение агрегирования к вычисленной колонке 
SELECT OrderID, ProductID, UnitPrice, Quantity, Discount,UnitPrice*Quantity*(1-Discount) AS Total
FROM   [Order Details]
WHERE ProductID = 1

-- показать выручку от товара №1
SELECT SUM(UnitPrice*Quantity*(1-Discount)) AS GrandTotal
FROM   [Order Details]
WHERE ProductID = 1