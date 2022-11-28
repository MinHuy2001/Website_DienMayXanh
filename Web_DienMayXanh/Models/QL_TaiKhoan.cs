namespace Web_DienMayXanh.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class QL_TaiKhoan
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public QL_TaiKhoan()
        {
            QL_HD_Nhap = new HashSet<QL_HD_Nhap>();
        }

        [Key]
        [StringLength(20)]
        public string ID_TaiKhoan { get; set; }

        [StringLength(20)]
        public string Ten_TaiKhoan { get; set; }

        [StringLength(10)]
        public string MatKhau { get; set; }

        [StringLength(5)]
        public string GioiTinh { get; set; }

        [StringLength(11)]
        public string SDT { get; set; }

        [StringLength(20)]
        public string Chuc_Vu { get; set; }

        public bool? QuyenDN { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<QL_HD_Nhap> QL_HD_Nhap { get; set; }
    }
}
