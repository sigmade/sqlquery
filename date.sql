-- функции работы с датой и временем

-- показать текущую дату и время
SELECT GETDATE(), SYSDATETIME()

-- показать часть даты
SELECT YEAR(GETDATE()), MONTH(GETDATE()), DAY(GETDATE())
SELECT DATEPART(YEAR,GETDATE()),DATEPART(MONTH,GETDATE()),DATEPART(DAY,GETDATE()),
       DATEPART(HOUR,GETDATE()),DATEPART(MINUTE,GETDATE())
	   
-- найти все продажи книг, сделанные на 13 сентября 1994 года
SELECT *
FROM sales
WHERE ord_date = '13-09-1994'

SELECT *
FROM sales
WHERE ord_date = '09.13.1994'

-- 1 установить параметры сессии 
SET DATEFORMAT dmy

-- 2 способ - использовать универсальный формат даты

SELECT *
FROM sales
WHERE ord_date = '19940913'  -- работает!

SELECT *
FROM sales
WHERE ord_date = '1994-09-13'  -- не работает

--3 использование функции DATEFROMPARTS()
SELECT *
FROM sales
WHERE ord_date = DATEFROMPARTS(1994,9,13)	   

