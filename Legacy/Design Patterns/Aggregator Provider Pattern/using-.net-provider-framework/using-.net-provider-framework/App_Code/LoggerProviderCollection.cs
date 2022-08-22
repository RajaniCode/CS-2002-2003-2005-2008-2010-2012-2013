using System;
using System.Configuration.Provider;

namespace Logger
{
    public class LoggerBaseCollection : ProviderCollection
    {
        public override void Add(ProviderBase provider)
        {
            if (provider == null)
                throw new ArgumentNullException("The provider parameter cannot be null.");

            if (!(provider is LogProviderBase))
                throw new ArgumentException("The provider parameter must be of type LoggerBase.");

            base.Add(provider);
        }

        new public LogProviderBase this[string name]
        {
            get { return (LogProviderBase)base[name]; }
        }

        public void CopyTo(LogProviderBase[] array, int index)
        {
            base.CopyTo(array, index);
        }
    }
}
