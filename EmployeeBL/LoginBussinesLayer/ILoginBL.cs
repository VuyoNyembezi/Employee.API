using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EmployeeDAL.Admin;
using EmployeeDAL.Models;
namespace BL.LoginBussinesLayer
{
    public interface ILoginBL
    {
        object CreateProfile(Register register);

        Response Adminlogin(Login login);
    }
}
