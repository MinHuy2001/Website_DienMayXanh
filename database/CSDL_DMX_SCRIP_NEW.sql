USE [QL_DMX]
GO
/****** Object:  Table [dbo].[CT_CTKM]    Script Date: 28/11/2022 12:16:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CT_CTKM](
	[ID_CTKM] [char](10) NULL,
	[ID_SanPhamMua] [char](10) NULL,
	[ID_SanPhamTang] [char](10) NULL,
	[Khac] [nvarchar](500) NULL,
	[MoTa] [nvarchar](500) NULL,
	[HienThi] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DS_CTKM]    Script Date: 28/11/2022 12:16:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DS_CTKM](
	[ID_CTKM] [char](10) NOT NULL,
	[Ten_CTKM] [nvarchar](50) NULL,
	[Ngay_BD] [date] NULL,
	[Ngay_KT] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_CTKM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GiamGia]    Script Date: 28/11/2022 12:16:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GiamGia](
	[ID_GiamGia] [char](10) NOT NULL,
	[Ten_GiamGia] [nvarchar](100) NULL,
	[MoTa] [nvarchar](200) NULL,
	[MucGiamGia] [float] NULL,
	[NgayBD] [date] NULL,
	[NgayKT] [date] NULL,
	[HienThi] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_GiamGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Hinh]    Script Date: 28/11/2022 12:16:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hinh](
	[ID_HinhAnh] [char](10) NULL,
	[ID_SanPham] [char](10) NULL,
	[HINH_SP] [nvarchar](500) NULL,
	[HienThi] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhuongThucThanhToan]    Script Date: 28/11/2022 12:16:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhuongThucThanhToan](
	[ID_PTTT] [char](10) NOT NULL,
	[Ten_PTTT] [nvarchar](50) NULL,
	[Mota] [nvarchar](500) NULL,
	[HienThi] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_PTTT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QL_BaoHanh]    Script Date: 28/11/2022 12:16:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QL_BaoHanh](
	[ID_BaoHanh] [char](10) NOT NULL,
	[ID_SanPham] [char](10) NOT NULL,
	[TenSP] [nvarchar](20) NULL,
	[ID_KhachHang] [char](10) NULL,
	[SDT] [char](10) NULL,
	[HanBH] [int] NULL,
	[NgayBH] [date] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QL_CT_HDB]    Script Date: 28/11/2022 12:16:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QL_CT_HDB](
	[ID_CT_HDB] [char](10) NOT NULL,
	[ID_HDB] [char](10) NOT NULL,
	[ID_SP] [char](10) NOT NULL,
	[So_Luong] [int] NULL,
	[DonGia] [float] NULL,
	[Giam_Gia] [float] NULL,
	[Tong_Tien] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_CT_HDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QL_CT_HDN]    Script Date: 28/11/2022 12:16:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QL_CT_HDN](
	[ID_CT_HDN] [char](10) NOT NULL,
	[ID_HDN] [char](10) NOT NULL,
	[ID_SanPham] [char](10) NOT NULL,
	[ID_GiamGia] [char](10) NOT NULL,
	[So_Luong] [int] NULL,
	[Don_Gia] [float] NULL,
	[Giam_Gia] [float] NULL,
	[Tong_Tien] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_CT_HDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QL_DanhMuc_SP]    Script Date: 28/11/2022 12:16:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QL_DanhMuc_SP](
	[ID_DM_SP] [char](10) NOT NULL,
	[Ten_DanhMuc] [nvarchar](20) NULL,
	[ID_Nhom_SP] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_DM_SP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QL_Hang]    Script Date: 28/11/2022 12:16:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QL_Hang](
	[ID_Hang] [char](10) NOT NULL,
	[TenHang] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Hang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QL_HD_Ban]    Script Date: 28/11/2022 12:16:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QL_HD_Ban](
	[ID_HDB] [char](10) NOT NULL,
	[ID_KhachHang] [char](10) NOT NULL,
	[ID_PTTT] [char](10) NULL,
	[DC_GiaoHang] [nvarchar](500) NULL,
	[NgayGiaoHang] [date] NULL,
	[Ngay_Lap] [date] NULL,
	[TrangThaiTT] [bit] NULL,
	[TrangThaiGiaoHang] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_HDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QL_HD_Nhap]    Script Date: 28/11/2022 12:16:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QL_HD_Nhap](
	[ID_HDN] [char](10) NOT NULL,
	[ID_NCC] [char](10) NOT NULL,
	[ID_TaiKhoan] [varchar](20) NOT NULL,
	[Ngay_Nhap] [date] NULL,
	[Tong_SL] [int] NULL,
	[Thanh_Toan] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_HDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QL_KhachHang]    Script Date: 28/11/2022 12:16:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QL_KhachHang](
	[ID_KhachHang] [char](10) NOT NULL,
	[Ten_KhachHang] [nvarchar](20) NULL,
	[SDT] [char](10) NULL,
	[DiaChi] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_KhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QL_Kho]    Script Date: 28/11/2022 12:16:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QL_Kho](
	[ID_Kho] [char](10) NOT NULL,
	[ID_SP] [char](10) NULL,
	[TenKho] [nvarchar](20) NULL,
	[SoLuongMax] [int] NULL,
	[SL_Nhap] [int] NULL,
	[SL_Ton] [int] NULL,
	[DiaChi] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Kho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QL_NCC]    Script Date: 28/11/2022 12:16:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QL_NCC](
	[ID_NCC] [char](10) NOT NULL,
	[Ten_NCC] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[mail_NCC] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_NCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QL_Nhom_SP]    Script Date: 28/11/2022 12:16:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QL_Nhom_SP](
	[ID_Nhom_SP] [char](10) NOT NULL,
	[Ten_Nhom] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Nhom_SP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QL_SanPham]    Script Date: 28/11/2022 12:16:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QL_SanPham](
	[ID_SP] [char](10) NOT NULL,
	[TenSP] [nvarchar](500) NULL,
	[ID_DM_SP] [char](10) NOT NULL,
	[ID_Hang] [char](10) NOT NULL,
	[ID_GiamGia] [char](10) NULL,
	[HINH_SP] [nvarchar](1000) NULL,
	[DG_Ban] [float] NULL,
	[DG_Nhap] [float] NULL,
	[SL_SP] [int] NULL,
	[SL_SPTon] [int] NULL,
	[DiacChi] [nvarchar](500) NULL,
	[Mota_SP] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_SP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QL_TaiKhoan]    Script Date: 28/11/2022 12:16:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QL_TaiKhoan](
	[ID_TaiKhoan] [varchar](20) NOT NULL,
	[Ten_TaiKhoan] [nvarchar](20) NULL,
	[MatKhau] [varchar](10) NULL,
	[GioiTinh] [nvarchar](5) NULL,
	[SDT] [varchar](11) NULL,
	[Chuc_Vu] [nvarchar](20) NULL,
	[QuyenDN] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ThanhToan]    Script Date: 28/11/2022 12:16:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ThanhToan](
	[ID_ThanhToan] [char](10) NOT NULL,
	[ID_HDB] [char](10) NULL,
	[NgayThanhToan] [date] NULL,
	[SoTien] [float] NULL,
	[TrangThai] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_ThanhToan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TuVan]    Script Date: 28/11/2022 12:16:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TuVan](
	[ID_CauHoi] [char](10) NOT NULL,
	[NoiDung] [nvarchar](50) NULL,
	[ID_KhachHang] [char](10) NULL,
	[LoaiCauHoi] [nvarchar](20) NULL,
	[ThoiGianTraLoi] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_CauHoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[DS_CTKM] ([ID_CTKM], [Ten_CTKM], [Ngay_BD], [Ngay_KT]) VALUES (N'KM001     ', N'World Cup siêu lớn', CAST(N'2022-11-14' AS Date), CAST(N'2022-11-30' AS Date))
INSERT [dbo].[GiamGia] ([ID_GiamGia], [Ten_GiamGia], [MoTa], [MucGiamGia], [NgayBD], [NgayKT], [HienThi]) VALUES (N'GG001     ', N'THÁNG TRI ÂN- LAPTOP CPU INTEL', N'Mừng tháng tri ân, Laptop CPU Intel săn coupon giảm đến 500k', 500000, CAST(N'2022-11-14' AS Date), CAST(N'2022-11-20' AS Date), 1)
INSERT [dbo].[PhuongThucThanhToan] ([ID_PTTT], [Ten_PTTT], [Mota], [HienThi]) VALUES (N'PT001     ', N'Thanh toán thẻ', N'Khách hàng chuyển khoảng', 1)
INSERT [dbo].[PhuongThucThanhToan] ([ID_PTTT], [Ten_PTTT], [Mota], [HienThi]) VALUES (N'PT002     ', N'Thanh toán tiền mặt', N'Khách hàng đặt hàng giao hàng xong thanh toán', 1)
INSERT [dbo].[QL_CT_HDB] ([ID_CT_HDB], [ID_HDB], [ID_SP], [So_Luong], [DonGia], [Giam_Gia], [Tong_Tien]) VALUES (N'CTB01     ', N'SO00000001', N'SP001     ', 1, 30000000, 500000, NULL)
INSERT [dbo].[QL_CT_HDN] ([ID_CT_HDN], [ID_HDN], [ID_SanPham], [ID_GiamGia], [So_Luong], [Don_Gia], [Giam_Gia], [Tong_Tien]) VALUES (N'CTN01     ', N'IN00000001', N'SP001     ', N'GG001     ', 10, 30000000, 500000, NULL)
INSERT [dbo].[QL_DanhMuc_SP] ([ID_DM_SP], [Ten_DanhMuc], [ID_Nhom_SP]) VALUES (N'DM001     ', N'Tivi', N'N0001     ')
INSERT [dbo].[QL_DanhMuc_SP] ([ID_DM_SP], [Ten_DanhMuc], [ID_Nhom_SP]) VALUES (N'DM002     ', N'Điện thoại', N'N0001     ')
INSERT [dbo].[QL_DanhMuc_SP] ([ID_DM_SP], [Ten_DanhMuc], [ID_Nhom_SP]) VALUES (N'DM003     ', N'Laptop', N'N0001     ')
INSERT [dbo].[QL_DanhMuc_SP] ([ID_DM_SP], [Ten_DanhMuc], [ID_Nhom_SP]) VALUES (N'DM004     ', N'Tablet', N'N0001     ')
INSERT [dbo].[QL_DanhMuc_SP] ([ID_DM_SP], [Ten_DanhMuc], [ID_Nhom_SP]) VALUES (N'DM005     ', N'Đồng hồ thông minh', N'N0001     ')
INSERT [dbo].[QL_DanhMuc_SP] ([ID_DM_SP], [Ten_DanhMuc], [ID_Nhom_SP]) VALUES (N'DM006     ', N'Loa,Dàn Karaok', N'N0001     ')
INSERT [dbo].[QL_DanhMuc_SP] ([ID_DM_SP], [Ten_DanhMuc], [ID_Nhom_SP]) VALUES (N'DM007     ', N'Máy lạnh', N'N0002     ')
INSERT [dbo].[QL_DanhMuc_SP] ([ID_DM_SP], [Ten_DanhMuc], [ID_Nhom_SP]) VALUES (N'DM008     ', N'Máy giặt', N'N0002     ')
INSERT [dbo].[QL_DanhMuc_SP] ([ID_DM_SP], [Ten_DanhMuc], [ID_Nhom_SP]) VALUES (N'DM009     ', N'Máy sấy quần áo', N'N0002     ')
INSERT [dbo].[QL_DanhMuc_SP] ([ID_DM_SP], [Ten_DanhMuc], [ID_Nhom_SP]) VALUES (N'DM010     ', N'Tủ lạnh', N'N0002     ')
INSERT [dbo].[QL_DanhMuc_SP] ([ID_DM_SP], [Ten_DanhMuc], [ID_Nhom_SP]) VALUES (N'DM011     ', N'Tủ đông', N'N0002     ')
INSERT [dbo].[QL_DanhMuc_SP] ([ID_DM_SP], [Ten_DanhMuc], [ID_Nhom_SP]) VALUES (N'DM012     ', N'Tủ mát', N'N0002     ')
INSERT [dbo].[QL_DanhMuc_SP] ([ID_DM_SP], [Ten_DanhMuc], [ID_Nhom_SP]) VALUES (N'DM013     ', N'Máy nước nóng', N'N0002     ')
INSERT [dbo].[QL_DanhMuc_SP] ([ID_DM_SP], [Ten_DanhMuc], [ID_Nhom_SP]) VALUES (N'DM014     ', N'Nấu nướng, chế biến', N'N0003     ')
INSERT [dbo].[QL_DanhMuc_SP] ([ID_DM_SP], [Ten_DanhMuc], [ID_Nhom_SP]) VALUES (N'DM015     ', N'Nhà cửa, điện đớm', N'N0003     ')
INSERT [dbo].[QL_DanhMuc_SP] ([ID_DM_SP], [Ten_DanhMuc], [ID_Nhom_SP]) VALUES (N'DM016     ', N'Làm đẹp, sức khỏe', N'N0003     ')
INSERT [dbo].[QL_DanhMuc_SP] ([ID_DM_SP], [Ten_DanhMuc], [ID_Nhom_SP]) VALUES (N'DM017     ', N'Xay ép pha chế', N'N0003     ')
INSERT [dbo].[QL_DanhMuc_SP] ([ID_DM_SP], [Ten_DanhMuc], [ID_Nhom_SP]) VALUES (N'DM018     ', N'Chăm sóc mẹ và bé', N'N0003     ')
INSERT [dbo].[QL_DanhMuc_SP] ([ID_DM_SP], [Ten_DanhMuc], [ID_Nhom_SP]) VALUES (N'DM019     ', N'Dụng cụ bàn ăn', N'N0003     ')
INSERT [dbo].[QL_DanhMuc_SP] ([ID_DM_SP], [Ten_DanhMuc], [ID_Nhom_SP]) VALUES (N'DM020     ', N'Dụng cụ sửa chữa', N'N0003     ')
INSERT [dbo].[QL_Hang] ([ID_Hang], [TenHang]) VALUES (N'H000000001', N'SAMSUNG')
INSERT [dbo].[QL_Hang] ([ID_Hang], [TenHang]) VALUES (N'H000000002', N'SONY')
INSERT [dbo].[QL_Hang] ([ID_Hang], [TenHang]) VALUES (N'H000000003', N'LG')
INSERT [dbo].[QL_Hang] ([ID_Hang], [TenHang]) VALUES (N'H000000004', N'AQUA')
INSERT [dbo].[QL_Hang] ([ID_Hang], [TenHang]) VALUES (N'H000000005', N'SHARP')
INSERT [dbo].[QL_Hang] ([ID_Hang], [TenHang]) VALUES (N'H000000006', N'TOSHIBA')
INSERT [dbo].[QL_Hang] ([ID_Hang], [TenHang]) VALUES (N'H000000007', N'TCL')
INSERT [dbo].[QL_Hang] ([ID_Hang], [TenHang]) VALUES (N'H000000008', N'PANASONIC')
INSERT [dbo].[QL_Hang] ([ID_Hang], [TenHang]) VALUES (N'H000000009', N'HITACHI')
INSERT [dbo].[QL_Hang] ([ID_Hang], [TenHang]) VALUES (N'H000000010', N'DAIKIN')
INSERT [dbo].[QL_Hang] ([ID_Hang], [TenHang]) VALUES (N'H000000011', N'CASPER')
INSERT [dbo].[QL_Hang] ([ID_Hang], [TenHang]) VALUES (N'H000000012', N'FUNIKI')
INSERT [dbo].[QL_Hang] ([ID_Hang], [TenHang]) VALUES (N'H000000013', N'APPLE')
INSERT [dbo].[QL_Hang] ([ID_Hang], [TenHang]) VALUES (N'H000000014', N'NOKIA')
INSERT [dbo].[QL_Hang] ([ID_Hang], [TenHang]) VALUES (N'H000000015', N'OPPO')
INSERT [dbo].[QL_Hang] ([ID_Hang], [TenHang]) VALUES (N'H000000016', N'VIVO')
INSERT [dbo].[QL_Hang] ([ID_Hang], [TenHang]) VALUES (N'H000000017', N'REALME')
INSERT [dbo].[QL_Hang] ([ID_Hang], [TenHang]) VALUES (N'H000000018', N'XIAOMI')
INSERT [dbo].[QL_HD_Ban] ([ID_HDB], [ID_KhachHang], [ID_PTTT], [DC_GiaoHang], [NgayGiaoHang], [Ngay_Lap], [TrangThaiTT], [TrangThaiGiaoHang]) VALUES (N'SO00000001', N'0346824776', N'PT002     ', N'HCM', CAST(N'2022-11-30' AS Date), CAST(N'2022-11-27' AS Date), 0, N'1')
INSERT [dbo].[QL_HD_Nhap] ([ID_HDN], [ID_NCC], [ID_TaiKhoan], [Ngay_Nhap], [Tong_SL], [Thanh_Toan]) VALUES (N'IN00000001', N'NCC01     ', N'TK001', CAST(N'2022-11-27' AS Date), NULL, NULL)
INSERT [dbo].[QL_HD_Nhap] ([ID_HDN], [ID_NCC], [ID_TaiKhoan], [Ngay_Nhap], [Tong_SL], [Thanh_Toan]) VALUES (N'IN00000002', N'NCC01     ', N'TK001', CAST(N'2022-11-27' AS Date), NULL, NULL)
INSERT [dbo].[QL_KhachHang] ([ID_KhachHang], [Ten_KhachHang], [SDT], [DiaChi]) VALUES (N'0346824776', N'Dương Minh Huy', N'0346824776', N'Kiên Giang')
INSERT [dbo].[QL_Kho] ([ID_Kho], [ID_SP], [TenKho], [SoLuongMax], [SL_Nhap], [SL_Ton], [DiaChi]) VALUES (N'K0001     ', N'SP001     ', N'Kho hàng bán', 9999, 500, 50, N'A')
INSERT [dbo].[QL_Kho] ([ID_Kho], [ID_SP], [TenKho], [SoLuongMax], [SL_Nhap], [SL_Ton], [DiaChi]) VALUES (N'K0002     ', N'SP001     ', N'Kho hàng hỏng', 9999, 500, 50, N'B')
INSERT [dbo].[QL_Kho] ([ID_Kho], [ID_SP], [TenKho], [SoLuongMax], [SL_Nhap], [SL_Ton], [DiaChi]) VALUES (N'K0003     ', N'SP001     ', N'Kho hàng đổi trả ', 9999, 500, 50, N'C')
INSERT [dbo].[QL_NCC] ([ID_NCC], [Ten_NCC], [DiaChi], [mail_NCC]) VALUES (N'NCC01     ', N'Petrosetco', N'Quận 1-TP.HCM', N'info@petrosetco.com.vn')
INSERT [dbo].[QL_Nhom_SP] ([ID_Nhom_SP], [Ten_Nhom]) VALUES (N'N0001     ', N'Điện tử')
INSERT [dbo].[QL_Nhom_SP] ([ID_Nhom_SP], [Ten_Nhom]) VALUES (N'N0002     ', N'Điện lạnh')
INSERT [dbo].[QL_Nhom_SP] ([ID_Nhom_SP], [Ten_Nhom]) VALUES (N'N0003     ', N'Gia dụng')
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiacChi], [Mota_SP]) VALUES (N'SP001     ', N'IPhone 14', N'DM002     ', N'H000000013', N'GG001     ', N'https://cdn.tgdd.vn/Products/Images/42/240259/TimerThumb/iphone-14-(1).jpg', 32000000, 30000000, 20, 22, N'TP.HCM', N'IPhone 14 chính hãng t?i Ði?n Máy Xanh')
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiacChi], [Mota_SP]) VALUES (N'SP002     ', N'Samsung Galaxy S22', N'DM002     ', N'H000000001', N'GG001     ', N'https://cdn.tgdd.vn/Products/Images/42/271695/TimerThumb/samsung-galaxy-s22-256gb-(1).jpg', 29000000, 25000000, 30, 33, N'Hà Nội', N'Samsung Galaxy S22 Ultra chính hãng t?i ÐMX')
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiacChi], [Mota_SP]) VALUES (N'SP003     ', N'OPPO Reno7 ', N'DM002     ', N'H000000017', N'GG001     ', N'https://cdn.tgdd.vn/Products/Images/42/274721/TimerThumb/oppo-reno7-4g-(5).jpg', 15000000, 12000000, 50, 100, N'TP.HCM', N'OPPO Reno7 chính hãng')
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiacChi], [Mota_SP]) VALUES (N'SP004     ', N'OPPO A55 ', N'DM002     ', N'H000000017', N'GG001     ', N'https://cdn.tgdd.vn/Products/Images/42/249944/TimerThumb/oppo-a55-4g-(11).jpg', 4000000, 3000000, 200, 250, N'TP.HCM', N'OPPO A55 chính hãng')
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiacChi], [Mota_SP]) VALUES (N'SP005     ', N'OPPO Find X5', N'DM002     ', N'H000000017', N'GG001     ', N'https://cdn.tgdd.vn/Products/Images/42/250622/TimerThumb/oppo-find-x5-pro-(3).jpg', 27000000, 25000000, 30, 40, N'TP.HCM', N'OPPO Find X5 chính hãng')
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiacChi], [Mota_SP]) VALUES (N'SP006     ', N'Vivo X80', N'DM002     ', N'H000000018', N'GG001     ', N'https://cdn.tgdd.vn/Products/Images/42/253138/vivo-x80-xanh-thumb-600x600.jpg', 20000000, 19000000, 40, 50, N'TP.HCM', N'Vivo X80 chính hãng')
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiacChi], [Mota_SP]) VALUES (N'SP007     ', N'Vivo V25 series', N'DM002     ', N'H000000018', N'GG001     ', N'https://cdn.tgdd.vn/Products/Images/42/283148/vivo-v25-5g-vang-thumb-1-1-600x600.jpg', 10000000, 8000000, 50, 70, N'TP.HCM', N'Vivo V25 series chính hãng')
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiacChi], [Mota_SP]) VALUES (N'SP008     ', N'Vivo Y55', N'DM002     ', N'H000000018', N'GG001     ', N'https://cdn.tgdd.vn/Products/Images/42/278949/vivo-y55-den-thumb-600x600.jpg', 6000000, 5000000, 60, 70, N'TP.HCM', N'Vivo Y55 chính hãng')
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiacChi], [Mota_SP]) VALUES (N'SP009     ', N'Vivo T1 series', N'DM002     ', N'H000000018', N'GG001     ', N'https://cdn.tgdd.vn/Products/Images/42/253137/vivo-t1x-xanh-thumb-600x600.jpg', 5500000, 4000000, 40, 80, N'TP.HCM', N'Vivo T1 series chính hãng')
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiacChi], [Mota_SP]) VALUES (N'SP010     ', N'Xiaomi 12 series', N'DM002     ', N'H000000016', N'GG001     ', N'https://cdn.tgdd.vn/Products/Images/42/234621/Xiaomi-12-xam-thumb-mau-600x600.jpg', 15000000, 14000000, 50, 55, N'TP.HCM', N'Xiaomi 12 series chính hãng')
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiacChi], [Mota_SP]) VALUES (N'SP011     ', N'Xiaomi Redmi Note 11', N'DM002     ', N'H000000016', N'GG001     ', N'https://cdn.tgdd.vn/Products/Images/42/269831/TimerThumb/xiaomi-redmi-note-11-4gb-64gb-(13).jpg', 4500000, 4000000, 80, 100, N'TP.HCM', N'Xiaomi Redmi Note 11 chính hãng')
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiacChi], [Mota_SP]) VALUES (N'SP012     ', N'Xiaomi Redmi 10', N'DM002     ', N'H000000016', N'GG001     ', N'https://cdn.tgdd.vn/Products/Images/42/262004/TimerThumb/xiaomi-redmi-10-2022-(3).jpg', 4000000, 3500000, 200, 250, N'TP.HCM', N'Xiaomi Redmi 10 series chính hãng')
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiacChi], [Mota_SP]) VALUES (N'SP013     ', N'POCO C40', N'DM002     ', N'H000000017', N'GG001     ', N'https://cdn.tgdd.vn/Products/Images/42/277057/TimerThumb/poco-c40-(5).jpg', 3000000, 2500000, 300, 350, N'TP.HCM', N'POCO C40 chính hãng')
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiacChi], [Mota_SP]) VALUES (N'SP014     ', N'Realme 9 series', N'DM002     ', N'H000000015', N'GG001     ', N'https://cdn.tgdd.vn/Products/Images/42/255513/TimerThumb/realme-9-pro-plus-(9).jpg', 9000000, 8000000, 100, 120, N'TP.HCM', N'Realme 9 series chính hãng')
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiacChi], [Mota_SP]) VALUES (N'SP015     ', N'Realme 9 series', N'DM002     ', N'H000000015', N'GG001     ', N'https://cdn.tgdd.vn/Products/Images/42/255513/TimerThumb/realme-9-pro-plus-(9).jpg', 9000000, 8000000, 100, 120, N'TP.HCM', N'Realme 9 series chính hãng')
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiacChi], [Mota_SP]) VALUES (N'SP016     ', N'Realme C33', N'DM002     ', N'H000000015', N'GG001     ', N'https://cdn.tgdd.vn/Products/Images/42/292632/TimerThumb/realme-c33-3gb-(1).jpg', 3000000, 2500000, 100, 150, N'TP.HCM', N'Realme C33 chính hãng')
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiacChi], [Mota_SP]) VALUES (N'SP017     ', N'Realme C33', N'DM002     ', N'H000000015', N'GG001     ', N'https://cdn.tgdd.vn/Products/Images/42/292632/TimerThumb/realme-c33-3gb-(1).jpg', 3000000, 2500000, 100, 150, N'TP.HCM', N'Realme C33 chính hãng')
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiacChi], [Mota_SP]) VALUES (N'SP018     ', N'Nokia G21', N'DM002     ', N'H000000014', N'GG001     ', N'https://cdn.tgdd.vn/Products/Images/42/270207/nokia-g21-xanh-thumb-600x600.jpg', 4000000, 3500000, 100, 200, N'TP.HCM', N'Nokia G21 chính hãng')
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiacChi], [Mota_SP]) VALUES (N'SP019     ', N'Nokia G21', N'DM002     ', N'H000000014', N'GG001     ', N'https://cdn.tgdd.vn/Products/Images/42/270207/nokia-g21-xanh-thumb-600x600.jpg', 4000000, 3500000, 100, 200, N'TP.HCM', N'Nokia G21 chính hãng')
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiacChi], [Mota_SP]) VALUES (N'SP020     ', N'Nokia G21', N'DM002     ', N'H000000014', N'GG001     ', N'https://cdn.tgdd.vn/Products/Images/42/270207/nokia-g21-xanh-thumb-600x600.jpg', 4000000, 3500000, 100, 200, N'TP.HCM', N'Nokia G21 chính hãng')
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiacChi], [Mota_SP]) VALUES (N'SP021     ', N'Nokia 5710', N'DM002     ', N'H000000014', N'GG001     ', N'https://cdn.tgdd.vn/Products/Images/42/286133/nokia-5710-thumb-den-1-600x600.jpg', 1800000, 1300000, 300, 500, N'TP.HCM', N'Nokia 5710 chính hãng')
INSERT [dbo].[QL_TaiKhoan] ([ID_TaiKhoan], [Ten_TaiKhoan], [MatKhau], [GioiTinh], [SDT], [Chuc_Vu], [QuyenDN]) VALUES (N'TK001', N'Admin', N'123456', N'Nam', N'0537612558', N'Quản trị viên', 1)
INSERT [dbo].[QL_TaiKhoan] ([ID_TaiKhoan], [Ten_TaiKhoan], [MatKhau], [GioiTinh], [SDT], [Chuc_Vu], [QuyenDN]) VALUES (N'TK002', N'Nhân viên 01 ', N'123456', N'Nam', N'0537612558', N'Nhân viên', 0)
INSERT [dbo].[ThanhToan] ([ID_ThanhToan], [ID_HDB], [NgayThanhToan], [SoTien], [TrangThai]) VALUES (N'TT001     ', N'SO00000001', CAST(N'2022-11-30' AS Date), NULL, NULL)
ALTER TABLE [dbo].[CT_CTKM]  WITH CHECK ADD  CONSTRAINT [FK_CTKM_KM] FOREIGN KEY([ID_CTKM])
REFERENCES [dbo].[DS_CTKM] ([ID_CTKM])
GO
ALTER TABLE [dbo].[CT_CTKM] CHECK CONSTRAINT [FK_CTKM_KM]
GO
ALTER TABLE [dbo].[CT_CTKM]  WITH CHECK ADD  CONSTRAINT [FK_CTKM_SP] FOREIGN KEY([ID_SanPhamMua])
REFERENCES [dbo].[QL_SanPham] ([ID_SP])
GO
ALTER TABLE [dbo].[CT_CTKM] CHECK CONSTRAINT [FK_CTKM_SP]
GO
ALTER TABLE [dbo].[CT_CTKM]  WITH CHECK ADD  CONSTRAINT [FK_CTKM_SP1] FOREIGN KEY([ID_SanPhamTang])
REFERENCES [dbo].[QL_SanPham] ([ID_SP])
GO
ALTER TABLE [dbo].[CT_CTKM] CHECK CONSTRAINT [FK_CTKM_SP1]
GO
ALTER TABLE [dbo].[Hinh]  WITH CHECK ADD  CONSTRAINT [FK_HINH_SP] FOREIGN KEY([ID_SanPham])
REFERENCES [dbo].[QL_SanPham] ([ID_SP])
GO
ALTER TABLE [dbo].[Hinh] CHECK CONSTRAINT [FK_HINH_SP]
GO
ALTER TABLE [dbo].[QL_BaoHanh]  WITH CHECK ADD  CONSTRAINT [FK_BH_KH] FOREIGN KEY([ID_KhachHang])
REFERENCES [dbo].[QL_KhachHang] ([ID_KhachHang])
GO
ALTER TABLE [dbo].[QL_BaoHanh] CHECK CONSTRAINT [FK_BH_KH]
GO
ALTER TABLE [dbo].[QL_BaoHanh]  WITH CHECK ADD  CONSTRAINT [FK_BH_SP] FOREIGN KEY([ID_SanPham])
REFERENCES [dbo].[QL_SanPham] ([ID_SP])
GO
ALTER TABLE [dbo].[QL_BaoHanh] CHECK CONSTRAINT [FK_BH_SP]
GO
ALTER TABLE [dbo].[QL_CT_HDB]  WITH CHECK ADD  CONSTRAINT [FK_CTB_HDB] FOREIGN KEY([ID_HDB])
REFERENCES [dbo].[QL_HD_Ban] ([ID_HDB])
GO
ALTER TABLE [dbo].[QL_CT_HDB] CHECK CONSTRAINT [FK_CTB_HDB]
GO
ALTER TABLE [dbo].[QL_CT_HDB]  WITH CHECK ADD  CONSTRAINT [FK_CTB_SP] FOREIGN KEY([ID_SP])
REFERENCES [dbo].[QL_SanPham] ([ID_SP])
GO
ALTER TABLE [dbo].[QL_CT_HDB] CHECK CONSTRAINT [FK_CTB_SP]
GO
ALTER TABLE [dbo].[QL_CT_HDN]  WITH CHECK ADD  CONSTRAINT [FK_CTN_GG] FOREIGN KEY([ID_GiamGia])
REFERENCES [dbo].[GiamGia] ([ID_GiamGia])
GO
ALTER TABLE [dbo].[QL_CT_HDN] CHECK CONSTRAINT [FK_CTN_GG]
GO
ALTER TABLE [dbo].[QL_CT_HDN]  WITH CHECK ADD  CONSTRAINT [FK_CTN_HDN] FOREIGN KEY([ID_HDN])
REFERENCES [dbo].[QL_HD_Nhap] ([ID_HDN])
GO
ALTER TABLE [dbo].[QL_CT_HDN] CHECK CONSTRAINT [FK_CTN_HDN]
GO
ALTER TABLE [dbo].[QL_CT_HDN]  WITH CHECK ADD  CONSTRAINT [FK_CTN_SP] FOREIGN KEY([ID_SanPham])
REFERENCES [dbo].[QL_SanPham] ([ID_SP])
GO
ALTER TABLE [dbo].[QL_CT_HDN] CHECK CONSTRAINT [FK_CTN_SP]
GO
ALTER TABLE [dbo].[QL_DanhMuc_SP]  WITH CHECK ADD  CONSTRAINT [FK_DM_N] FOREIGN KEY([ID_Nhom_SP])
REFERENCES [dbo].[QL_Nhom_SP] ([ID_Nhom_SP])
GO
ALTER TABLE [dbo].[QL_DanhMuc_SP] CHECK CONSTRAINT [FK_DM_N]
GO
ALTER TABLE [dbo].[QL_HD_Ban]  WITH CHECK ADD  CONSTRAINT [FK_HDB_KH] FOREIGN KEY([ID_KhachHang])
REFERENCES [dbo].[QL_KhachHang] ([ID_KhachHang])
GO
ALTER TABLE [dbo].[QL_HD_Ban] CHECK CONSTRAINT [FK_HDB_KH]
GO
ALTER TABLE [dbo].[QL_HD_Ban]  WITH CHECK ADD  CONSTRAINT [FK_HDB_PTTT] FOREIGN KEY([ID_PTTT])
REFERENCES [dbo].[PhuongThucThanhToan] ([ID_PTTT])
GO
ALTER TABLE [dbo].[QL_HD_Ban] CHECK CONSTRAINT [FK_HDB_PTTT]
GO
ALTER TABLE [dbo].[QL_HD_Nhap]  WITH CHECK ADD  CONSTRAINT [HDN_NCC] FOREIGN KEY([ID_NCC])
REFERENCES [dbo].[QL_NCC] ([ID_NCC])
GO
ALTER TABLE [dbo].[QL_HD_Nhap] CHECK CONSTRAINT [HDN_NCC]
GO
ALTER TABLE [dbo].[QL_HD_Nhap]  WITH CHECK ADD  CONSTRAINT [HDN_TK] FOREIGN KEY([ID_TaiKhoan])
REFERENCES [dbo].[QL_TaiKhoan] ([ID_TaiKhoan])
GO
ALTER TABLE [dbo].[QL_HD_Nhap] CHECK CONSTRAINT [HDN_TK]
GO
ALTER TABLE [dbo].[QL_Kho]  WITH CHECK ADD  CONSTRAINT [FK_K_SP] FOREIGN KEY([ID_SP])
REFERENCES [dbo].[QL_SanPham] ([ID_SP])
GO
ALTER TABLE [dbo].[QL_Kho] CHECK CONSTRAINT [FK_K_SP]
GO
ALTER TABLE [dbo].[QL_SanPham]  WITH CHECK ADD FOREIGN KEY([ID_Hang])
REFERENCES [dbo].[QL_Hang] ([ID_Hang])
GO
ALTER TABLE [dbo].[QL_SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SP_DM] FOREIGN KEY([ID_DM_SP])
REFERENCES [dbo].[QL_DanhMuc_SP] ([ID_DM_SP])
GO
ALTER TABLE [dbo].[QL_SanPham] CHECK CONSTRAINT [FK_SP_DM]
GO
ALTER TABLE [dbo].[QL_SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SP_GiamGia] FOREIGN KEY([ID_GiamGia])
REFERENCES [dbo].[GiamGia] ([ID_GiamGia])
GO
ALTER TABLE [dbo].[QL_SanPham] CHECK CONSTRAINT [FK_SP_GiamGia]
GO
ALTER TABLE [dbo].[ThanhToan]  WITH CHECK ADD  CONSTRAINT [FK_TT_HDB] FOREIGN KEY([ID_HDB])
REFERENCES [dbo].[QL_HD_Ban] ([ID_HDB])
GO
ALTER TABLE [dbo].[ThanhToan] CHECK CONSTRAINT [FK_TT_HDB]
GO
ALTER TABLE [dbo].[TuVan]  WITH CHECK ADD  CONSTRAINT [FK_TV_KH] FOREIGN KEY([ID_KhachHang])
REFERENCES [dbo].[QL_KhachHang] ([ID_KhachHang])
GO
ALTER TABLE [dbo].[TuVan] CHECK CONSTRAINT [FK_TV_KH]
GO
