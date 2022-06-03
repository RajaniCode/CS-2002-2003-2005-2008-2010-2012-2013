using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcRazor.Models;

namespace MvcRazor.Controllers
{ 
    public class HomeController : Controller
    {
        private ProductRepository pr = new ProductRepository();
        private CategoryRepository cr = new CategoryRepository();
        private SupplierRepository sr = new SupplierRepository();

        //
        // GET: /Default1/

        public ViewResult Index()
        {
            var products = pr.List();
            return View(products);
        }

        //
        // GET: /Default1/Details/5

        public ViewResult Details(int id)
        {
            Product product = pr.Get(id);
            return View(product);
        }

        //
        // GET: /Default1/Create

        public ActionResult Create()
        {
            ViewBag.CategoryID = new SelectList(cr.List(), "CategoryID", "CategoryName");
            ViewBag.SupplierID = new SelectList(sr.List(), "SupplierID", "CompanyName");
            return View();
        } 

        //
        // POST: /Default1/Create

        [HttpPost]
        public ActionResult Create(Product product)
        {
            if (ModelState.IsValid)
            {
                pr.Insert(product);
                return RedirectToAction("Index");  
            }

            ViewBag.CategoryID = new SelectList(cr.List(), "CategoryID", "CategoryName", product.CategoryID);
            ViewBag.SupplierID = new SelectList(sr.List(), "SupplierID", "CompanyName", product.SupplierID);
            return View(product);
        }
        
        //
        // GET: /Default1/Edit/5
 
        public ActionResult Edit(int id)
        {
            Product product = pr.Get(id);
            ViewBag.CategoryID = new SelectList(cr.List(), "CategoryID", "CategoryName", product.CategoryID);
            ViewBag.SupplierID = new SelectList(sr.List(), "SupplierID", "CompanyName", product.SupplierID);
            return View(product);
        }

        //
        // POST: /Default1/Edit/5

        [HttpPost]
        public ActionResult Edit(Product product)
        {
            if (ModelState.IsValid)
            {
                pr.Update(product);
                return RedirectToAction("Index");
            }
            ViewBag.CategoryID = new SelectList(cr.List(), "CategoryID", "CategoryName", product.CategoryID);
            ViewBag.SupplierID = new SelectList(sr.List(), "SupplierID", "CompanyName", product.SupplierID);
            return View(product);
        }

        //
        // GET: /Default1/Delete/5
 
        public ActionResult Delete(int id)
        {
            Product product = pr.Get(id);
            return View(product);
        }

        //
        // POST: /Default1/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            pr.Delete(pr.Get(id));
            return RedirectToAction("Index");
        }

        public ActionResult ValidateProductName(string ProductName, int? ProductID)
        {
            return Json(pr.IsProductNameUnique(ProductName, ProductID), JsonRequestBehavior.AllowGet);
        }
    }
}