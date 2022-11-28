namespace Web_DienMayXanh.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class QL_BaoHanh
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(10)]
        public string ID_BaoHanh { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(10)]
        public string ID_SanPham { get; set; }

        [StringLength(20)]
        public string TenSP { get; set; }

        [StringLength(10)]
        public string ID_KhachHang { get; set; }

        [StringLength(10)]
        public string SDT { get; set; }

        public int? HanBH { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayBH { get; set; }

        public virtual QL_KhachHang QL_KhachHang { get; set; }

        public virtual QL_SanPham QL_SanPham { get; set; }
    }
}
