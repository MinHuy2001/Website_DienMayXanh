namespace Web_DienMayXanh.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class QL_KhachHang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public QL_KhachHang()
        {
            QL_HD_Ban = new HashSet<QL_HD_Ban>();
            QL_BaoHanh = new HashSet<QL_BaoHanh>();
            TuVans = new HashSet<TuVan>();
        }

        [Key]
        [StringLength(10)]
        public string ID_KhachHang { get; set; }

        [StringLength(20)]
        public string Ten_KhachHang { get; set; }

        [StringLength(10)]
        public string SDT { get; set; }

        [StringLength(20)]
        public string DiaChi { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<QL_HD_Ban> QL_HD_Ban { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<QL_BaoHanh> QL_BaoHanh { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TuVan> TuVans { get; set; }
    }
}
