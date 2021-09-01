using System;
using log4net;
using log4net.Config;
using System.IO;
using System.Reflection;
using System.Xml;

namespace BL.Logging
{
   public class LogsManagers :ILogsManager
    {
        private readonly ILog _logger = LogManager.GetLogger(typeof(LogManager));
        public LogsManagers()
        {
            try
            {
                XmlDocument log4netConfig = new XmlDocument();
                using (var fs = File.OpenRead("log4net.config"))
                {
                    log4netConfig.Load(fs);
                    var repository = LogManager.CreateRepository(Assembly.GetEntryAssembly(), typeof(log4net.Repository.Hierarchy.Hierarchy));
                    XmlConfigurator.Configure(repository, log4netConfig["log4net"]);
                    _logger.Info("Log system initialized");
                }
            }
            catch (Exception ex)
            {
                _logger.Error("Error", ex);
            }
        }
        public void Infor(string message)
        {
            _logger.Info(message);
        }
        public void Error(string message)
        {
            _logger.Error(message);
        }
        public void Debug(string message)
        {
            _logger.Debug(message);
        }
        public void Warning(string message)
        {
            _logger.Warn(message);
        }
    }
}
