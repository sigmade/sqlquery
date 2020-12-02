SELECT
	Month(t.[date]) as [Ìåñÿö],
	Sum(t.[hours]) as [Ñóììà]
    FROM [dbo].[Worktime] as t
	WHERE [person_id] = 70
Group By Month(t.[date])

//LINQ

var month = (from hours in Model.Worktimes
                 where hours.PersonId == Model.PersonId
                 group hours.Hours by new { hours.Date.Month } into g
                 select new
                 {
                     Months = g.Key.Month,
                     SummHourse = g.Sum()
                 }).ToList();
