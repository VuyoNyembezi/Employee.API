using BL.EmployeeBusinessLayer;
using BL.Logging;
using EmployeeDAL.Admin;
using EmployeeDAL.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;

namespace EmployeePortal.Controllers
{
    [Route("api/Employee")]
    [ApiController]
    [EnableCors("CorsPolicy")]
    public class EmployeeController : ControllerBase
    {
        private IEmployeeBL _employeeBL;
        private ILogsManager _logger;
        public EmployeeController(IEmployeeBL employeeBL,ILogsManager logger)
        {
            _employeeBL = employeeBL;
            _logger = logger;
        }
        [HttpGet]
       [Authorize()]

       //Returns the List of Active Employees
        public async Task<ActionResult<Object>> Get()
        {
            try
            {
                _logger.Infor("Employees data accessed");
                return Ok(await _employeeBL.GetEmployees());
            }
            catch (Exception ex)
            {
                _logger.Error(ex.Message);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error retrieving data from database server");
            }
        }
        [HttpGet("{EmployeeID}")]
        [Authorize()]
        public async Task<ActionResult<Object>> Get(int EmployeeID)
        {
            try
            {
                var result = Ok(await _employeeBL.GetEmployee(EmployeeID));
                if (result == null)
                {
                    _logger.Infor($"No records were found whith ID ={EmployeeID}");
                    return NotFound();
                }
                _logger.Infor($"Employee with ID ={EmployeeID}, Data was accessed");
                return result;
            }
            catch (Exception ex)
            {
                _logger.Error(ex.Message);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error retrieving data from the database");
            }
        }
        //Returns a list of Terminated Employees

        [Route("Terminated")]
        [HttpGet]
     
        [Authorize()]
        public async Task<ActionResult<Object>> GetTerminatedEmployees()
        {
            try
            {
                return Ok(await _employeeBL.TerminatedEmployees());
            }
            catch (Exception ex)
            {
                _logger.Error(ex.Message);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error retrieving Data from database server");
            }
        }
        [HttpGet("Terminated/{EmployeeID}")]
        [Authorize()]
        public async Task<ActionResult<Object>> GetTerminatedById(int EmployeeID)
        {
            try
            {
                var result = Ok(await _employeeBL.GetTerminatedByID(EmployeeID));
                if (result == null)
                {
                    return NotFound();
                }
                return result;
            }
            catch (Exception ex)
            {
                _logger.Error(ex.Message);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error retrieving data from the server");
            }
        }
        [HttpPut]
        [Authorize()]
        public async Task<ActionResult<Employee>> UpdateEmployee(Employee employee)
        {   
            try
            {
               var result = await _employeeBL.UpdateEmployee(employee);
                if (result != null)
                {
                    _logger.Infor($"Employee Details of ID = {employee.EmployeeId} were updated ");
                    return result;
                }
                return null;
            }
            catch (Exception ex)
            {
                _logger.Error(ex.Message);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error Accessing data from the database");
            }    
        }
        [HttpDelete]
        [Authorize()]
        public async Task<ActionResult<Response>> TerminateEmployee(Employee employee)
        {
            try
            {
                var result = await _employeeBL.TermianteEmployee(employee);
                if (result != null)
                {
                    _logger.Infor($"Employee with ID {employee.EmployeeId} is Terminated");
                    return new Response { Message = $"Employee with EmployeeID= {employee.EmployeeId} was Successfully Terminated" ,   ReturnId= 1,Status="Success"};    
                }
                return   new Response { Message = "Process failed", ReturnId = 0, Status = "Failed" }; ;
            }
            catch (Exception ex)
            {
                _logger.Error(ex.Message);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error Accessing the Database ");
            }        
        }
        [HttpPost]
        [Authorize()]
        public async Task<ActionResult<Response>> InsertEmployee(Employee employee)
        {
            try
            {
                var result = await _employeeBL.InsertEmployee(employee);
                if(result != null)
                {
                    _logger.Infor($"new record succeffully added  {employee.FirstName}  {employee.Surname}");
                    return new Response { ReturnId = 1,Message= "new employee succeffully added to the portal",Status ="Success"};
                }
                return   new Response { ReturnId = 0, Message = "perocess to add new employee failed please check input", Status = "Failed" };
            }            
            catch (Exception ex)
            {
                _logger.Error(ex.Message);
                return StatusCode(StatusCodes.Status500InternalServerError, "Server Error, try again or contact support");
            }       
        }



        ///Populates the drop down controls of the employee Form


        [Route("Gender")]
        [HttpGet]
        public async Task<ActionResult> GetGenders()
        {
            try
            {
                return Ok(await _employeeBL.GetGender());
            }
            catch (Exception EX)
            {
                _logger.Error(EX.Message);
                return StatusCode(StatusCodes.Status500InternalServerError,"Error retrieving data from the database");
            }
        }
        [Route("Nationality")]
        [HttpGet]
        public async Task<ActionResult> GetDepartment()
        {
            try
            {
                return Ok(await _employeeBL.GetNationality());
            }
            catch (Exception EX)
            {
                _logger.Error(EX.Message);
                return StatusCode(StatusCodes.Status500InternalServerError,"Error retrieving data from the database");
            }
        }
    }
}
