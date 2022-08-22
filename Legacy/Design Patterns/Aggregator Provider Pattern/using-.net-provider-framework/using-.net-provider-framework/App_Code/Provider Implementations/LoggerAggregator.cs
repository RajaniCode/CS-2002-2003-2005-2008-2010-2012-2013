using System;
using System.Collections.Generic;
using System.Configuration;
using System.Web.Configuration;
using System.Configuration.Provider;

namespace Logger
{
    public class LoggerAggregator : LogProviderBase
    {
        #region Private Data

        IList<LogProviderBase> _loggerCollection = null;

        #endregion

        #region Properties

        IList<LogProviderBase> LoggerCollection
        {
            get { return _loggerCollection; }
            set { _loggerCollection = value; }
        }

        #endregion

        #region Constructors

        public LoggerAggregator()
        {
            _loggerCollection = new List<LogProviderBase>();
        }

        public LoggerAggregator(IList<LogProviderBase> loggerCollection)
        {
            _loggerCollection = loggerCollection;
        }

        #endregion

        #region Public Methods

        public void AddLogger(LogProviderBase loggerToAdd)
        {
            LoggerCollection.Add(loggerToAdd);
        }

        public void RemoveLogger(LogProviderBase loggerToRemove)
        {
            LoggerCollection.Remove(loggerToRemove);
        }

        public void RemoveLogger(int index)
        {
            LoggerCollection.RemoveAt(index);
        }

        #endregion

        public override void DoLog()
        {
            foreach (LogProviderBase logger in LoggerCollection)
                logger.DoLog();
        }

        public override void Initialize(string name, System.Collections.Specialized.NameValueCollection config)
        {
            if ((config == null) || (config.Count == 0))
                throw new ArgumentNullException("You must supply a valid configuration dictionary.");

            if (string.IsNullOrEmpty(config["description"]))
            {
                config.Remove("description");
                config.Add("description", "Put a localized description here.");
            }

            //Let ProviderBase perform the basic initialization
            base.Initialize(name, config);

            //Now populate all the provders from config file

            //Get the feature's configuration info
            LoggerConfiguration qc =
                (LoggerConfiguration)ConfigurationManager.GetSection("LogProvider");

            if (qc.DefaultProvider == null || qc.Providers == null || qc.Providers.Count < 1)
                throw new ProviderException("You must specify a valid default provider.");

            _loggerCollection = new List<LogProviderBase>();

            for (int i = 0; i < qc.Providers.Count; i++)
            {
                string poviderTypeInConfigFile = qc.Providers[i].Type;
                string poviderTypename = poviderTypeInConfigFile.Substring(0,poviderTypeInConfigFile.IndexOf(","));
                if (poviderTypename != this.GetType().FullName)
                {
                    LogProviderBase p = (LogProviderBase)ProvidersHelper.InstantiateProvider(qc.Providers[i], typeof(LogProviderBase));
                    _loggerCollection.Add(p);
                }
            
            }
        }
        
    }
    
}
