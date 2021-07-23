using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using EmployeeDAL.Models;
using System.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.Data.SqlClient;
using EmployeeDAL.Admin;
namespace BL.EmployeeBusinessLayer
{
    public class EmployeeBL : IEmployeeBL
    {
        TestingContext _db = new TestingContext();

        private readonly string connectionstring = "Server=(localdb)\\mssqllocaldb;Database=Testing;Trusted_Connection=True;";
     
        public async Task<Object> GetById(int EmployeeID)
        {
            TestingContext db = new TestingContext();
            var employees = (from e in db.Employees
                             join g in db.Genders
                             on e.FkGenderId equals g.GenderId
                             join n in db.Nationalities
                             on e.FkNationId equals n.NationId
                             where e.EmployeeId == EmployeeID
                             select (new
                             {
                                 EmployeeID = e.EmployeeId,
                                 FirstName = e.FirstName,
                                 Surname = e.Surname,
                                 DateOfBirth = e.DateOfBirth,
                                 GenderType = g.GenderType,
                                 NationalityGroup = n.NationalityGroup
                             }));
            return await employees.ToListAsync();
        }
        public async Task<IEnumerable<Object>> GetEmployees()
        {
            TestingContext db = new TestingContext();
            
                var employees = (from e in db.Employees
                                 join g in db.Genders
                                 on e.FkGenderId equals g.GenderId
                                 join n in db.Nationalities
                                 on e.FkNationId equals n.NationId

                                 select new
                                 {
                                     EmployeeID = e.EmployeeId,
                                     FirstName = e.FirstName,
                                     Surname = e.Surname,
                                     DateOfBirth = e.DateOfBirth,
                                     GenderType = g.GenderType,
                                     NationalityGroup = n.NationalityGroup
                                 });
            return await employees.ToListAsync();
        }
        public async Task<Employee> UpdateEmployee(Employee employee)
        {
            if (employee != null)
            {

                using (var sqlConnection = new SqlConnection(connectionstring))
                {
                    await sqlConnection.OpenAsync();
                    var parameters = new DynamicParameters();
                    parameters.Add("@EmployeeID", employee.EmployeeId);
                    parameters.Add("@FirstName", employee.FirstName);
                    parameters.Add("@Surname", employee.Surname);

                    await sqlConnection.ExecuteAsync("UpdateEmployee", parameters, commandType: CommandType.StoredProcedure);
                }
                return employee;
            }
            return null;
        }
        public async Task<Employee> TermianteEmployee(Employee employee)
        {
            if (employee != null)
            {
                using (var sqlConnection = new SqlConnection(connectionstring))
                {
                    await sqlConnection.OpenAsync();
                    var parameters = new DynamicParameters();
                    parameters.Add("@EmployeeID", employee.EmployeeId);

                   await sqlConnection.ExecuteAsync("DeleteEmployee", parameters, commandType: CommandType.StoredProcedure);
                   
                }
            }
            return null;
        }
        public async Task<Employee> InsertEmployee(Employee employee)
        {
            if (employee != null)
            {
                using (var sqlConnection = new SqlConnection(connectionstring))
                {
                    await sqlConnection.OpenAsync();
                    var parameters = new DynamicParameters();

                    parameters.Add("@FirstName", employee.FirstName);
                    parameters.Add("@Surname", employee.Surname);
                    parameters.Add("@DateOfBirth", employee.DateOfBirth);
                    parameters.Add("@GenderID", employee.FkGenderId);
                    parameters.Add("@NationID", employee.FkNationId);

                    await sqlConnection.ExecuteAsync("InsertEmployee", parameters, commandType: CommandType.StoredProcedure);
                    return employee;
                }
            }
            return null;
        }


        //Login for Admins and General HR team
        public object CreateProfile(Register register)
        {

            try
            {
                Admins _admins = new Admins();
                if (_admins.Id == 0)
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
            catch (Exception)
            {
                throw;
            }
            return new Response { Status = "Error", Message = "Invalid Data" };
        }

        public Response Adminlogin(Login login)
        {
            var log = _db.Admin.Where(x => x.Email.Equals(login.Email) &&
            x.Password.Equals(login.Password)).FirstOrDefault();

            if (log == null)
            {
                return new Response { Status = "Invalid", Message = "Invalid User." };
            }
            else
            {
                return new Response { Status = "Success", Message = "Login" };
            }

        }
    }
}
