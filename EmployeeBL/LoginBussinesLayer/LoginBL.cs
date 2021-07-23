using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EmployeeDAL.Models;
using EmployeeDAL.Admin;
namespace BL.LoginBussinesLayer
{
    public class LoginBL : ILoginBL
    {
        private readonly TestingContext _db;
        private readonly Admins _admins;
        public LoginBL (TestingContext db,Admins admins)
        {
            _db = db;
            _admins = admins;

        }
        public object CreateProfile(Register register)
        {

            try
            {
                if (_admins.Id ==0)
                {
                    _admins.AdminName = register.AdminName;
                    _admins.City = register.City;
                    _admins.Email = register.Email;
                    _admins.Password = register.Password;
                    _admins.Department = register.Department;

                    _db.Admin.Add(_admins);
                    _db.SaveChanges();

                    return new Response { Status = "Success", Message = "Record succesFully Saved." };
                }
            }
            catch(Exception)
            {
                throw;
            }
            return new Response { Status = "Error", Message = "Invalid Data" };
        }

        public Response Adminlogin(Login login)
        {
            var log = _db.Admin.Where(x => x.Email.Equals(login.Email) &&
            x.Password.Equals(login.Password)).FirstOrDefault();

            if (log==null)
            {
                return new Response { Status = "Invalid", Message = "Invalid User please details." };
            }
            else
            {
                return new Response { Status = "Success", Message = "Login" };
            }

        }



    }
}
