using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace Web_DienMayXanh.Models
{
    public partial class QL_DMXModel : DbContext
    {
        public QL_DMXModel()
            : base("name=QL_DMXModel2")
        {
        }

        public virtual DbSet<DS_CTKM> DS_CTKM { get; set; }
        public virtual DbSet<GiamGia> GiamGias { get; set; }
        public virtual DbSet<PhuongThucThanhToan> PhuongThucThanhToans { get; set; }
        public virtual DbSet<QL_CT_HDB> QL_CT_HDB { get; set; }
        public virtual DbSet<QL_CT_HDN> QL_CT_HDN { get; set; }
        public virtual DbSet<QL_DanhMuc_SP> QL_DanhMuc_SP { get; set; }
        public virtual DbSet<QL_Hang> QL_Hang { get; set; }
        public virtual DbSet<QL_HD_Ban> QL_HD_Ban { get; set; }
        public virtual DbSet<QL_HD_Nhap> QL_HD_Nhap { get; set; }
        public virtual DbSet<QL_KhachHang> QL_KhachHang { get; set; }
        public virtual DbSet<QL_Kho> QL_Kho { get; set; }
        public virtual DbSet<QL_NCC> QL_NCC { get; set; }
        public virtual DbSet<QL_Nhom_SP> QL_Nhom_SP { get; set; }
        public virtual DbSet<QL_SanPham> QL_SanPham { get; set; }
        public virtual DbSet<QL_TaiKhoan> QL_TaiKhoan { get; set; }
        public virtual DbSet<ThanhToan> ThanhToans { get; set; }
        public virtual DbSet<TuVan> TuVans { get; set; }
        public virtual DbSet<QL_BaoHanh> QL_BaoHanh { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<DS_CTKM>()
                .Property(e => e.ID_CTKM)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<GiamGia>()
                .Property(e => e.ID_GiamGia)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<GiamGia>()
                .HasMany(e => e.QL_CT_HDN)
                .WithRequired(e => e.GiamGia)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PhuongThucThanhToan>()
                .Property(e => e.ID_PTTT)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<QL_CT_HDB>()
                .Property(e => e.ID_CT_HDB)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<QL_CT_HDB>()
                .Property(e => e.ID_HDB)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<QL_CT_HDB>()
                .Property(e => e.ID_SP)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<QL_CT_HDN>()
                .Property(e => e.ID_CT_HDN)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<QL_CT_HDN>()
                .Property(e => e.ID_HDN)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<QL_CT_HDN>()
                .Property(e => e.ID_SanPham)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<QL_CT_HDN>()
                .Property(e => e.ID_GiamGia)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<QL_DanhMuc_SP>()
                .Property(e => e.ID_DM_SP)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<QL_DanhMuc_SP>()
                .Property(e => e.ID_Nhom_SP)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<QL_DanhMuc_SP>()
                .HasMany(e => e.QL_SanPham)
                .WithRequired(e => e.QL_DanhMuc_SP)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<QL_Hang>()
                .Property(e => e.ID_Hang)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<QL_Hang>()
                .HasMany(e => e.QL_SanPham)
                .WithRequired(e => e.QL_Hang)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<QL_HD_Ban>()
                .Property(e => e.ID_HDB)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<QL_HD_Ban>()
                .Property(e => e.ID_KhachHang)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<QL_HD_Ban>()
                .Property(e => e.ID_PTTT)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<QL_HD_Ban>()
                .HasMany(e => e.QL_CT_HDB)
                .WithRequired(e => e.QL_HD_Ban)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<QL_HD_Nhap>()
                .Property(e => e.ID_HDN)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<QL_HD_Nhap>()
                .Property(e => e.ID_NCC)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<QL_HD_Nhap>()
                .Property(e => e.ID_TaiKhoan)
                .IsUnicode(false);

            modelBuilder.Entity<QL_HD_Nhap>()
                .HasMany(e => e.QL_CT_HDN)
                .WithRequired(e => e.QL_HD_Nhap)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<QL_KhachHang>()
                .Property(e => e.ID_KhachHang)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<QL_KhachHang>()
                .Property(e => e.SDT)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<QL_KhachHang>()
                .HasMany(e => e.QL_HD_Ban)
                .WithRequired(e => e.QL_KhachHang)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<QL_Kho>()
                .Property(e => e.ID_Kho)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<QL_Kho>()
                .Property(e => e.ID_SP)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<QL_NCC>()
                .Property(e => e.ID_NCC)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<QL_NCC>()
                .Property(e => e.mail_NCC)
                .IsUnicode(false);

            modelBuilder.Entity<QL_NCC>()
                .HasMany(e => e.QL_HD_Nhap)
                .WithRequired(e => e.QL_NCC)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<QL_Nhom_SP>()
                .Property(e => e.ID_Nhom_SP)
                .IsFixedLength()
                .IsUnicode(false);

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
                .Property(e => e.ID_GiamGia)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<QL_SanPham>()
                .Property(e => e.Mota_SP)
                .IsUnicode(false);

            modelBuilder.Entity<QL_SanPham>()
                .HasMany(e => e.QL_CT_HDB)
                .WithRequired(e => e.QL_SanPham)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<QL_SanPham>()
                .HasMany(e => e.QL_CT_HDN)
                .WithRequired(e => e.QL_SanPham)
                .HasForeignKey(e => e.ID_SanPham)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<QL_SanPham>()
                .HasMany(e => e.QL_BaoHanh)
                .WithRequired(e => e.QL_SanPham)
                .HasForeignKey(e => e.ID_SanPham)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<QL_TaiKhoan>()
                .Property(e => e.ID_TaiKhoan)
                .IsUnicode(false);

            modelBuilder.Entity<QL_TaiKhoan>()
                .Property(e => e.MatKhau)
                .IsUnicode(false);

            modelBuilder.Entity<QL_TaiKhoan>()
                .Property(e => e.SDT)
                .IsUnicode(false);

            modelBuilder.Entity<QL_TaiKhoan>()
                .HasMany(e => e.QL_HD_Nhap)
                .WithRequired(e => e.QL_TaiKhoan)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ThanhToan>()
                .Property(e => e.ID_ThanhToan)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<ThanhToan>()
                .Property(e => e.ID_HDB)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<TuVan>()
                .Property(e => e.ID_CauHoi)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<TuVan>()
                .Property(e => e.ID_KhachHang)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<QL_BaoHanh>()
                .Property(e => e.ID_BaoHanh)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<QL_BaoHanh>()
                .Property(e => e.ID_SanPham)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<QL_BaoHanh>()
                .Property(e => e.ID_KhachHang)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<QL_BaoHanh>()
                .Property(e => e.SDT)
                .IsFixedLength()
                .IsUnicode(false);
        }
    }
}
