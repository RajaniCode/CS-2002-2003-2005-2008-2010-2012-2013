using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcRazor.Models
{
    public class SupplierRepository
    {
        NorthwindEntities db = new NorthwindEntities();

        public List<Supplier> List()
        {
            return db.Suppliers.OrderBy(p => p.CompanyName).ToList();
        }

        public Supplier Get(int SupplierID)
        {
            return db.Suppliers.Where(p => p.SupplierID == SupplierID).SingleOrDefault();
        }
    }
}