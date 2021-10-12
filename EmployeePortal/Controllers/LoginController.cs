using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Cors;
using EmployeeDAL.Models;
using EmployeeDAL.Admin;
using BL.Logging;
using System;
using System.Threading.Tasks;
using BL.UserBussinessLayer;
using BL.TokenServices;
using Microsoft.AspNetCore.Authorization;

namespace EmployeePortal.Controllers
{
    [Route("api/login")]

    [ApiController]
    [EnableCors("CorsPolicy")]
    public class LoginController : ControllerBase
    {
        private IUserBL _loginbl;
        private ILogsManager _logger;
        private readonly IToken _tokenService;
        public LoginController(IUserBL loginBL, ILogsManager logger, IToken tokenService)
        {
            _loginbl = loginBL;
            _logger = logger;
            _tokenService = tokenService;
        }

        [Route("InsertUser")]
        [HttpPost]
        [Authorize()]
        public async Task<Response> RegisterUser(Register register)
        {
            var returnobj = new Response
            {
                ReturnId = 0,
                Status = "Failed",
                Message = "sign up processs failed"
            };
            try
            {
                if (register != null)
                {
                    _logger.Infor($"new user Added to the Sytem administration Rights name : {register.AdminName }, Email : { register.Email}");
                    var result = await _loginbl.CreateProfile(register);
                    if (result >= 1)
                    {
                        returnobj.ReturnId = result;
                        returnobj.Status = "Success";
                        returnobj.Message = "user added successful";
                    }
                    else if (result == -2)
                    {
                        returnobj.ReturnId = result;
                        returnobj.Status = "Failed";
                        returnobj.Message = "email already used successful";
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
                var results = await _loginbl.Adminlogin(login);
                if (results != null)
                {
                    var token = _tokenService.GenerateJwtToken(login.Email);
                    if (token != null)
                    {
                        _logger.Infor($"Admin/User with email = {login.Email} Accessed the Sytem");
                        returnobj.Status = "Success";
                        returnobj.Message = "Log in successfully";
                        returnobj.Role = results.RoleID;
                        returnobj.Token = token;
                    }

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
        [Authorize()]
        public async Task<ActionResult<Response>> ResetPasword(Users passwordreset)
        {
            try
            {
                var result = await _loginbl.AdminPasswordReset(passwordreset);
                if (result != null)
                {
                    if (passwordreset.Email != null)
                    {
                        StatusCode(StatusCodes.Status200OK, $"record with Id = {passwordreset.Email} password Updated");
                    }
                    _logger.Infor($"User's passsword with Email = {passwordreset.Email} is reseted ");
                    return new Response { Status = "Success", Message = "Password reset successful" };
                }
                return new Response { Status = "Failed", Message = "process failed please check  input" };
            }
            catch (Exception ex)
            {
                _logger.Error(ex.Message);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error Accessing data from the database");
            }
        }
        [Route("Forgottenpassword")]
        [HttpPut]
        public async Task<ActionResult<Response>> ForgortPassword(Users newpassword)
        {
            try
            {
                var result = await _loginbl.ForgotPassword(newpassword);
                if (result != null)
                {
                    _logger.Infor($"User's passsword with Email = {newpassword.Email}  Changed ");
                    return new Response { Status = "Success", Message = "Password successfully changed" };
                }
                return new Response { Status = "Failed", Message = "Process failed please Chack your input" };
            }
            catch (Exception ex)
            {
                _logger.Error(ex.Message);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error retrieving Data");
            }
        }

        [Route("UserResetPass")]
        [HttpPut]
        [Authorize()]
        public async Task<ActionResult<Response>> generateResetKey(Users forgot)
        {
            try
            {
                var result = await _loginbl.Passkey(forgot);
                if (result != null)
                {
                    _logger.Infor($"User's with Email = {forgot.Email} is reset key sent ");
                    return new Response { Status = "Success", Message = "reset link sent please check your email to get the reset key" };
                }
                return new Response { Status = "Failed", Message = "process failed please check input " };
            }
            catch (Exception ex)
            {
                _logger.Error(ex.Message);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error Retrieving data from the Database");
            }
        }

        [Route("ChangeRole")]
        [Authorize()]
        public async Task<ActionResult<Response>> ChangeRole(Users users)
        {
            try
            {
                var result = await _loginbl.ChangeRole(users);
                if (result != null)
                {
                    _logger.Infor($"User with ID = {users.Id} role is changed to {users.FkRoleId}");
                    return new Response { ReturnId = 1, Status = "Success", Message = "Role Changed successful" };
                }
                else
                    return new Response { ReturnId = 0, Status = "Failed", Message = "Changing role proccess failed" };
            }
            catch (Exception ex)
            {
                _logger.Error(ex.Message);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error Accessing data from the database");
            }
        }

        [HttpGet]
        [Route("Users")]
        public async Task<ActionResult> GetUsers()
        {
            try
            {
                return Ok(await _loginbl.GetUsers());
            }
            catch (Exception ex)
            {
                _logger.Error(ex.Message);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error retrieving data from the database");
            }
        }
        [HttpGet("Users/{Id}")]
        public async Task<ActionResult<Object>> GetUser(int Id)
        {
            try
            {
                var result = Ok(await _loginbl.Get_User_By_Id(Id));
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
        [Route("RemoveUser")]
        [HttpDelete]
        public async Task<ActionResult<Response>> RemoveUser(Users removeuser)
        {
            try
            {
                var result = await _loginbl.RemoveUser(removeuser);
                if (result != null)
                {
                    _logger.Infor($"User with Id = {removeuser.Id} is Deactivated ");
                    return new Response { Status = "Success", Message = "Account Deactivated successful" };
                }
                return new Response { Status = "Failed", Message = "process failed please check  input" };
            }
            catch (Exception ex)
            {
                _logger.Error(ex.Message);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error Accessing data from the database");
            }
        }

        //Populates the Drop down Controls of the Administartion Forms


        [Route("Roles")]
        [HttpGet]
        public async Task<ActionResult> GetRoles()
        {
            try
            {
                return Ok(await _loginbl.GetRoles());
            }
            catch (Exception EX)
            {
                _logger.Error(EX.Message);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error retrieving data from the database");
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
                return StatusCode(StatusCodes.Status500InternalServerError, "Error retrieving data from the database");
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
                return StatusCode(StatusCodes.Status500InternalServerError, "Error retrieving data from the database");
            }
        }
    }
}
