using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Cors;
using EmployeeDAL.Models;
using EmployeeDAL.Admin;
using BL.Logging;
using System;

using System.Threading.Tasks;
using BL.UserBussinessLayer;

namespace EmployeePortal.Controllers
{
    [Route("api/login")]
    
    [ApiController]
    [EnableCors("CorsPolicy")]
    public class LoginController : ControllerBase
    {
        private IUserBL _loginbl;
        private ILogsManager _logger;
        public LoginController(IUserBL loginBL,ILogsManager logger)
        {
            _loginbl = loginBL;
            _logger = logger;
        }

        [Route("InsertUser")]
        [HttpPost]
        public async Task<Response> RegisterUser(Register register)
        {
            var returnobj = new Response
            {
                ReturnId = 0,
                Status="Failed",
                Message="sign up processs failed"
            };
            try
            {
                if (register != null)
                {
                    _logger.Infor($"new user Added to the Sytem administration name = {register.AdminName }, Email = { register.Email}");
                   var result = await _loginbl.CreateProfile(register);
                    if (result >= 1)
                    {
                        returnobj.ReturnId = result;
                        returnobj.Status = "Success";
                        returnobj.Message = "user added successful";
                    }
                    return returnobj;
                }               
                return returnobj;               
            }
            catch (Exception ex)
            {
                _logger.Error(ex.Message);
                return returnobj;
            }
        }
        [Route("Login")]
        [HttpPost]
        public async Task<Response> LoginUser(Login login)
        {
            var returnobj = new Response
            {
                ReturnId = 0,
                Status = "Invalid",
                Message = " Please check input",
                Role = null
            };
            try
            {
                if (login != null)
                {
                    _logger.Infor($"Admin with ID = {login.Email} Accessed the Sytem");
                    var results = await _loginbl.Adminlogin(login);
                    if (results != null)
                    {
                        returnobj.Status = "Success";
                        returnobj.Message = "Log in successfully";
                        returnobj.Role = results.RoleID;
                    }
                    return returnobj;
                }
                return returnobj;
            }
            catch (Exception ex)
            {
                _logger.Error(ex.Message);
                throw;
            }
        }

        [Route("Reset")]
        [HttpPut]
        public async Task<ActionResult<Response>> ResetPasword(Users passwordreset)
        {
            try
            {
                var result = await _loginbl.PasswordReset(passwordreset);
                if (result !=null)
                {
                    if (passwordreset.Email !=null)
                    {
                         StatusCode(StatusCodes.Status200OK, $"record with Id = {passwordreset.Email} password Updated");
                    }
                    _logger.Infor($"Employee Details of ID = {passwordreset.Email} were updated ");
                    return new Response{Status="Success",Message="Password reset successful"};
                }
                return new Response { Status = "Failed", Message = "process failed please check  input" };
            }
            catch (Exception ex)
            {
                _logger.Error(ex.Message);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error Accessing data from the database");
            }
        }

        [Route("Roles")]
        [HttpGet]
        public async Task<ActionResult> GetRoles()
        {
            try
            {
                return Ok(await _loginbl.GetRoles());
            }
            catch(Exception EX)
            {
                _logger.Error(EX.Message);
                return StatusCode(StatusCodes.Status500InternalServerError,"Error retrieving data from the database");
            }
        }

        [Route("Departments")]
        [HttpGet]
        public async Task<ActionResult> GetDepartment()
        {
            try
            {
                return Ok(await _loginbl.GetDepartments());
            }
            catch (Exception EX)
            {
                _logger.Error(EX.Message);
                return StatusCode(StatusCodes.Status500InternalServerError,"Error retrieving data from the database");
            }
        }

        [Route("Cities")]
        [HttpGet]
        public async Task<ActionResult> GetCity()
        {
            try
            {
                return Ok(await _loginbl.GetCities());
            }
            catch (Exception EX)
            {
                _logger.Error(EX.Message);
                return StatusCode(StatusCodes.Status500InternalServerError,"Error retrieving data from the database");
            }
        }
    }
}
