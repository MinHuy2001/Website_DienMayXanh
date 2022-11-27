USE [DienThoai]
GO
/****** Object:  Table [dbo].[Hinh]    Script Date: 11/26/2022 11:11:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hinh](
	[ID_HinhAnh] [char](10) NULL,
	[ID_SanPham] [char](5) NULL,
	[HINH_SP] [nvarchar](500) NULL,
	[HienThi] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QL_SanPham]    Script Date: 11/26/2022 11:11:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QL_SanPham](
	[ID_SP] [char](5) NOT NULL,
	[TenSP] [nvarchar](20) NULL,
	[ID_DM_SP] [char](5) NOT NULL,
	[ID_Hang] [char](5) NOT NULL,
	[ID_Kho] [char](5) NULL,
	[ID_GiamGia] [char](10) NOT NULL,
	[HINH_SP] [nvarchar](500) NULL,
	[DG_Ban] [float] NULL,
	[DG_Nhap] [float] NULL,
	[SL_SP] [int] NULL,
	[SL_SPTon] [int] NULL,
	[DiaChi] [nvarchar](20) NULL,
	[Mota_SP] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_SP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_Kho], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiaChi], [Mota_SP]) VALUES (N'1111 ', N'IPhone 14', N'1110 ', N'1100 ', N'1000 ', N'          ', N'https://cdn.tgdd.vn/Products/Images/42/240259/TimerThumb/iphone-14-(1).jpg', 32000000, 30000000, 20, 22, N'TP.HCM', N'IPhone 14 chính hãng tại Điện Máy Xanh')
GO
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_Kho], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiaChi], [Mota_SP]) VALUES (N'1211 ', N'Samsung Galaxy S22', N'1210 ', N'1200 ', N'1000 ', N'          ', N'https://cdn.tgdd.vn/Products/Images/42/271695/TimerThumb/samsung-galaxy-s22-256gb-(1).jpg', 29000000, 25000000, 30, 33, N'Hà Nội', N'Samsung Galaxy S22 Ultra chính hãng tại ĐMX')
GO
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_Kho], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiaChi], [Mota_SP]) VALUES (N'1311 ', N'OPPO Reno7 ', N'1310 ', N'1300 ', N'1000 ', N'          ', N'https://cdn.tgdd.vn/Products/Images/42/274721/TimerThumb/oppo-reno7-4g-(5).jpg', 15000000, 12000000, 50, 100, N'TP.HCM', N'OPPO Reno7 chính hãng')
GO
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_Kho], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiaChi], [Mota_SP]) VALUES (N'1312 ', N'OPPO A55 ', N'1310 ', N'1300 ', N'1000 ', N'          ', N'https://cdn.tgdd.vn/Products/Images/42/249944/TimerThumb/oppo-a55-4g-(11).jpg', 4000000, 3000000, 200, 250, N'TP.HCM', N'OPPO A55 chính hãng')
GO
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_Kho], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiaChi], [Mota_SP]) VALUES (N'1313 ', N'OPPO Find X5', N'1310 ', N'1300 ', N'1000 ', N'          ', N'https://cdn.tgdd.vn/Products/Images/42/250622/TimerThumb/oppo-find-x5-pro-(3).jpg', 27000000, 25000000, 30, 40, N'TP.HCM', N'OPPO Find X5 chính hãng')
GO
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_Kho], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiaChi], [Mota_SP]) VALUES (N'1411 ', N'Vivo X80', N'1410 ', N'1400 ', N'1000 ', N'          ', N'https://cdn.tgdd.vn/Products/Images/42/253138/vivo-x80-xanh-thumb-600x600.jpg', 20000000, 19000000, 40, 50, N'TP.HCM', N'Vivo X80 chính hãng')
GO
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_Kho], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiaChi], [Mota_SP]) VALUES (N'1412 ', N'Vivo V25 series', N'1410 ', N'1400 ', N'1000 ', N'          ', N'https://cdn.tgdd.vn/Products/Images/42/283148/vivo-v25-5g-vang-thumb-1-1-600x600.jpg', 10000000, 8000000, 50, 70, N'TP.HCM', N'Vivo V25 series chính hãng')
GO
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_Kho], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiaChi], [Mota_SP]) VALUES (N'1413 ', N'Vivo Y55', N'1410 ', N'1400 ', N'1000 ', N'          ', N'https://cdn.tgdd.vn/Products/Images/42/278949/vivo-y55-den-thumb-600x600.jpg', 6000000, 5000000, 60, 70, N'TP.HCM', N'Vivo Y55 chính hãng')
GO
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_Kho], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiaChi], [Mota_SP]) VALUES (N'1414 ', N'Vivo T1 series', N'1410 ', N'1400 ', N'1000 ', N'          ', N'https://cdn.tgdd.vn/Products/Images/42/253137/vivo-t1x-xanh-thumb-600x600.jpg', 5500000, 4000000, 40, 80, N'TP.HCM', N'Vivo T1 series chính hãng')
GO
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_Kho], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiaChi], [Mota_SP]) VALUES (N'1511 ', N'Xiaomi 12 series', N'1510 ', N'1500 ', N'1000 ', N'          ', N'https://cdn.tgdd.vn/Products/Images/42/234621/Xiaomi-12-xam-thumb-mau-600x600.jpg', 15000000, 14000000, 50, 55, N'TP.HCM', N'Xiaomi 12 series chính hãng')
GO
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_Kho], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiaChi], [Mota_SP]) VALUES (N'1512 ', N'Xiaomi Redmi Note 11', N'1510 ', N'1500 ', N'1000 ', N'          ', N'https://cdn.tgdd.vn/Products/Images/42/269831/TimerThumb/xiaomi-redmi-note-11-4gb-64gb-(13).jpg', 4500000, 4000000, 80, 100, N'TP.HCM', N'Xiaomi Redmi Note 11 chính hãng')
GO
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_Kho], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiaChi], [Mota_SP]) VALUES (N'1513 ', N'Xiaomi Redmi 10', N'1510 ', N'1500 ', N'1000 ', N'          ', N'https://cdn.tgdd.vn/Products/Images/42/262004/TimerThumb/xiaomi-redmi-10-2022-(3).jpg', 4000000, 3500000, 200, 250, N'TP.HCM', N'Xiaomi Redmi 10 series chính hãng')
GO
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_Kho], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiaChi], [Mota_SP]) VALUES (N'1514 ', N'POCO C40', N'1510 ', N'1500 ', N'1000 ', N'          ', N'https://cdn.tgdd.vn/Products/Images/42/277057/TimerThumb/poco-c40-(5).jpg', 3000000, 2500000, 300, 350, N'TP.HCM', N'POCO C40 chính hãng')
GO
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_Kho], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiaChi], [Mota_SP]) VALUES (N'1611 ', N'Realme 9 series', N'1610 ', N'1600 ', N'1000 ', N'          ', N'https://cdn.tgdd.vn/Products/Images/42/255513/TimerThumb/realme-9-pro-plus-(9).jpg', 9000000, 8000000, 100, 120, N'TP.HCM', N'Realme 9 series chính hãng')
GO
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_Kho], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiaChi], [Mota_SP]) VALUES (N'1612 ', N'Realme 8 series', N'1610 ', N'1600 ', N'1000 ', N'          ', N'https://cdn.tgdd.vn/Products/Images/42/233135/realme-8-silver-600x600.jpg', 6000000, 5000000, 90, 100, N'TP.HCM', N'Realme 8 series chính hãng')
GO
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_Kho], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiaChi], [Mota_SP]) VALUES (N'1613 ', N'Realme C33', N'1610 ', N'1600 ', N'1000 ', N'          ', N'https://cdn.tgdd.vn/Products/Images/42/292632/TimerThumb/realme-c33-3gb-(1).jpg', 3000000, 2500000, 100, 150, N'TP.HCM', N'Realme C33 chính hãng')
GO
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_Kho], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiaChi], [Mota_SP]) VALUES (N'1614 ', N'Realme C11 series', N'1610 ', N'1600 ', N'1000 ', N'          ', N'https://cdn.tgdd.vn/Products/Images/42/261957/realme-c11-2021-2gb-32gb-xanh-600x600.jpg', 2300000, 2000000, 100, 130, N'TP.HCM', N'Realme C11 series chính hãng')
GO
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_Kho], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiaChi], [Mota_SP]) VALUES (N'1711 ', N'Nokia G21', N'1710 ', N'1700 ', N'1000 ', N'          ', N'https://cdn.tgdd.vn/Products/Images/42/270207/nokia-g21-xanh-thumb-600x600.jpg', 4000000, 3500000, 100, 200, N'TP.HCM', N'Nokia G21 chính hãng')
GO
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_Kho], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiaChi], [Mota_SP]) VALUES (N'1712 ', N'Nokia G11 Plus', N'1710 ', N'1700 ', N'1000 ', N'          ', N'https://cdn.tgdd.vn/Products/Images/42/281827/nokia-g11-plus-xam-thumb-600x600.jpg', 2700000, 2000000, 50, 90, N'TP.HCM', N'Nokia G11 Plus chính hãng')
GO
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_Kho], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiaChi], [Mota_SP]) VALUES (N'1713 ', N'Nokia C31 series', N'1710 ', N'1700 ', N'1000 ', N'          ', N'https://cdn.tgdd.vn/Products/Images/42/292717/TimerThumb/nokia-c31-3gb-(1).jpg', 2700000, 2000000, 100, 150, N'TP.HCM', N'Nokia C31 series chính hãng')
GO
INSERT [dbo].[QL_SanPham] ([ID_SP], [TenSP], [ID_DM_SP], [ID_Hang], [ID_Kho], [ID_GiamGia], [HINH_SP], [DG_Ban], [DG_Nhap], [SL_SP], [SL_SPTon], [DiaChi], [Mota_SP]) VALUES (N'1714 ', N'Nokia 5710', N'1710 ', N'1700 ', N'1000 ', N'          ', N'https://cdn.tgdd.vn/Products/Images/42/286133/nokia-5710-thumb-den-1-600x600.jpg', 1800000, 1300000, 300, 500, N'TP.HCM', N'Nokia 5710 chính hãng')
GO
ALTER TABLE [dbo].[Hinh]  WITH CHECK ADD FOREIGN KEY([ID_SanPham])
REFERENCES [dbo].[QL_SanPham] ([ID_SP])
GO
