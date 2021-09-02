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
        Task<Users> AdminPasswordReset(Users login);
        Task<Users> ForgotPassword(Users User_Forgotten_Password);
        Task<IEnumerable<UsersModel>> GetUsers();
        Task<IEnumerable<UsersModel>> Get_User_By_Id(int Id);
        Task<Users> RemoveUser(Users objRemove);
        Task<IEnumerable<DepartmentModel>> GetDepartments();
        Task<IEnumerable<CityModel>> GetCities();
        Task<IEnumerable<RolesModel>> GetRoles();
        Task<Users> ChangeRole(Users users);


        Task<Users> Passkey(Users forgotpass);

    }
}
