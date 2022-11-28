namespace Web_DienMayXanh.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class QL_NCC
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public QL_NCC()
        {
            QL_HD_Nhap = new HashSet<QL_HD_Nhap>();
        }

        [Key]
        [StringLength(10)]
        public string ID_NCC { get; set; }

        [StringLength(50)]
        public string Ten_NCC { get; set; }

        [StringLength(50)]
        public string DiaChi { get; set; }

        [StringLength(50)]
        public string mail_NCC { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<QL_HD_Nhap> QL_HD_Nhap { get; set; }
    }
}
