using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeDAL.Models
{
    public partial class Roles
    {
        public Roles()
        {
            User = new HashSet<Users>();
        }
        public int RoleId { get; set; }
        public string RoleName { get; set; }

        public virtual ICollection<Users> User { get; set; }
    }
}
