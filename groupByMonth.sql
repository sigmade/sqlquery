SELECT
	Month(t.[date]) as [Μερÿφ],
	Sum(t.[hours]) as [Ρσμμΰ]
    FROM [dbo].[Worktime] as t
	WHERE [person_id] = 70
Group By Month(t.[date])