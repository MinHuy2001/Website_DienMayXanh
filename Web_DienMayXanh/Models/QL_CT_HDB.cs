namespace Web_DienMayXanh.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class QL_CT_HDB
    {
        [Key]
        [StringLength(10)]
        public string ID_CT_HDB { get; set; }

        [Required]
        [StringLength(10)]
        public string ID_HDB { get; set; }

        [Required]
        [StringLength(10)]
        public string ID_SP { get; set; }

        public int? So_Luong { get; set; }

        public double? DonGia { get; set; }

        public double? Giam_Gia { get; set; }

        public double? Tong_Tien { get; set; }

        public virtual QL_HD_Ban QL_HD_Ban { get; set; }

        public virtual QL_SanPham QL_SanPham { get; set; }
    }
}
