using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DeleteOperation
{
    class Program
    {
        static void Main(string[] args)
        {
            var dbInventory = new InventoryDataContext();
            Customer cust = (from c in dbInventory.Customers where c.CustomerID == 407 select c).First();
            dbInventory.Customers.DeleteOnSubmit(cust);
            dbInventory.SubmitChanges();
            var query = from c in dbInventory.Customers select c;
            Console.WriteLine("Customer ID" + "\t\t" + "Customer Name");
            foreach (var q in query)
            {
                Console.WriteLine(q.CustomerID + "\t\t\t" + q.CustName);
            }
            Console.ReadLine();
        }
    }
}
