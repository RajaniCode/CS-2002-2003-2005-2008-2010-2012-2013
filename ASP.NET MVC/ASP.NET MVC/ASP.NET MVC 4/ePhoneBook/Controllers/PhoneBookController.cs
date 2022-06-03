using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ePhoneBook.Models;
namespace ePhoneBook.Controllers
{
    public class PhoneBookController : Controller
    {
        private static List<PhoneBookModel> _PhoneBookList;

        public static List<PhoneBookModel> PhoneBookList
        {
            get
            {
                if (_PhoneBookList == null)
                {
                    _PhoneBookList = new List<PhoneBookModel>();
                    _PhoneBookList.Add(new PhoneBookModel
                    {
                        FirstName = "Shemeer",
                        LastName = "NS",
                        MobileNumber = "+91 22 123456",
                        Email = "shemeerns@shemeerns.com"
                    });
                }
                return _PhoneBookList;
            }
            set { _PhoneBookList = value; }
        }

        //
        // GET: /PhoneBooks/

        public ActionResult Index()
        {

            return View(PhoneBookList);
        }

        //
        // GET: /PhoneBooks/Details/5

        public ActionResult Details(string mNumber)
        {

            return View(PhoneBookList.Where(c => c.MobileNumber == mNumber).FirstOrDefault());
        }

        //
        // GET: /PhoneBooks/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /PhoneBooks/Create

        [HttpPost]
        public ActionResult Create(PhoneBookModel phModel)
        {
            try
            {
                _PhoneBookList.Add(phModel);
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /PhoneBooks/Edit/5

        public ActionResult Edit(string mNumber)
        {
            return View(_PhoneBookList.Where(c => c.MobileNumber == mNumber).FirstOrDefault());
        }

        //
        // POST: /PhoneBooks/Edit/5

        [HttpPost]
        public ActionResult Edit(string mNumber, PhoneBookModel phModel)
        {
            try
            {
                _PhoneBookList.Where(c => c.MobileNumber == mNumber).ToList().ForEach(d => { d=phModel; });
                //d.FirstName = phModel.FirstName; d.MiddleName = phModel.MiddleNamek
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /PhoneBooks/Delete/5

        public ActionResult Delete(string mNumber)
        {
            try
            {
                _PhoneBookList.RemoveAll(c => c.MobileNumber == mNumber);
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // POST: /PhoneBooks/Delete/5

        [HttpPost]
        public ActionResult Delete(string mNumber, FormCollection collection)
        {
            //try
            //{
            //    // TODO: Add delete logic here

            //    return RedirectToAction("Index");
            //}
            //catch
            //{
            return View();
            //}
        }
    }
}
