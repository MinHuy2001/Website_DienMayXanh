namespace Web_DienMayXanh.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class QL_Hang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public QL_Hang()
        {
            QL_SanPham = new HashSet<QL_SanPham>();
        }

        [Key]
        [StringLength(10)]
        public string ID_Hang { get; set; }

        [StringLength(20)]
        public string TenHang { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<QL_SanPham> QL_SanPham { get; set; }
    }
}
