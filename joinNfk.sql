ALTER TABLE dbo.OtherTable
ADD CONSTRAINT FK_OtherTable_ParentTable
FOREIGN KEY(OrderId, CompanyId) REFERENCES dbo.ParentTable(OrderId, CompanyId)

SELECT P.full_name, W.date, W.hours
FROM Worktime AS W LEFT JOIN PersonData AS P
ON W.person_id = P.person_id

SELECT P.full_name, W.date, W.hours, L.local_name
FROM Worktime AS W 
LEFT JOIN PersonData AS P
ON W.person_id = P.person_id
LEFT JOIN Local AS L
ON W.local_id = L.local_id

SELECT P.Person_id, P.full_name, W.date, W.hours, L.local_name, Ps.position_name
FROM Worktime AS W 
LEFT JOIN PersonData AS P
ON W.person_id = P.person_id
LEFT JOIN Local AS L
ON W.local_id = L.local_id
LEFT JOIN Position AS Ps
ON W.position_id = Ps.position_id
WHERE P.person_id = 3 AND Ps.position_id = 3

SELECT SUM(W.hours)
FROM Worktime AS W 
LEFT JOIN PersonData AS P
ON W.person_id = P.person_id
LEFT JOIN Local AS L
ON W.local_id = L.local_id
LEFT JOIN Position AS Ps
ON W.position_id = Ps.position_id
WHERE P.person_id = 3 AND Ps.position_id = 3