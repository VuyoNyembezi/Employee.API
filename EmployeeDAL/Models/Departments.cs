using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeDAL.Models
{
    public partial class Departments
    {

        public Departments()
        {
            User = new HashSet<Users>();
        }
        public int DepartmentID { get; set; }
        public string DepartmentName { get; set; }

        public virtual ICollection<Users> User { get; set; }
    }
}
