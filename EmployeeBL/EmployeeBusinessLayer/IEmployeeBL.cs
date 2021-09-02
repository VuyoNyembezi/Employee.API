using System.Collections.Generic;
using System.Threading.Tasks;
using EmployeeDAL.Models;


namespace BL.EmployeeBusinessLayer
{
    public interface IEmployeeBL
    {
        Task<IEnumerable<EmployeeModel>> GetEmployees();
        Task<IEnumerable<EmployeeModel>> GetEmployee(int EmployeeID);
        Task<Employee> UpdateEmployee(Employee employee);
        Task<Employee> TermianteEmployee(Employee employee);
        Task<Employee> InsertEmployee(Employee employee);
        Task<IEnumerable<EmployeeModel>> TerminatedEmployees();
        Task<IEnumerable<EmployeeModel>> GetTerminatedByID(int EmployeeID);

        Task<IEnumerable<GenderModel>> GetGender();
        Task<IEnumerable<NationalityModel>> GetNationality();
    }
}
