namespace Web_DienMayXanh.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class DS_CTKM
    {
        [Key]
        [StringLength(10)]
        public string ID_CTKM { get; set; }

        [StringLength(50)]
        public string Ten_CTKM { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Ngay_BD { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Ngay_KT { get; set; }
    }
}
