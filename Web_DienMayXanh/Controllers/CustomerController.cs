using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_DienMayXanh.Models;
using PagedList;
using System.Web.UI;

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

            ViewBag.dsTheoGG = ql.QL_SanPham.OrderBy(spgg=>spgg.ID_GiamGia);

            List<QL_SanPham> dsBC = ql.QL_SanPham.Take(10).ToList();
            List<GiamGia> dsGG = ql.GiamGias.Take(10).ToList();

 
            ViewBag.spGG = dsGG;

            //join///
            List<QL_SanPham> sp = ql.QL_SanPham.ToList();
            List<GiamGia> gg = ql.GiamGias.ToList(); ;
            var ProductJoinGG = from s in sp join st in gg on s.ID_GiamGia equals st.ID_GiamGia into st2 from st in st2.DefaultIfEmpty() select new ProductJoinPrice { SanPhammv = s, GiamGiamv = st };
            var spNB = from s in sp join st in gg on s.ID_GiamGia equals st.ID_GiamGia into st2 from st in st2.DefaultIfEmpty() select new ProductJoinPrice { SanPhammv = s, GiamGiamv = st };
            ViewBag.spNB = spNB.Take(10).ToList();
            var dsNB1 = from s in sp join st in gg on s.ID_GiamGia equals st.ID_GiamGia into st2 from st in st2.DefaultIfEmpty() select new ProductJoinPrice { SanPhammv = s, GiamGiamv = st };
            ViewBag.spNB1 = dsNB1.OrderByDescending(t=>t.SanPhammv.DG_Ban).Take(1).ToList();
            var dsNB2 = from s in sp join st in gg on s.ID_GiamGia equals st.ID_GiamGia into st2 from st in st2.DefaultIfEmpty() select new ProductJoinPrice { SanPhammv = s, GiamGiamv = st };
            ViewBag.spNB2 = dsNB2.OrderByDescending(t => t.SanPhammv.DG_Ban).Take(4).ToList();

            return View(ProductJoinGG);
        }

        //Menu dropDown//
        [ChildActionOnly]
        public ActionResult RenderMenu()
        {
            
            var dsDanhMuc = ql.QL_DanhMuc_SP.ToList();
            ViewBag.dsDM= dsDanhMuc;
            var dbDSDM = ql.QL_DanhMuc_SP;
            var dbSP = ql.QL_SanPham;
            ViewBag.SP = dbSP.ToList();
            return PartialView("_MenuDropDown");
        }
        //Menu dropDown//
        [ChildActionOnly]
        public ActionResult RenderMenuNgang()
        {

            var dsDanhMuc = ql.QL_DanhMuc_SP.Take(6).ToList();
            ViewBag.dsDM = dsDanhMuc;
            return PartialView("_MenuNgang");
        }

        public ActionResult ProductToMenu(string ID_DM)
        {
            
            List<QL_SanPham> dsBC = ql.QL_SanPham.Where(t => t.ID_DM_SP == ID_DM).ToList();
            //List<QL_SanPham> dsNB1 = ql.QL_SanPham.Take(1).ToList();
            //List<QL_SanPham> dsNB2 = ql.QL_SanPham.Take(4).ToList();
            //ViewBag.spNB = dsBC;
            //ViewBag.spNB1 = dsNB1;
            //ViewBag.spNB2 = dsNB2;
            //string tk = colselect["txtSelect"].ToString();
            //ViewBag.GiaSort = String.IsNullOrEmpty(tk) ? "thap-cao" : "";
            //ViewBag.GiaSort = String.IsNullOrEmpty(tk) ? "thap-cao" : "";

            //switch (tk)
            //{
            //    case "thap-cao":
            //        List<QL_SanPham> gia = ql.QL_SanPham.Where(t => t.ID_DM_SP == ID_DM).OrderBy(n => n.DG_Ban).ToList();
            //        return View(gia);

            //    case "cao-thap":
            //        List<QL_SanPham> giat = ql.QL_SanPham.Where(t => t.ID_DM_SP == ID_DM).OrderByDescending(n => n.DG_Ban).ToList();
            //        return View(giat);
            //    default:
            //        ViewBag.Success = "vui lòng chọn Lọc!!";
            //        return View(dsBC);
            //}
            return View(dsBC);
        }


        [HttpPost]
        public ActionResult ViewAllProduct(FormCollection colselect)
        {
            List<QL_SanPham> sp = ql.QL_SanPham.ToList();
            List<GiamGia> gg = ql.GiamGias.ToList(); ;
            var ProductJoinGG = from s in sp join st in gg on s.ID_GiamGia equals st.ID_GiamGia into st2 from st in st2.DefaultIfEmpty() select new ProductJoinPrice { SanPhammv = s, GiamGiamv = st };
            ViewBag.lsHang = ProductJoinGG;
            string tk = colselect["txtSelect"].ToString();
            ViewBag.GiaSort = String.IsNullOrEmpty(tk) ? "thap-cao" : "";
            ViewBag.GiaSort = String.IsNullOrEmpty(tk) ? "thap-cao" : "";

            switch (tk)
            {
                case "thap-cao":
                   
                    var gia = ProductJoinGG.OrderBy(n => n.SanPhammv.DG_Ban).ToList();
                    return View(gia);

                case "cao-thap":
                    var giat = ProductJoinGG.OrderByDescending(n => n.SanPhammv.DG_Ban).ToList();
                    return View(giat);
                default:
                    ViewBag.Success = "vui lòng chọn Lọc!!";
                    return View(ProductJoinGG);
            }


        }
        [HttpPost]
        public ActionResult ViewAllProductBC()
        {
            List<QL_SanPham> sp = ql.QL_SanPham.ToList();
            List<GiamGia> gg = ql.GiamGias.ToList(); ;
            var ProductJoinGG = from s in sp join st in gg on s.ID_GiamGia equals st.ID_GiamGia into st2 from st in st2.DefaultIfEmpty() select new ProductJoinPrice { SanPhammv = s, GiamGiamv = st };
            return View("ViewAllProduct", ProductJoinGG);

        }
        [HttpGet]
        public ActionResult ViewAllProductToMenu(string ID_DM, int? page)
        {
            //List<QL_SanPham> dsProduct = ql.QL_SanPham.Where(t => t.ID_DM_SP == ID_DM).ToList();

            if (page == null) page = 1;
            var products = ql.QL_SanPham.Where(t => t.ID_DM_SP == ID_DM).OrderBy(t=>t.ID_SP);
            
            int pageNumber = (page ?? 1);
            int pageSize = 15;
            //return View("ProductToMenu", dsProduct);
            return View (products.ToPagedList(pageNumber, pageSize));
        }


        public ActionResult Product()
        {
            return View();
        }
 
        [HttpPost]
        public ActionResult XyLyTimKiem(FormCollection col, int ? page)
         {
            string tk = col["txtTimKiem"].ToString();

            //List<QL_SanPham> ds = ql.QL_SanPham.Where(t => t.TenSP.Contains(tk) == true).ToList(); 
            if (page == null) page = 1;
            var products = ql.QL_SanPham.Where(t => t.TenSP.Contains(tk) == true).OrderBy(t => t.ID_SP);
            int pageNumber = (page ?? 1);
            int pageSize = 15;

            return View(products.ToPagedList(pageNumber, pageSize));
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
            //GiamGia gg = ql.GiamGias.FirstOrDefault();
            //QL_SanPham sp = ql.QL_SanPham.FirstOrDefault(t=>t.ID_SP==ID_SP && t.ID_GiamGia == gg.ID_GiamGia);


             
            List<QL_SanPham> sp = ql.QL_SanPham.Where(t => t.ID_SP == ID_SP).ToList();
            List<GiamGia> gg = ql.GiamGias.ToList(); ;
            var ProductJoinGG =from s in sp join st in gg on s.ID_GiamGia equals st.ID_GiamGia into st2 from st in st2.DefaultIfEmpty() select new ProductJoinPrice { SanPhammv = s, GiamGiamv = st };
            List<QL_SanPham> spLQ = ql.QL_SanPham.ToList();
            var ProductJoinLQ = (from s in spLQ join st in gg on s.ID_GiamGia equals st.ID_GiamGia into st2 from st in st2.DefaultIfEmpty() select new ProductJoinPrice { SanPhammv = s, GiamGiamv = st }).Where(n=>n.SanPhammv.ID_Hang.Contains(ProductJoinGG.Select(t=>t.SanPhammv.ID_Hang).FirstOrDefault())==true).Take(10).ToList();
            ViewBag.dsLQ = ProductJoinLQ;
            return View(ProductJoinGG);
        }

        //Gio hang//
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
        //Xoa Product ra gio hang//
        [HttpGet]
        public ActionResult XoaProductInCart(string id)
        {
            
            GioHang gh = Session["GioHang"] as GioHang;

            if (gh.Xoa(id) == -1) {
                Response.Redirect("~/PageError.html");
            }
            Session["GioHang"] = gh;
            return RedirectToAction("CartProduct", "Customer");
        }

        [HttpGet]
        public ActionResult CartProduct()
        {
            GioHang gh = Session["GioHang"] as GioHang;

            return View(gh);
        }
        //Sửa 
        //public int Sua(string pMaMH, int pSoLuong)
        //{
        //    HoaDon mh = lst.Find(n => n.pmaMH == pMaMH);
        //    if (mh != null)
        //    {
        //        mh.soLuong = pSoLuong;
        //        return 1;
        //    }
        //    return -1;
        //}


        //Xoa all//
        [HttpGet]
        public ActionResult XoaGioHang()
        {
            GioHang gh = Session["GioHang"] as GioHang;
            gh.xoaALLGio();
            return RedirectToAction("CartProduct", "Customer");
        }



        public JsonResult ListName(string q)
           {
            
            var data = ql.QL_SanPham.Where(x => x.TenSP.Contains(q)==true).Select(x=>x.TenSP);
            return Json(new
            {
                data = data,
                status = true,
            }, JsonRequestBehavior.AllowGet);
        }

       
    }
}