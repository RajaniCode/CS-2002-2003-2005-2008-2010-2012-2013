using System;
using System.Collections.Generic;
using System.Configuration.Provider;
using System.Configuration;

namespace Logger
{
    public class TextFileLogger : LogProviderBase
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

        public override void DoLog()
        {
            System.Web.HttpContext.Current.Response.Write("<br>Test Text Log To " + ConnectionString);
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

            //Perform feature-specific provider initialization here

            //Get the connection string
            string connectionStringName = config["connectionStringName"];
            if (String.IsNullOrEmpty(connectionStringName))
                throw new ProviderException("You must specify a connectionStringName attribute.");

            ConnectionStringsSection cs =
                (ConnectionStringsSection)ConfigurationManager.GetSection("connectionStrings");
            if (cs == null)
                throw new ProviderException("An error occurred retrieving the connection strings section.");

            if (cs.ConnectionStrings[connectionStringName] == null)
                throw new ProviderException("The connection string could not be found in the connection strings section.");
            else
                _connectionString = cs.ConnectionStrings[connectionStringName].ConnectionString;

            if (String.IsNullOrEmpty(_connectionString))
                throw new ProviderException("The connection string is invalid.");
            config.Remove("connectionStringName");

            //Check to see if unexpected attributes were set in configuration
            if (config.Count > 0)
            {
                string extraAttribute = config.GetKey(0);
                if (!String.IsNullOrEmpty(extraAttribute))
                    throw new ProviderException("The following unrecognized attribute was found in " + Name + "'s configuration: '" +
                                                extraAttribute + "'");
                else
                    throw new ProviderException("An unrecognized attribute was found in the provider's configuration.");
            }
        }
    }
}
