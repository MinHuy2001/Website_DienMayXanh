namespace Web_DienMayXanh.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PhuongThucThanhToan")]
    public partial class PhuongThucThanhToan
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PhuongThucThanhToan()
        {
            QL_HD_Ban = new HashSet<QL_HD_Ban>();
        }

        [Key]
        [StringLength(10)]
        public string ID_PTTT { get; set; }

        [StringLength(50)]
        public string Ten_PTTT { get; set; }

        [StringLength(500)]
        public string Mota { get; set; }

        public bool? HienThi { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<QL_HD_Ban> QL_HD_Ban { get; set; }
    }
}
