namespace Web_DienMayXanh.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class QL_CT_HDN
    {
        [Key]
        [StringLength(10)]
        public string ID_CT_HDN { get; set; }

        [Required]
        [StringLength(10)]
        public string ID_HDN { get; set; }

        [Required]
        [StringLength(10)]
        public string ID_SanPham { get; set; }

        [Required]
        [StringLength(10)]
        public string ID_GiamGia { get; set; }

        public int? So_Luong { get; set; }

        public double? Don_Gia { get; set; }

        public double? Giam_Gia { get; set; }

        public double? Tong_Tien { get; set; }

        public virtual GiamGia GiamGia { get; set; }

        public virtual QL_HD_Nhap QL_HD_Nhap { get; set; }

        public virtual QL_SanPham QL_SanPham { get; set; }
    }
}
