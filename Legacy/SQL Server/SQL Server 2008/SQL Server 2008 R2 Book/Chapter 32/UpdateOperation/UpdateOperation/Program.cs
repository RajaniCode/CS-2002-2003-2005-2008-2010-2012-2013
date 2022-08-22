using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace UpdateOperation
{
    class Program
    {
        static void Main(string[] args)
        {
            var dbInventory = new InventoryDataContext();            
            Customer cust = (from c in dbInventory.Customers where c.CustomerID == 407 select c).First();            
            cust.CustPhone = "214-752-1001";            
            dbInventory.SubmitChanges();
            var query = (from c in dbInventory.Customers where c.CustomerID == 407 select c).First();
            Console.WriteLine("Customer ID: " + query.CustomerID);
            Console.WriteLine("Name: " + query.CustName);
            Console.WriteLine("Company Name: " + query.CustCompanyName);
            Console.WriteLine("Designation: " + query.CustDesignation);
            Console.WriteLine("Address: " + query.CustAddress);
            Console.WriteLine("City: " + query.CustCity);
            Console.WriteLine("State: " + query.CustState);
            Console.WriteLine("Postal Code: " + query.CustPostalCode);
            Console.WriteLine("Country: " + query.CustCountry);
            Console.WriteLine("Phone Number: " + query.CustPhone);
            Console.ReadLine();
        }
    }
}
