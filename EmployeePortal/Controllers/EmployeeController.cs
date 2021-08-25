using BL.EmployeeBusinessLayer;
using BL.Logging;
using EmployeeDAL.Models;
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
        public async Task<ActionResult<Object>> Get(int EmployeeID)
        {
            try
            {
                var result = Ok(await _employeeBL.GetEmployee(EmployeeID));
                if (result == null)
                {
                    _logger.Infor($"No records were found when of ID ={EmployeeID}");
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

        [HttpPut]    
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
        public async Task<ActionResult<Employee>> TerminateEmployee(Employee employee)
        {
            try
            {
                var result = await _employeeBL.TermianteEmployee(employee);
                if (result != null)
                {
                    _logger.Infor($"Employee with ID {employee.EmployeeId} is Terminated");
                    return StatusCode(StatusCodes.Status200OK, $"Employee with EmployeeID= {employee.EmployeeId} was Successfully Terminated");    
                }
                return null;
            }
            catch (Exception ex)
            {
                _logger.Error(ex.Message);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error Accessing the Database ");
            }        
        }

        [HttpPost]
        public async Task<ActionResult<Employee>> InsertEmployee(Employee employee)
        {
            try
            {
                var result = await _employeeBL.InsertEmployee(employee);
                if(result != null)
                {
                    _logger.Infor($"new record succeffully added  {employee.FirstName}  {employee.Surname}");
                    return StatusCode(StatusCodes.Status200OK, $"new record added {employee.FirstName}  {employee.Surname}");
                }              
                 return StatusCode(StatusCodes.Status400BadRequest, "no new record added please check input");
            }            
            catch (Exception ex)
            {
                _logger.Error(ex.Message);
                return StatusCode(StatusCodes.Status500InternalServerError, "Server Error, try again or contact support");
            }       
        }


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
