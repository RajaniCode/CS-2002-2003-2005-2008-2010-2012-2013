using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WhereOperator
{
    class Program
    {
        static void Main(string[] args)
        {
            var dbInventory = new InventoryDataContext();
            var query = from c in dbInventory.Customers where c.CustCountry == "USA" select c;
            Console.WriteLine("Customer Name" + "\t\t" + "Company Name");
            foreach (var q in query)
            {
                Console.WriteLine(q.CustName + "\t\t" + q.CustCompanyName);
            }
            Console.ReadLine();
        }
    }
}
