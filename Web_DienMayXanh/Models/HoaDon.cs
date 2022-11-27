using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_DienMayXanh.Models
{
    public class HoaDon
    {
        public string pID_Hang { get; set; }
        public string pID_SP { get; set; }
        public string pID_DM_SP { get; set; }
        public string pTenSP { get; set; }
        public int pSL_SP { get; set; }
        public string pHinh_SP { get; set; }
        public float donGia { get; set; }
        public string pMoTa_SP { get; set; }

        QL_DMXModel ql = new QL_DMXModel();

        //Hàm tạo giỏ hàng
        public HoaDon(string maMH)
        {
            QL_SanPham mh = ql.QL_SanPham.Single(n => n.ID_SP == maMH);
            if (mh != null)
            {
                pID_Hang = mh.ID_Hang;
                pID_SP = mh.ID_SP;
                pID_DM_SP = mh.ID_DM_SP;
                pTenSP = mh.TenSP;
                pSL_SP = 1 + pSL_SP;
                pHinh_SP = mh.HINH_SP;
                donGia = float.Parse(mh.DG_Ban.ToString());
                pMoTa_SP = mh.Mota_SP;
            }
        }

    }
    public class GioHang
    {
        public List<HoaDon> lst;
        public GioHang()
        {
            lst = new List<HoaDon>();
        }
        public GioHang(List<HoaDon> lstHD)
        {
            if (lstHD == null)
            {
                lst = new List<HoaDon>();
            }
            else
            {
                lst = lstHD;
            }
        }

        //Tính số hàng//
        public int soSanPham()
        {
            if (lst == null)
            {
                return 0;
            }
            return lst.Count;
        }
        //Tổng số lượng mật hàng//
        //public int tongSLSP()
        //{
        //    int pTongSL = 0;
        //    if (lst != null)
        //    {
        //        pTongSL = lst.Sum(n => n.soLuong);
        //    }
        //    return pTongSL;
        //}
        ////Tong Thành tien//
        //public double TongThanhTien()
        //{
        //    double pTT = 0;
        //    if (lst != null)
        //    {
        //        pTT = lst.Sum(n => n.ThanhTien);
        //    }
        //    return pTT;
        //}
        ////Them vào hd//
        public int them(string pID_SP)
        {
            HoaDon mh = lst.Find(n => n.pID_SP == pID_SP);
            if (mh == null)
            {
                HoaDon mhnew = new HoaDon(pID_SP);
                if (mhnew == null)
                {
                    return -1;
                }
                lst.Add(mhnew);
            }
            else
            {
                mh.pSL_SP++;
            }
            return -1;
        }
        ////xóa///
        //public int Xoa(string pMaMH)
        //{
        //    HoaDon mh = lst.Find(n => n.pmaMH == pMaMH);
        //    if (mh != null)
        //    {
        //        lst.Remove(mh);
        //        return 1;
        //    }
        //    return -1;
        //}

        ////Sửa//
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
        ////Xóa cả giỏ hàng//
        //public void xoaALLGio()
        //{
        //    lst.Clear();
        //}
    }
}