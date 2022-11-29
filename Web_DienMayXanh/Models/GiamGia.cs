namespace Web_DienMayXanh.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("GiamGia")]
    public partial class GiamGia
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public GiamGia()
        {
            QL_CT_HDN = new HashSet<QL_CT_HDN>();
            QL_SanPham = new HashSet<QL_SanPham>();
        }

        [Key]
        [StringLength(10)]
        public string ID_GiamGia { get; set; }

        [StringLength(100)]
        public string Ten_GiamGia { get; set; }

        [StringLength(200)]
        public string MoTa { get; set; }

        public double? MucGiamGia { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayBD { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayKT { get; set; }

        public bool? HienThi { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<QL_CT_HDN> QL_CT_HDN { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<QL_SanPham> QL_SanPham { get; set; }
    }
}
