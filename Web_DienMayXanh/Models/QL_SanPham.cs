namespace Web_DienMayXanh.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class QL_SanPham
    {
        [Key]
        [StringLength(5)]
        public string ID_SP { get; set; }

        [StringLength(20)]
        public string TenSP { get; set; }

        [Required]
        [StringLength(5)]
        public string ID_DM_SP { get; set; }

        [Required]
        [StringLength(5)]
        public string ID_Hang { get; set; }

        [StringLength(5)]
        public string ID_Kho { get; set; }

        [Required]
        [StringLength(10)]
        public string ID_GiamGia { get; set; }

        [StringLength(500)]
        public string HINH_SP { get; set; }

        public double? DG_Ban { get; set; }

        public double? DG_Nhap { get; set; }

        public int? SL_SP { get; set; }

        public int? SL_SPTon { get; set; }

        [StringLength(20)]
        public string DiaChi { get; set; }

        [StringLength(50)]
        public string Mota_SP { get; set; }
    }
}
