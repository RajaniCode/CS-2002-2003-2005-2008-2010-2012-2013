using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcRazor.Models
{
    public class CategoryRepository
    {
        NorthwindEntities db = new NorthwindEntities();

        public List<Category> List()
        {
            return db.Categories.OrderBy(p => p.CategoryName).ToList();
        }

        public Category Get(int CategoryID)
        {
            return db.Categories.Where(p => p.CategoryID == CategoryID).SingleOrDefault();
        }
    }
}