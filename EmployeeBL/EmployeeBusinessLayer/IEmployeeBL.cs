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
        Task<IEnumerable<EmployeeModel>> GetEmployees();
        Task<IEnumerable<EmployeeModel>> GetEmployee(int EmployeeID);
        Task<Employee> UpdateEmployee(Employee employee);
        Task<Employee> TermianteEmployee(Employee employee);
        Task<Employee> InsertEmployee(Employee employee);

        Task<IEnumerable<GenderModel>> GetGender();
        Task<IEnumerable<NationalityModel>> GetNationality();
    }
}
