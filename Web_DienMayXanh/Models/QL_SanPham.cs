namespace Web_DienMayXanh.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class QL_SanPham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public QL_SanPham()
        {
            QL_CT_HDB = new HashSet<QL_CT_HDB>();
            QL_CT_HDN = new HashSet<QL_CT_HDN>();
            QL_Kho = new HashSet<QL_Kho>();
            QL_BaoHanh = new HashSet<QL_BaoHanh>();
        }

        [Key]
        [StringLength(10)]
        public string ID_SP { get; set; }

        [StringLength(500)]
        public string TenSP { get; set; }

        [Required]
        [StringLength(10)]
        public string ID_DM_SP { get; set; }

        [Required]
        [StringLength(10)]
        public string ID_Hang { get; set; }

        [StringLength(10)]
        public string ID_GiamGia { get; set; }

        [StringLength(1000)]
        public string HINH_SP { get; set; }

        public double? DG_Ban { get; set; }

        public double? DG_Nhap { get; set; }

        public int? SL_SP { get; set; }

        public int? SL_SPTon { get; set; }

        [StringLength(500)]
        public string DiacChi { get; set; }

        [Column(TypeName = "text")]
        public string Mota_SP { get; set; }

        public virtual GiamGia GiamGia { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<QL_CT_HDB> QL_CT_HDB { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<QL_CT_HDN> QL_CT_HDN { get; set; }

        public virtual QL_DanhMuc_SP QL_DanhMuc_SP { get; set; }

        public virtual QL_Hang QL_Hang { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<QL_Kho> QL_Kho { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<QL_BaoHanh> QL_BaoHanh { get; set; }



    }
}
