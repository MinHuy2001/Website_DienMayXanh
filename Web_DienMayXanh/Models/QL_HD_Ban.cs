namespace Web_DienMayXanh.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class QL_HD_Ban
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public QL_HD_Ban()
        {
            QL_CT_HDB = new HashSet<QL_CT_HDB>();
            ThanhToans = new HashSet<ThanhToan>();
        }

        [Key]
        [StringLength(10)]
        public string ID_HDB { get; set; }

        [Required]
        [StringLength(10)]
        public string ID_KhachHang { get; set; }

        [StringLength(10)]
        public string ID_PTTT { get; set; }

        [StringLength(500)]
        public string DC_GiaoHang { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayGiaoHang { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Ngay_Lap { get; set; }

        public bool? TrangThaiTT { get; set; }

        [StringLength(20)]
        public string TrangThaiGiaoHang { get; set; }

        public virtual PhuongThucThanhToan PhuongThucThanhToan { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<QL_CT_HDB> QL_CT_HDB { get; set; }

        public virtual QL_KhachHang QL_KhachHang { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ThanhToan> ThanhToans { get; set; }
    }
}
