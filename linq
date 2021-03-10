var userRole = _db.Users
                    .Where(u => u.Id == request.UserId)
                    .Join(_db.UserRoles,
                        u => u.Id,
                        ur => ur.UserId,
                        (u, ur) => new
                        {
                            UserRoleId = ur.RoleId
                        })
                    .Join(_db.Roles,
                        ur => ur.UserRoleId,
                        r => r.Id,
                        (ur, r) => new
                        {
                            RoleName = r.Name
                        }).FirstOrDefault().RoleName;
                        
var isAdmin = Roles.Admins.Contains(userRole); //bool

//////////////

var userRoleName = await (from user in _db.Users
                                    join userRole in _db.UserRoles on user.Id equals userRole.UserId
                                    join role in _db.Roles on userRole.RoleId equals role.Id
                                    where Roles.Admins.Contains(role.Name) && user.Id == request.UserId
                                    select new
                                    {
                                        roleName = role.Name
                                    }).AnyAsync();  // bool
 
                                  
