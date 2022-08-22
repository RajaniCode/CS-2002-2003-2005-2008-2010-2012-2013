using System;
using System.Collections.Generic;

namespace Logger
{
    public class EmailLogger : LogProviderBase
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

        public override void DoLog()
        {
            System.Web.HttpContext.Current.Response.Write("<br>Test Email Log To " + EmailTo);
        }
        
    }
}
