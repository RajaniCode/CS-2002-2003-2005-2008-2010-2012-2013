//------------------------------------------------------------------------------
// <autogenerated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.42
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </autogenerated>
//------------------------------------------------------------------------------

namespace SequentialWorkFlowConditions {
    
    
    public partial class Settings : System.Configuration.ApplicationSettingsBase {
        
        private static Settings m_DefaultInstance;
        
        private static object m_SyncObject = new object();
        
        public static Settings DefaultInstance {
            get {
                if ((Settings.m_DefaultInstance == null)) {
                    System.Threading.Monitor.Enter(Settings.m_SyncObject);
                    if ((Settings.m_DefaultInstance == null)) {
                        try {
                            Settings.m_DefaultInstance = new Settings();
                        }
                        finally {
                            System.Threading.Monitor.Exit(Settings.m_SyncObject);
                        }
                    }
                }
                return Settings.m_DefaultInstance;
            }
        }       
    }
}
