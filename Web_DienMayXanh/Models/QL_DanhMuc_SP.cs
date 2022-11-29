namespace Web_DienMayXanh.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class QL_DanhMuc_SP
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public QL_DanhMuc_SP()
        {
            QL_SanPham = new HashSet<QL_SanPham>();
        }

        [Key]
        [StringLength(10)]
        public string ID_DM_SP { get; set; }

        [StringLength(20)]
        public string Ten_DanhMuc { get; set; }

        [StringLength(10)]
        public string ID_Nhom_SP { get; set; }

        public virtual QL_Nhom_SP QL_Nhom_SP { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<QL_SanPham> QL_SanPham { get; set; }
    }
}
