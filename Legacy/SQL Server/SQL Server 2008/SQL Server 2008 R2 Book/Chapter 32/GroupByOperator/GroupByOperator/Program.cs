using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GroupByOperator
{
    class Program
    {
        static void Main(string[] args)
        {
            var dbInventory = new InventoryDataContext();
            IQueryable<IGrouping<string, Customer>> query = from c in dbInventory.Customers group c by c.CustCountry into g select g;
            Console.WriteLine("Country Name\tCustomer Name");
            foreach (IGrouping<string, Customer> q in query)
            {
                Console.Write(q.Key);
                foreach (Customer names in q)
                {                    
                    Console.WriteLine("\t\t" + names.CustName);
                }
            }           
            Console.ReadLine();
        }
    }
}
