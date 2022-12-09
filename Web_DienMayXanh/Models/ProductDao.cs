using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_DienMayXanh.Models
{
    public class ProductDao
    {
        QL_DMXModel db = new QL_DMXModel();
        public List<string> ListName (string keyWord)
        {
            return db.QL_SanPham.Where(x => x.TenSP.Contains(keyWord)).Select(x => x.TenSP).ToList();
        }
    }
}