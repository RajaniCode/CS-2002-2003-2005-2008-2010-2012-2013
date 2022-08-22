using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;
public partial class StoredProcedures
{
    [Microsoft.SqlServer.Server.SqlProcedure]
    public static void GetOrdersCustomers(SqlChars DestinationCountry)
    {
        using (SqlConnection con = new SqlConnection("context connection = true"))
		{
			con.Open();
            SqlCommand cmd = new SqlCommand("SELECT Orders.OrderID, Customers.CustomerID, Orders.FreightCharges, Customers.CustCountry FROM Orders, Customers WHERE Orders.CustomerID = Customers.CustomerID AND Customers.CustCountry = @DestinationCountry", con);
			cmd.Parameters.AddWithValue("@DestinationCountry", DestinationCountry);
			SqlContext.Pipe.ExecuteAndSend(cmd);
            con.Close();
        }
    }
} 


