using System;
using System.Collections.Generic;
using System.Configuration.Provider;

namespace Logger
{
    public abstract class LogProviderBase: ProviderBase
    {
        public abstract void DoLog();
    }
}
