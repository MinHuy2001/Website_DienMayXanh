namespace Web_DienMayXanh.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class QL_Kho
    {
        [Key]
        [StringLength(10)]
        public string ID_Kho { get; set; }

        [StringLength(10)]
        public string ID_SP { get; set; }

        [StringLength(20)]
        public string TenKho { get; set; }

        public int? SoLuongMax { get; set; }

        public int? SL_Nhap { get; set; }

        public int? SL_Ton { get; set; }

        [StringLength(20)]
        public string DiaChi { get; set; }

        public virtual QL_SanPham QL_SanPham { get; set; }
    }
}
