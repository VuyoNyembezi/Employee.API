using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeDAL.Models
{
    public partial class City
    {
        public City()
        {
            User = new HashSet<Users>();
        }
        public int CityID { get; set; }
        public string CityName { get; set; }
        public virtual ICollection<Users> User { get; set; }
    }
}
