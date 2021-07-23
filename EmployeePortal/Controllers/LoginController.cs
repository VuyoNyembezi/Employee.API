using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Cors;
using EmployeeDAL.Models;
using EmployeeDAL.Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BL.LoginBussinesLayer;
using BL.EmployeeBusinessLayer;

namespace EmployeePortal.Controllers
{
    [Route("api/login")]
    
    [ApiController]
    [EnableCors("CorsPolicy")]
    public class LoginController : ControllerBase
    {
        private IEmployeeBL _loginbl;
        public LoginController(IEmployeeBL loginBL)
        {
            _loginbl = loginBL;
        }

        [Route("InsertUser")]
        [HttpPost]
        public object RegisterUser(Register register)
        {
            return  _loginbl.CreateProfile(register);
        }

        [Route("Login")]
        [HttpPost]
        public Response LoginUser(Login login)
        {
            return _loginbl.Adminlogin(login);
        }

    }
}
