using System;
using System.Configuration;
using System.Configuration.Provider;
using System.Web.Configuration;

namespace Logger
{
    public class LoggerProviderManager
    {
        //Initialization related variables and logic
        private static bool isInitialized = false;
        private static Exception initializationException;

        private static object initializationLock = new object();

        static LoggerProviderManager()
        {
            Initialize();
        }

        private static void Initialize()
        {

            try
            {
                //Get the feature's configuration info
                LoggerConfiguration qc =
                    (LoggerConfiguration)ConfigurationManager.GetSection("LogProvider");

                if (qc.DefaultProvider == null || qc.Providers == null || qc.Providers.Count < 1)
                    throw new ProviderException("You must specify a valid default provider.");

                //Instantiate the providers
                providerCollection = new LoggerBaseCollection();
                //populate the provider collection
                ProvidersHelper.InstantiateProviders(qc.Providers, providerCollection, typeof(LogProviderBase));
                providerCollection.SetReadOnly();
                defaultProvider = providerCollection[qc.DefaultProvider];
                if (defaultProvider == null)
                {
                    throw new ConfigurationErrorsException(
                        "You must specify a default provider for the feature.",
                        qc.ElementInformation.Properties["defaultProvider"].Source,
                        qc.ElementInformation.Properties["defaultProvider"].LineNumber);
                }
            }
            catch (Exception ex)
            {
                initializationException = ex;
                isInitialized = true;
                throw ex;
            }

            isInitialized = true; //error-free initialization
        }

        //Public feature API
        private static LogProviderBase defaultProvider;
        private static LoggerBaseCollection providerCollection;

        public static LogProviderBase Provider
        {
            get
            {
                return defaultProvider;
            }
        }

        public static LoggerBaseCollection Providers
        {
            get
            {
                return providerCollection;
            }
        }

        //public static string DoWork()
        //{
        //    return Provider.DoWork();
        //}
    }
}
