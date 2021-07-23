using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeDAL.Models
{
    public partial class Admins
    {
        public int Id { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string AdminName { get; set; }
        public string City { get; set; }
        public string Department { get; set; }
    }
}
