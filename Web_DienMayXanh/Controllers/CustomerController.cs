using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_DienMayXanh.Models;

namespace Web_DienMayXanh.Controllers
{
    public class CustomerController : Controller
    {
        QL_DMXModel ql = new QL_DMXModel();
        // GET: Customer
        [HttpGet]
        public ActionResult CustomerHome()
        {
            List<QL_SanPham> dsSP = ql.QL_SanPham.Take(4).ToList();
            List<QL_SanPham> dsBC = ql.QL_SanPham.Take(10).ToList();
            List<QL_SanPham> dsNB1 = ql.QL_SanPham.Take(1).ToList();
            List<QL_SanPham> dsNB2 = ql.QL_SanPham.Take(4).ToList();
            ViewBag.spNB = dsBC;
            ViewBag.spNB1 = dsNB1;
            ViewBag.spNB2 = dsNB2;
            return View(dsSP);
        }
        [HttpPost]
        public ActionResult ViewAllProduct(FormCollection colselect)
        {
            List<QL_SanPham> dsBC = ql.QL_SanPham.ToList();
            ViewBag.lsHang = dsBC;
            string tk = colselect["txtSelect"].ToString();
            ViewBag.GiaSort = String.IsNullOrEmpty(tk) ? "thap-cao" : "";
            ViewBag.GiaSort = String.IsNullOrEmpty(tk) ? "thap-cao" : "";

            switch (tk)
            {
                case "thap-cao":
                    List<QL_SanPham> gia = ql.QL_SanPham.OrderBy(n => n.DG_Ban).ToList();
                    return View(gia);

                case "cao-thap":
                    List<QL_SanPham> giat = ql.QL_SanPham.OrderByDescending(n => n.DG_Ban).ToList();
                    return View(giat);
                default:
                    ViewBag.Success = "vui lòng chọn Lọc!!";
                    return View(dsBC);
            }


        }
        [HttpPost]
        public ActionResult ViewAllProductBC()
        {
            List<QL_SanPham> dsBC = ql.QL_SanPham.ToList();
            return View("ViewAllProduct",dsBC);

        }
        public ActionResult Product()
        {
            return View();
        }
 
        public ActionResult CartProduct()
        {
            return View();
        }
        [HttpPost]
        public ActionResult XyLyTimKiem(FormCollection col)
        {
            string tk = col["txtTimKiem"].ToString();

            List<QL_SanPham> ds = ql.QL_SanPham.Where(t => t.TenSP.Contains(tk) == true).ToList(); ;

            return View(ds);
        }

        //[HttpPost]
        //public ActionResult XyLyTheoGiaThap_cao(FormCollection colselect)
        //{
        //    string tk = colselect["txtSelect"].ToString();
        //    ViewBag.GiaSort = String.IsNullOrEmpty(tk) ? "thap-cao" : "";

        //     switch (tk)
        //    {
        //        case "thap-cao":
        //            List<QL_SanPham> gia=ql.QL_SanPham.OrderBy(n => n.DG_Ban).ToList();
        //            return View(gia);

        //        default:
        //            List<QL_SanPham> giat = ql.QL_SanPham.OrderByDescending(n => n.DG_Ban).ToList();
        //            return View(giat);
        //    }
        //}

        public ActionResult ModalProduct(string ID_SP)
        {
            //ID_SP = "1614";
            //Lấy thông tin sản phẩm//
            QL_SanPham mH = ql.QL_SanPham.FirstOrDefault(t => t.ID_SP == ID_SP);
            return View(mH);
        }


        public ActionResult ChonMua(string id)
        {
            GioHang gh = Session["GioHang"] as GioHang;
            if (gh == null)
            {
                gh = new GioHang();
            }
            //Them vào gio hang//
            gh.them(id);
            Session["GioHang"] = gh;
            return RedirectToAction("CustomerHome", "Customer");
        }
    }
}