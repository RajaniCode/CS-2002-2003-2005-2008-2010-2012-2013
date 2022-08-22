using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Security;
using System.Security.Permissions;
using Microsoft.SqlServer.Server;
using FileUser;

namespace ImplementingCAS
{
    public class Class1
    {
        public static void GetEmployeeDetails(SqlString filename)
        {
            try
            {
                PermissionSet prms = new PermissionSet(PermissionState.None);

                // Ensure that only correct file is accessed through this method
                FileIOPermission ioPrm = new FileIOPermission(FileIOPermissionAccess.Read, @"C:\Personnames.txt");
                prms.AddPermission(ioPrm);

                // Permit access to SQL Server data
                SqlClientPermission sqlPrm = new SqlClientPermission(PermissionState.None);
                sqlPrm.Add("context connection=true", "", KeyRestrictionBehavior.AllowOnly);
                prms.AddPermission(sqlPrm);
                prms.PermitOnly();

                // Get the names from the text file as a string array
                string[] names = FileUser.Class1.ReadFile(filename.ToString());

                // Build SQL statement
                StringBuilder sb = new StringBuilder();
                sb.Append(@"SELECT * from Employees
                           WHERE FirstName IN (");

                // Concatenate array into single string for WHERE clause
                foreach (string name in names)
                {
                    sb.Append("'");
                    sb.Append(name);
                    sb.Append("', ");
                }
                sb.Remove(sb.Length - 2, 2);
                sb.Append(")");

                // Execute the SQL statement and get back a SqlResultSet
                using (SqlConnection cn = new SqlConnection("context connection=true"))
                {
                    cn.Open();
                    SqlCommand cmd = new SqlCommand(sb.ToString(), cn);
                    SqlDataReader dr = cmd.ExecuteReader();

                    // Send success message to SQL Server and return SqlDataReader 
                    SqlPipe pp = SqlContext.Pipe;
                    pp.Send(dr);
                    pp.Send("Command(s) completed successfully.");
                    cn.Close();
                }
            }
            catch (Exception e)
            {
                SqlPipe pp = SqlContext.Pipe;
                pp.Send(e.Message);
                pp.Send(e.StackTrace);
                pp.Send("Error executing assembly");
            }
        }
    }
}
