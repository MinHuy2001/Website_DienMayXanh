using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace Web_DienMayXanh.Models
{
    public partial class QL_DMXModel : DbContext
    {
        public QL_DMXModel()
            : base("name=QL_DMXModel1")
        {
        }

        public virtual DbSet<QL_SanPham> QL_SanPham { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<QL_SanPham>()
                .Property(e => e.ID_SP)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<QL_SanPham>()
                .Property(e => e.ID_DM_SP)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<QL_SanPham>()
                .Property(e => e.ID_Hang)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<QL_SanPham>()
                .Property(e => e.ID_Kho)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<QL_SanPham>()
                .Property(e => e.ID_GiamGia)
                .IsFixedLength()
                .IsUnicode(false);
        }
    }
}
