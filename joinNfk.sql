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


SELECT 
F.TeamName, 
S.TeamName, 
M.MatchDate,
M.FirstTeamScore,
M.SecondTeamScore
FROM 
Matches AS M 
INNER JOIN Teams AS F ON M.FirstTeamId = F.TeamId
INNER JOIN Teams AS S ON M.SecondTeamId = S.TeamId


SELECT        M.MatchId AS Id, M.MatchDate AS Date, F.TeamName AS FirstTeam, S.TeamName AS SecondTeam, M.FirstTeamScore, M.SecondTeamScore
FROM            dbo.Matches AS M INNER JOIN
                         dbo.Teams AS F ON M.FirstTeamId = F.TeamId INNER JOIN
                         dbo.Teams AS S ON M.SecondTeamId = S.TeamId
