using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EmployeeDAL.Models;
using EmployeeDAL.Admin;

namespace BL.EmployeeBusinessLayer
{
    public interface IEmployeeBL
    {
        Task<Object> GetById(int EmployeeID);
        Task<IEnumerable<Object>> GetEmployees();
        Task<Employee> UpdateEmployee(Employee employee);
        Task<Employee> TermianteEmployee(Employee employee);
        Task<Employee> InsertEmployee(Employee employee);

        //Login 
        // object CreateProfile(Register register);
        Task<int> CreateProfile(Register register);
        Task<UserModel> Adminlogin(Login login);
    }
}
