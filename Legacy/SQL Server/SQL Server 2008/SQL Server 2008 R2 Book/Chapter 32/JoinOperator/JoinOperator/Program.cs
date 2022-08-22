using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace JoinOperator
{
    class Program
    {
        static void Main(string[] args)
        {
            var dbInventory = new InventoryDataContext();
            var query = from p in dbInventory.Products join s in dbInventory.Suppliers on p.SupplierID equals s.SupplierID select new { p.ProductID, p.ProductName, s.SupplierName};
            Console.WriteLine("Product ID" + "      Product Name" + "    \tSupplier Name");
            foreach (var q in query)
            {                    
                 Console.WriteLine(q.ProductID + "       \t" + q.ProductName + "\t\t" + q.SupplierName);
            }
            Console.ReadLine();
        }
    }
}
