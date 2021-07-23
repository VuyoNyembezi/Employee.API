using BL.EmployeeBusinessLayer;
using EmployeeDAL.Admin;
using EmployeeDAL.Models;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EmployeePortal.Controllers
{
    [Route("api/Employee")]
    [ApiController]
    [EnableCors("CorsPolicy")]
    public class EmployeeController : ControllerBase
    {
        private IEmployeeBL _employeeBL;
        public EmployeeController(IEmployeeBL employeeBL)
        {
            _employeeBL = employeeBL;
        }

        [HttpGet]     
        public async Task<ActionResult<Object>> Get()
        {
            try
            {
                return Ok(await _employeeBL.GetEmployees());
            }
            catch (Exception)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, "Error retrieving data from database server");
            }
           
        }

        [HttpGet("{EmployeeID}")]
        public async Task<ActionResult<Object>> Get(int EmployeeID)
        {
            try
            {
                var result = await _employeeBL.GetById(EmployeeID);
                if (result == null)
                {
                    return NotFound();
                }
                return result;
            }
            catch (Exception)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, "Error retrieving data from the database");
            }
           
        }

        [HttpPut]    
        public async Task<ActionResult<Employee>> UpdateEmployee(int employeeID,Employee employee)
        {
            try
            {
               var result = await _employeeBL.UpdateEmployee(employee);

                if (result != null)
                {
                    if(employeeID != employee.EmployeeId)
                    {
                        return StatusCode(StatusCodes.Status404NotFound, $"No record to update with an Id={employeeID} was found");
                    }
                    else if (employeeID == employee.EmployeeId)
                    {
                        return StatusCode(StatusCodes.Status200OK, $"record with Id ={employeeID} details Updated");
                    }
                    return result;

                }
                return null;
            }
            catch (Exception)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, "Error Accessing data from the database");
            }
           
        }

        [HttpDelete]
        public async Task<ActionResult<Employee>> TerminateEmployee(int EmployeeID,Employee employee)
        {
            try
            {
                var result = await _employeeBL.TermianteEmployee(employee);

                if (result != null)
                {
                    if (EmployeeID != employee.EmployeeId)
                    {
                        return StatusCode(StatusCodes.Status404NotFound, $"No record To Terminate Found with EmployeeID={EmployeeID}");
                    }
                    else if (EmployeeID ==employee.EmployeeId)
                    {
                        return StatusCode(StatusCodes.Status200OK, $"record with EmployeeID= {EmployeeID} was Successfully Terminated");
                    }
                    return result;
                }
                return null;
            }
            catch (Exception)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, "Erro Accessing the Database ");
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
                    return result;
                }
                return null;
            }
            catch (Exception)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, "Error no new record saved check input and try again or contact support");
            }
            
        }

        
    }
}
