using System;
using System.Collections.Generic;

namespace Logger
{
    public interface ILogProvider
    {
        void DoLog();
    }

    public class EmailLogger : ILogProvider
    {

        #region Private Data

        string _emailTo, _emailFrom, _smptServer, _smtpUser, _smptpPass;

        int _smptpPort = 0;

        bool _smtpRequireSsl = false;

        #endregion

        #region Properties

        public int SmptpPort
        {
            get { return _smptpPort; }
            set { _smptpPort = value; }
        }

        public bool SmtpRequireSsl
        {
            get { return _smtpRequireSsl; }
            set { _smtpRequireSsl = value; }
        }

        public string SmptpPass
        {
            get { return _smptpPass; }
            set { _smptpPass = value; }
        }

        public string SmtpUser
        {
            get { return _smtpUser; }
            set { _smtpUser = value; }
        }
        public string SmptServer
        {
            get { return _smptServer; }
            set { _smptServer = value; }
        }

        public string EmailFrom
        {
            get { return _emailFrom; }
            set { _emailFrom = value; }
        }

        public string EmailTo
        {
            get { return _emailTo; }
            set { _emailTo = value; }
        }

        #endregion

        #region ILogProvider Members

        public void DoLog()
        {
            Console.WriteLine("Hello from Email Log");
        }

        #endregion
    }

    public class TextFileLogger : ILogProvider
    {
        #region Private Data

        string _connectionString = null;

        #endregion

        #region Properties

        public string ConnectionString
        {
            get { return _connectionString; }
            set { _connectionString = value; }
        }

        #endregion

        #region ILogProvider Members

        public void DoLog()
        {
            Console.WriteLine("Hello from Text Log");
        }

        #endregion
    }

    public class DatabaseLogger : ILogProvider
    {
        #region Private Data

        string _connectionString = null;

        #endregion

        #region Properties

        public string ConnectionString
        {
            get { return _connectionString; }
            set { _connectionString = value; }
        }

        #endregion

        #region ILogProvider Members

        public void DoLog()
        {
            Console.WriteLine("Hello from Database Log");
        }

        #endregion
    }

    public class LoggerAggregator : ILogProvider
    {
        #region Private Data

        IList<ILogProvider> _loggerCollection = null;

        #endregion

        #region Properties

        IList<ILogProvider> LoggerCollection
        {
            get { return _loggerCollection; }
            set { _loggerCollection = value; }
        }

        #endregion

        #region Constructors

        public LoggerAggregator()
        {
            _loggerCollection = new List<ILogProvider>();
        }

        public LoggerAggregator(IList<ILogProvider> loggerCollection)
        {
            _loggerCollection = loggerCollection;
        }

        #endregion

        #region Public Methods

        public void AddLogger(ILogProvider loggerToAdd)
        {
            LoggerCollection.Add(loggerToAdd);
        }

        public void RemoveLogger(ILogProvider loggerToRemove)
        {
            LoggerCollection.Remove(loggerToRemove);
        }

        public void RemoveLogger(int index)
        {
            LoggerCollection.RemoveAt(index);
        }

        #endregion

        #region ILogProvider Members

        public void DoLog()
        {
            foreach (ILogProvider logger in LoggerCollection)
                logger.DoLog();
        }

        #endregion
    }
    
}
