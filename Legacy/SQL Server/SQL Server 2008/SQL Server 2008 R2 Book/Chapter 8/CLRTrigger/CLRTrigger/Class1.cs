using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using Microsoft.SqlServer.Server; 
namespace CLRTrigger
{
    public class Triggers
    {
        [Microsoft.SqlServer.Server.SqlTrigger(Name="GetLastRow", Target="Products", Event="FOR INSERT")]
        public static void GetLastRow()
        {            
            using (SqlConnection connection = new SqlConnection("context connection=true"))
            {
                connection.Open();
                SqlTriggerContext triggercontext = SqlContext.TriggerContext;
                SqlPipe sqlpipe = SqlContext.Pipe;
                SqlCommand insertcommand = new SqlCommand("SELECT * FROM inserted", connection);
                if (triggercontext.TriggerAction == TriggerAction.Insert)                          
                sqlpipe.ExecuteAndSend(insertcommand);
                connection.Close();
            }
        }
    }
}

