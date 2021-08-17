using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using EmployeeDAL.Admin;
using EmployeeDAL.Models;
namespace BL.UserBussinessLayer
{
    public interface IUserBL
    {
      
        Task<int> CreateProfile(Register register);
        Task<UserModel> Adminlogin(Login login);
        Task<Users> PasswordReset(Users login);

        Task<IEnumerable<DepartmentModel>> GetDepartments();
        Task<IEnumerable<CityModel>> GetCities();
        Task<IEnumerable<RolesModel>> GetRoles();
    }
}
