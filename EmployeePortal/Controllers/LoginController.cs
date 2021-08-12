using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Cors;
using EmployeeDAL.Models;
using EmployeeDAL.Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using BL.EmployeeBusinessLayer;
using BL.Logging;
namespace EmployeePortal.Controllers
{
    [Route("api/login")]
    
    [ApiController]
    [EnableCors("CorsPolicy")]
    public class LoginController : ControllerBase
    {
        private IEmployeeBL _loginbl;
        private ILogsManager _logger;
        public LoginController(IEmployeeBL loginBL,ILogsManager logger)
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
                    if (result != null)
                    {
                        returnobj.ReturnId = 1;
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
                    if(results != null)
                    {
                        returnobj.Status = "Success";
                        returnobj.Message = "Log in successfully";
                        returnobj.Role = results.RoleID;
                    }
                    return returnobj;
                }
                return returnobj;
            }
            catch(Exception ex)
            {
                _logger.Error(ex.Message);
               throw;
            }
            }
            
    }
}
