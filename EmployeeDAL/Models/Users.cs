using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeDAL.Models
{
    public partial class Users
    {
        public int Id { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string AdminName { get; set; }
        public int FkCityId { get; set; }
        public int FkDepartmentId { get; set; }

        public string VerificationCode { get; set; }
        public int FkRoleId { get; set; }

        public virtual Roles FkRole { get; set; }
        public virtual Departments FkDepartment { get; set; }
        public virtual City FkCity { get; set; }
    }
}
