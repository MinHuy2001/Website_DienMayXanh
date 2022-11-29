namespace Web_DienMayXanh.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class QL_HD_Nhap
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public QL_HD_Nhap()
        {
            QL_CT_HDN = new HashSet<QL_CT_HDN>();
        }

        [Key]
        [StringLength(10)]
        public string ID_HDN { get; set; }

        [Required]
        [StringLength(10)]
        public string ID_NCC { get; set; }

        [Required]
        [StringLength(20)]
        public string ID_TaiKhoan { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Ngay_Nhap { get; set; }

        public int? Tong_SL { get; set; }

        public double? Thanh_Toan { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<QL_CT_HDN> QL_CT_HDN { get; set; }

        public virtual QL_NCC QL_NCC { get; set; }

        public virtual QL_TaiKhoan QL_TaiKhoan { get; set; }
    }
}
