using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Web_DienMayXanh.Controllers
{
    public class CustomerController : Controller
    {
        // GET: Customer
        public ActionResult CustomerHome()
        {
            return View();
        }
        public ActionResult Product()
        {
            return View();
        }
        public ActionResult ModalProduct()
        {
            return View();
        }
        public ActionResult CartProduct()
        {
            return View();
        }

    }
}