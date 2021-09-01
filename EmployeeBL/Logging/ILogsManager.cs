using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Reflection;
using System.IO;
using log4net;
using log4net.Config;


namespace BL.Logging
{
   public interface ILogsManager
    {
        void Infor(string message);
        void Error(string message);
        void Debug(string message);
        void Warning(string message);
    }
}


