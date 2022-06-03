using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcRazor.Models
{
    public class ProductRepository
    {
        NorthwindEntities db = new NorthwindEntities();

        public List<Product> List()
        {
            return db.Products.OrderBy(p => p.ProductName).ToList();
        }

        public Product Get(int ProductID)
        {
            return db.Products.Where(p => p.ProductID == ProductID).SingleOrDefault();
        }

        public void Insert(Product product)
        {
            db.Products.Add(product);
            db.SaveChanges();
        }

        public void Update(Product product)
        {
            db.Products.Attach(product);
            db.Entry(product).State = System.Data.EntityState.Modified;
            db.SaveChanges();
        }

        public void Delete(Product product)
        {
            db.Products.Attach(product);
            db.Products.Remove(product);
            db.SaveChanges();
        }
        
        public bool IsProductNameUnique(string ProductName, int? ProductID)
        {
            if (ProductID != null)
                return (db.Products.Where(p => p.ProductName == ProductName && p.ProductID != ProductID).Count() == 0);
            else
                return (db.Products.Where(p => p.ProductName == ProductName).Count() == 0);
        }
    }
}