SELECT
	Month(t.[date]) as [�����],
	Sum(t.[hours]) as [�����]
    FROM [dbo].[Worktime] as t
	WHERE [person_id] = 70
Group By Month(t.[date])