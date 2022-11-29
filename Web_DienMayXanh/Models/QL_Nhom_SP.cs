namespace Web_DienMayXanh.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class QL_Nhom_SP
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public QL_Nhom_SP()
        {
            QL_DanhMuc_SP = new HashSet<QL_DanhMuc_SP>();
        }

        [Key]
        [StringLength(10)]
        public string ID_Nhom_SP { get; set; }

        [StringLength(20)]
        public string Ten_Nhom { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<QL_DanhMuc_SP> QL_DanhMuc_SP { get; set; }
    }
}
