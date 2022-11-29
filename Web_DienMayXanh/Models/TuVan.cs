namespace Web_DienMayXanh.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TuVan")]
    public partial class TuVan
    {
        [Key]
        [StringLength(10)]
        public string ID_CauHoi { get; set; }

        [StringLength(50)]
        public string NoiDung { get; set; }

        [StringLength(10)]
        public string ID_KhachHang { get; set; }

        [StringLength(20)]
        public string LoaiCauHoi { get; set; }

        [Column(TypeName = "date")]
        public DateTime? ThoiGianTraLoi { get; set; }

        public virtual QL_KhachHang QL_KhachHang { get; set; }
    }
}
