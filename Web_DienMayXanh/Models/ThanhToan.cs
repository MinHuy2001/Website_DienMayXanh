namespace Web_DienMayXanh.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ThanhToan")]
    public partial class ThanhToan
    {
        [Key]
        [StringLength(10)]
        public string ID_ThanhToan { get; set; }

        [StringLength(10)]
        public string ID_HDB { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayThanhToan { get; set; }

        public double? SoTien { get; set; }

        [StringLength(50)]
        public string TrangThai { get; set; }

        public virtual QL_HD_Ban QL_HD_Ban { get; set; }
    }
}
