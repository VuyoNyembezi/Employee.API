using EmployeeDAL.Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL.TokenServices
{
    public interface IToken
    {
        string BuildToken(string key, string issuer, Login user);

        bool IsTokenValid(string key, string issuer, string token);
        string GenerateJwtToken(string email);
    }
}
