create database QL_DMX

create table QL_TaiKhoan
(	
	ID_TaiKhoan varchar(20) not null primary key,
	Ten_TaiKhoan nvarchar(20),
	MatKhau varchar(10),
	GioiTinh nvarchar(5),
	SDT varchar(11),
	Chuc_Vu nvarchar(20),
	QuyenDN bit,
)

create table QL_Hang
(
	ID_Hang char(10) not null primary key,
	TenHang nvarchar(20),
)
create table QL_Nhom_SP
(
	ID_Nhom_SP char(10) not null primary key,
	Ten_Nhom nvarchar(20),
	
)
create table QL_DanhMuc_SP
(
	ID_DM_SP char(10) not null primary key,
	Ten_DanhMuc nvarchar(20),
	ID_Nhom_SP char(10)
)
ALTER TABLE QL_DanhMuc_SP ADD CONSTRAINT FK_DM_N FOREIGN KEY (ID_Nhom_SP) REFERENCES QL_Nhom_SP(ID_Nhom_SP)
create table GiamGia
(
	ID_GiamGia char(10) not null primary key,
	Ten_GiamGia nvarchar(100),
	MoTa nvarchar(200),
	MucGiamGia float,
	NgayBD date,
	NgayKT date,
	HienThi bit,

)
--ALTER TABLE GiamGia
--ALTER COLUMN MoTa nvarchar(200)

create table QL_SanPham
(
	ID_SP char(10) not null primary key,
	TenSP nvarchar(500),
	ID_DM_SP char(10) not null,
	ID_Hang char(10) not null,
	--ID_Kho char(10),
	ID_GiamGia char(10),
	HINH_SP nvarchar(1000),
	DG_Ban float,
	DG_Nhap float,
	SL_SP int,
	SL_SPTon int,
	DiacChi nvarchar(500),
	Mota_SP text
)
ALTER TABLE QL_SanPham ADD CONSTRAINT FK_SP_DM FOREIGN KEY (ID_DM_SP) REFERENCES QL_DanhMuc_SP(ID_DM_SP)
ALTER TABLE QL_SanPham ADD FOREIGN KEY (ID_Hang) REFERENCES QL_Hang(ID_Hang)
--ALTER TABLE QL_SanPham ADD FOREIGN KEY (ID_Kho) REFERENCES QL_Kho(ID_Kho)
ALTER TABLE QL_SanPham ADD CONSTRAINT FK_SP_GiamGia FOREIGN KEY (ID_GiamGia) REFERENCES GiamGia (ID_GiamGia)


create table QL_Kho
(
	ID_Kho char(10) not null primary key,
	ID_SP char(10),
	TenKho nvarchar(20),
	SoLuongMax int,
	SL_Nhap int, --Tôngt số lượng lúc nhập số này chỉ thay đổi khi nhập hàng vào và set điều kiện khi SL tồn còn dưới 50% thì mới cho nhập hàng vào
	SL_Ton int,	 --SL tồn là khi bán ra lấy sl sp - cho sp bán = tồn--
	DiaChi nvarchar(20),
)

ALTER TABLE QL_Kho ADD CONSTRAINT FK_K_SP FOREIGN KEY (ID_SP) REFERENCES QL_SanPham(ID_SP)


create table QL_KhachHang
(
	ID_KhachHang char(10) not null primary key,
	Ten_KhachHang nvarchar(20),
	SDT char(10),
	DiaChi nvarchar(20),
)


create table TuVan
(
	ID_CauHoi char(10)not null primary key,
	NoiDung nvarchar (50),
	ID_KhachHang char(10),
	LoaiCauHoi nvarchar(20),
	ThoiGianTraLoi date,
)
ALTER TABLE TuVan ADD CONSTRAINT FK_TV_KH FOREIGN KEY (ID_KhachHang) REFERENCES QL_KhachHang(ID_KhachHang)



create table  PhuongThucThanhToan
(
	ID_PTTT char(10) not null primary key,
	Ten_PTTT nvarchar(50),
	Mota nvarchar(500),
	HienThi bit
)
create table QL_HD_Ban
(
	ID_HDB  char(10) not null primary key,
	ID_KhachHang char(10) not null,
	ID_PTTT char(10),
	DC_GiaoHang nvarchar(500),
	NgayGiaoHang date,
	Ngay_Lap date,
	TrangThaiTT bit,
	TrangThaiGiaoHang nvarchar (20),
	
)


ALTER TABLE QL_HD_Ban ADD CONSTRAINT FK_HDB_KH FOREIGN KEY (ID_KhachHang) REFERENCES QL_KhachHang (ID_KhachHang)
ALTER TABLE QL_HD_Ban ADD CONSTRAINT FK_HDB_PTTT FOREIGN KEY (ID_PTTT) REFERENCES PhuongThucThanhToan(ID_PTTT)
create table QL_CT_HDB
(
	ID_CT_HDB char(10) primary key,
	ID_HDB char(10) not null,
	ID_SP char(10) not null,
	So_Luong int,
	DonGia float,
	Giam_Gia float,
	Tong_Tien float,
)
ALTER TABLE QL_CT_HDB ADD CONSTRAINT FK_CTB_SP FOREIGN KEY (ID_SP) REFERENCES QL_SanPham(ID_SP)
ALTER TABLE QL_CT_HDB ADD CONSTRAINT FK_CTB_HDB FOREIGN KEY (ID_HDB) REFERENCES QL_HD_Ban(ID_HDB)

create table ThanhToan
(
	ID_ThanhToan char (10) not null primary key,	
	ID_HDB char(10),
	NgayThanhToan date,
	SoTien float,
	TrangThai nvarchar (50)

)
--ALTER TABLE ThanhToan ADD FOREIGN KEY (UserName) REFERENCES QL_TaiKhoan(UserName)
ALTER TABLE ThanhToan ADD CONSTRAINT FK_TT_HDB FOREIGN KEY (ID_HDB) REFERENCES QL_HD_Ban(ID_HDB)

create table QL_NCC
(
	ID_NCC char(10) not null primary key,
	Ten_NCC nvarchar(50),
	DiaChi nvarchar(50),
	mail_NCC varchar(50),
)


create table QL_HD_Nhap
(
	ID_HDN char(10) not null primary key,
	ID_NCC char(10) not null,
	ID_TaiKhoan varchar(20) not null,
	Ngay_Nhap date,
	Tong_SL int,
	Thanh_Toan float,
)
ALTER TABLE QL_HD_Nhap ADD CONSTRAINT HDN_NCC FOREIGN KEY (ID_NCC) REFERENCES QL_NCC(ID_NCC)
ALTER TABLE QL_HD_Nhap ADD CONSTRAINT HDN_TK FOREIGN KEY (ID_TaiKhoan) REFERENCES QL_TaiKhoan(ID_TaiKhoan)
create table QL_CT_HDN
(
	ID_CT_HDN char(10) not null primary key,
	ID_HDN char(10) not null ,
	ID_SanPham char(10) not null,
	ID_GiamGia char(10) not null,
	So_Luong int,
	Don_Gia float,
	Giam_Gia float,
	Tong_Tien float,
)
ALTER TABLE QL_CT_HDN ADD CONSTRAINT FK_CTN_SP FOREIGN KEY (ID_SanPham) REFERENCES QL_SanPham(ID_SP)
ALTER TABLE QL_CT_HDN ADD CONSTRAINT FK_CTN_HDN FOREIGN KEY (ID_HDN) REFERENCES QL_HD_Nhap(ID_HDN)
ALTER TABLE QL_CT_HDN ADD CONSTRAINT FK_CTN_GG FOREIGN KEY (ID_GiamGia) REFERENCES GiamGia(ID_GiamGia)
create table QL_BaoHanh
(
	ID_BaoHanh char(10) not null,
	ID_SanPham char(10) not null,
	TenSP nvarchar(20),
	ID_KhachHang char(10),
	SDT char(10),
	HanBH int,
	NgayBH date,

)

ALTER TABLE QL_BaoHanh ADD CONSTRAINT FK_BH_KH FOREIGN KEY (ID_KhachHang) REFERENCES QL_KhachHang (ID_KhachHang)
ALTER TABLE QL_BaoHanh ADD CONSTRAINT FK_BH_SP FOREIGN KEY (ID_SanPham) REFERENCES QL_SanPham(ID_SP)
create table DS_CTKM
(
	ID_CTKM char(10) not null primary key,
	Ten_CTKM nvarchar(50),
	Ngay_BD date,
	Ngay_KT date,
)
create table CT_CTKM
(
	ID_CTKM char(10),
	ID_SanPhamMua char(10),
	ID_SanPhamTang char (10),
	Khac nvarchar(500),
	MoTa nvarchar(500),
	HienThi bit,
)
ALTER TABLE CT_CTKM ADD CONSTRAINT FK_CTKM_KM FOREIGN KEY (ID_CTKM) REFERENCES DS_CTKM (ID_CTKM)
ALTER TABLE CT_CTKM ADD CONSTRAINT FK_CTKM_SP FOREIGN KEY (ID_SanPhamMua) REFERENCES QL_SanPham(ID_SP)
ALTER TABLE CT_CTKM ADD CONSTRAINT FK_CTKM_SP1 FOREIGN KEY (ID_SanPhamTang) REFERENCES QL_SanPham(ID_SP)
create table Hinh
(
	ID_HinhAnh char(10),
	ID_SanPham char(10),
	HINH_SP nvarchar(500),
	HienThi bit,
)
ALTER TABLE Hinh ADD CONSTRAINT FK_HINH_SP FOREIGN KEY (ID_SanPham) REFERENCES QL_SanPham(ID_SP)


--=====================================FUNCTION=====================================
-- Function tăng dần

Create function FUNC_AutoID (@Full_ID varchar(10), @First_ID varchar(2),@Size int)
	Returns varchar(10)
 As
	Begin
		If (@Full_ID = '')
			set @Full_ID = @First_ID + REPLICATE (0,@Size -LEN (@First_ID))
		declare @Next_ID varchar(10),@Num_Next_ID int
		set @Full_ID=LTRIM(RTRIM(@Full_ID))
		set @Num_Next_ID= REPLACE (@Full_ID,@First_ID,'')+1
		set @Size = @Size -LEN(@First_ID)
		set @Next_ID=@First_ID +REPLICATE(0,@Size - LEN (@First_ID))
		set @Next_ID=@First_ID + RIGHT(REPLICATE(0,@Size)+ CONVERT (VARCHAR(MAX), @Num_Next_ID),@Size)
		return @Next_ID

	END
Go 

--=====================================INSERT DATA=====================================

--KHO
--Create trigger TG_Auto_KhoID on QL_Kho
--for insert
--as
--	begin
--		declare @Full_ID varchar(10)
--		Set @Full_ID = (Select Top 1 ID_Kho from QL_Kho order by ID_Kho desc)
--		Update QL_Kho set ID_Kho = dbo.FUNC_AutoID (@Full_ID,'K',10) where ID_Kho =''
--	end
--go

--HANG

Create trigger TG_Auto_HangID on QL_Hang
for insert
as
	begin
		declare @Full_ID varchar(10)
		Set @Full_ID = (Select Top 1 ID_Hang from QL_Hang order by ID_Hang desc)
		Update QL_Hang set ID_Hang = dbo.FUNC_AutoID (@Full_ID,'H',10) where ID_Hang =''
	end
go


INSERT INTO QL_Hang
VALUES
('',N'SAMSUNG')
INSERT INTO QL_Hang
VALUES
('',N'SONY')
INSERT INTO QL_Hang
VALUES
('',N'LG')
INSERT INTO QL_Hang
VALUES
('',N'AQUA')
INSERT INTO QL_Hang
VALUES
('',N'SHARP')
INSERT INTO QL_Hang
VALUES
('',N'TOSHIBA')
INSERT INTO QL_Hang
VALUES
('',N'TCL')
INSERT INTO QL_Hang
VALUES
('',N'PANASONIC')
INSERT INTO QL_Hang
VALUES
('',N'HITACHI')
INSERT INTO QL_Hang
VALUES
('',N'DAIKIN')
INSERT INTO QL_Hang
VALUES
('',N'CASPER')
INSERT INTO QL_Hang
VALUES
('',N'FUNIKI')
INSERT INTO QL_Hang
VALUES
('',N'APPLE')
INSERT INTO QL_Hang
VALUES
('',N'NOKIA')
INSERT INTO QL_Hang
VALUES
('',N'OPPO')
INSERT INTO QL_Hang
VALUES
('',N'VIVO')
INSERT INTO QL_Hang
VALUES
('',N'REALME')
INSERT INTO QL_Hang
VALUES
('',N'XIAOMI')

--delete from QL_Hang
select * from QL_Hang order by QL_Hang.ID_Hang asc


 --Nhóm sản phẩm


--drop trigger TG_Auto_NhomSP_ID
 INSERT INTO QL_Nhom_SP
 VALUES
 ('N0001',N'Điện tử')
 INSERT INTO QL_Nhom_SP
 VALUES
 ('N0002',N'Điện lạnh')
  INSERT INTO QL_Nhom_SP
 VALUES
 ('N0003',N'Gia dụng')

 
 select * from QL_Nhom_SP order by QL_Nhom_SP.ID_Nhom_SP asc

--Danh Mục sản phẩm

INSERT INTO QL_DanhMuc_SP
VALUES
('DM001',N'Tivi','N0001'),
('DM002',N'Điện thoại','N0001'),
('DM003',N'Laptop','N0001'),
('DM004',N'Tablet','N0001'),
('DM005',N'Đồng hồ thông minh','N0001'),
('DM006',N'Loa,Dàn Karaok','N0001'),
('DM007',N'Máy lạnh','N0002'),
('DM008',N'Máy giặt','N0002'),
('DM009',N'Máy sấy quần áo','N0002'),
('DM010',N'Tủ lạnh','N0002'),
('DM011',N'Tủ đông','N0002'),
('DM012',N'Tủ mát','N0002'),
('DM013',N'Máy nước nóng','N0002'),
('DM014',N'Nấu nướng, chế biến','N0003'),
('DM015',N'Nhà cửa, điện đớm','N0003'),
('DM016',N'Làm đẹp, sức khỏe','N0003'),
('DM017',N'Xay ép pha chế','N0003'),
('DM018',N'Chăm sóc mẹ và bé','N0003'),
('DM019',N'Dụng cụ bàn ăn','N0003'),
('DM020',N'Dụng cụ sửa chữa','N0003')


 select * from QL_DanhMuc_SP
 --Tài khoản
 INSERT INTO QL_TaiKhoan
 VALUES
('TK001',N'Admin','123456',N'Nam','0537612558',N'Quản trị viên',1),
('TK002',N'Nhân viên 01 ','123456',N'Nam','0537612558',N'Nhân viên',0)


--DROP TRIGGER TG_Auto_HDNID

--Nhà cung cấp
INSERT INTO QL_NCC
VALUES
('NCC01',N'Petrosetco',N'Quận 1-TP.HCM',N'info@petrosetco.com.vn')

 ---Hóa đơn nhập
 Create trigger TG_Auto_HDNID on QL_HD_Nhap
for insert
as
	begin
		declare @Full_ID varchar(10)
		Set @Full_ID = (Select Top 1 ID_HDN from QL_HD_Nhap order by ID_HDN desc)
		Update QL_HD_Nhap set ID_HDN = dbo.FUNC_AutoID (@Full_ID,'IN',10) where ID_HDN =''
	end
go

SET DATEFORMAT DMY
INSERT INTO QL_HD_Nhap
VALUES
('','NCC01','TK001','27/11/2022',NULL,NULL)
INSERT INTO QL_HD_Nhap
VALUES
('','NCC01','TK001','27/11/2022',NULL,NULL) 


select * from QL_HD_Nhap


--=====Giảm giá
INSERT INTO GiamGia
VALUES
('GG001',N'THÁNG TRI ÂN- LAPTOP CPU INTEL',N'Mừng tháng tri ân, Laptop CPU Intel săn coupon giảm đến 500k',500000,'14/11/2022','20/11/2022',1)

--======Sản phẩm

INSERT INTO QL_SanPham
VALUES
--IPhone--
('IP001',N'IPhone 14','DM002','H000000013','GG001', 'https://cdn.tgdd.vn/Products/Images/42/240259/iPhone-14-thumb-tim-1-600x600.jpg', 32000000, 30000000, 20, 22, N'TP.HCM', N'iPhone 14 128GB có lẽ không còn là cái tên xa lạ đối với người dùng bởi độ nổi tiếng phải nói là cực hot, đây gần như là cái tên xuất hiện trên nhiều mặt báo điện tử kể từ ngày ra mắt sản phẩm. Máy được trang bị bên trong cấu hình có hiệu năng khủng, một bộ camera chất lượng cùng với công nghệ màn hình cao cấp.'),	
('IP002',N'IPhone 11','DM002','H000000013','GG001', 'https://cdn.tgdd.vn/Products/Images/42/153856/iphone-11-trang-600x600.jpg', 22000000, 20000000, 20, 22, N'TP.HCM', N'Sau chiếc điện thoại iPhone Xr, Apple tiếp tục ra mắt siêu phẩm 2019 mang tên iPhone 11 64GB - một smartphone được nâng cấp toàn diện từ thiết kế cao cấp, vi xử lý hiệu năng mạnh mẽ đến hệ thống camera chất lượng cùng thời lượng pin vượt trội.'),	
('IP003',N'IPhone 13 Pro Max','DM002','H000000013','GG001', 'https://cdn.tgdd.vn/Products/Images/42/250262/iphone-13-pro-max-graphite-600x600.jpg', 32000000, 30000000, 20, 22, N'TP.HCM', N'iPhone 13 Pro Max 512GB của nhà Apple với màn hình ProMotion 120 Hz vượt trội, chip A15 Bionic hiệu năng mạnh mẽ, viên pin trâu nhất trong những chiếc iPhone và bộ 3 camera được nâng cấp đáng kể, xứng đáng là chiếc điện thoại thông minh được quan tâm nhất năm 2021.'),	
('IP004',N'IPhone 14 Pro Max','DM002','H000000013','GG001', 'https://cdn.tgdd.vn/Products/Images/42/289700/iphone-14-pro-max-vang-thumb-600x600.jpg', 32000000, 30000000, 20, 22, N'TP.HCM', N'Điểm nhấn của sự kiện ra mắt sản phẩm tháng 9/2022 của Apple chính là siêu phẩm iPhone 14 Pro Max 128GB với thiết kế mặt trước đổi mới, camera nâng cấp mạnh mẽ và hiệu năng bùng nổ từ chip A16 Bionic, đáp ứng mọi nhu cầu của người dùng.'),	
('IP005',N'IPhone 14 Pro','DM002','H000000013','GG001', 'https://cdn.tgdd.vn/Products/Images/42/247508/iphone-14-pro-bac-thumb-600x600.jpg', 32000000, 30000000, 20, 22, N'TP.HCM', N'So với phiên bản tiền nhiệm, thiết kế bên ngoài chiếc iPhone 14 Pro này không khác biệt quá nhiều. Khung viền phẳng sử dụng chất liệu thép không gỉ cứng cáp vừa thể hiện sự sang trọng cho thiết bị vừa giúp bảo vệ điện thoại hiệu quả.'),	
('IP006',N'IPhone 13 Pro','DM002','H000000013','GG001', 'https://cdn.tgdd.vn/Products/Images/42/250260/iphone-13-pro-graphite-600x600.jpg', 32000000, 30000000, 20, 22, N'TP.HCM', N'IPhone 14 chính hãng tại Điện Máy Xanh'),	
('IP007',N'IPhone 14 Plus','DM002','H000000013','GG001', 'https://cdn.tgdd.vn/Products/Images/42/245545/iPhone-14-plus-thumb-den-600x600.jpg', 32000000, 30000000, 20, 22, N'TP.HCM', N'IPhone 14 chính hãng tại Điện Máy Xanh'),	
('IP008',N'IPhone 12 Mini','DM002','H000000013','GG001', 'https://cdn.tgdd.vn/Products/Images/42/228742/iphone-12-mini-do-600x600.jpeg', 32000000, 30000000, 20, 22, N'TP.HCM', N'IPhone 14 chính hãng tại Điện Máy Xanh'),	
('IP009',N'IPhone 13','DM002','H000000013','GG001', 'https://cdn.tgdd.vn/Products/Images/42/223602/iphone-13-starlight-1-600x600.jpg', 32000000, 30000000, 20, 22, N'TP.HCM', N'IPhone 14 chính hãng tại Điện Máy Xanh'),	
('IP010',N'IPhone 13 Mini','DM002','H000000013','GG001', 'https://cdn.tgdd.vn/Products/Images/42/236780/iphone-13-mini-pink-1-600x600.jpg', 32000000, 30000000, 20, 22, N'TP.HCM', N'IPhone 14 chính hãng tại Điện Máy Xanh'),	
('IP011',N'IPhone 12','DM002','H000000013','GG001', 'https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-tim-1-600x600.jpg', 32000000, 30000000, 20, 22, N'TP.HCM', N'IPhone 14 chính hãng tại Điện Máy Xanh'),	
('IP012',N'IPhone 12','DM002','H000000013','GG001', 'https://cdn.tgdd.vn/Products/Images/42/244141/iphone-se-black-600x600.jpeg', 32000000, 30000000, 20, 22, N'TP.HCM', N'IPhone 14 chính hãng tại Điện Máy Xanh'),	

--Samsung--
('SS001', N'Samsung Galaxy S22 Ultra 5G','DM002','H000000001','GG001', N'https://cdn.tgdd.vn/Products/Images/42/235838/Galaxy-S22-Ultra-Burgundy-600x600.jpg', 29000000, 25000000, 30, 33, N'Hà Nội', N'Được cho ra mắt vào tháng 02/2022, Samsung Galaxy S22 Ultra 5G gây sốt trong cộng đồng công nghệ bởi hiệu năng mạnh mẽ, thiết kế đẳng cấp sang trọng cùng nhiều tiện ích do bút S Pen mang lại.'),
('SS002', N'Samsung Galaxy A13','DM002','H000000001','GG001', N'https://cdn.tgdd.vn/Products/Images/42/274360/samsung-galaxy-a13-xanh-thumb-1-600x600.jpg', 29000000, 25000000, 30, 33, N'Hà Nội', N'Samsung Galaxy A13 6GB ra mắt với một thiết kế đầy trẻ trung và năng động, cùng với đó là hiệu năng ổn định giúp bạn có được những trải nghiệm mượt mà cho các công việc lướt web, xem phim, nghe nhạc hay chơi được các tựa game hiện hành.'),
('SS003', N'Samsung Galaxy A23','DM002','H000000001','GG001', N'https://cdn.tgdd.vn/Products/Images/42/262650/samsung-galaxy-a23-cam-thumb-600x600.jpg', 29000000, 25000000, 30, 33, N'Hà Nội', N'Samsung Galaxy A23 4GB - chiếc điện thoại được Samsung cho ra mắt thời gian gần đây với thông số sẽ làm mọi người hài lòng với dung lượng pin cao, màn hình lớn và camera độ phân giải tốt.'),
('SS004', N'Samsung Galaxy Z Fold4 5G','DM002','H000000001','GG001', N'https://cdn.tgdd.vn/Products/Images/42/250625/samsung-galaxy-z-fold4-kem-256gb-600x600.jpg', 29000000, 25000000, 30, 33, N'Hà Nội', N'Sau bao lời đồn đoán về ngoại hình cùng bộ thông số thì mới đây chiếc Samsung Galaxy Z Fold4 5G 256GB cũng đã chính thức lộ diện qua sự kiện Unpacked thường niên của Samsung. Với độ bền bỉ gia tăng cùng sự nâng cấp đáng kể về hiệu năng giúp cho thiết bị có khả xử lý mượt mà nhiều tác vụ hay chơi game cấu hình cao mượt mà.'),
('SS005', N'Samsung Galaxy Z Fold3 5G','DM002','H000000001','GG001', N'https://cdn.tgdd.vn/Products/Images/42/226935/samsung-galaxy-z-fold-3-silver-1-600x600.jpg', 29000000, 25000000, 30, 33, N'Hà Nội', N'Samsung chính thức tung ra mẫu điện thoại cao cấp Samsung Galaxy Z Fold3 5G. Chiếc flagship này không chỉ mang đến một trải nghiệm hiệu năng tiên tiến, mà còn có màn hình vô cực liền mạch, hỗ trợ bút S Pen trên màn hình gập lần đầu tiên xuất hiện, mở ra chương mới của sáng tạo công nghệ di động.'),
('SS006', N'Samsung Galaxy S22+ 5G','DM002','H000000001','GG001', N'https://cdn.tgdd.vn/Products/Images/42/242439/Galaxy-S22-Plus-White-600x600.jpg', 29000000, 25000000, 30, 33, N'Hà Nội', N'Samsung Galaxy S22+ - chiếc điện thoại cao cấp mà nhà Samsung cho ra mắt vào 03/2022, máy trang bị bộ thông số ấn tượng với con chip Snapdragon 8 Gen 1 mạnh mẽ, màn hình Dynamic AMOLED 2X rực rỡ, điều này hứa hẹn mang lại trải nghiệm vượt xa những gì bạn tưởng tượng.'),
('SS007', N'Samsung Galaxy Z Flip4 5G','DM002','H000000001','GG001', N'https://cdn.tgdd.vn/Products/Images/42/258047/samsung-galaxy-z-flip4-5g-128gb-thumb-tim-600x600.jpg', 29000000, 25000000, 30, 33, N'Hà Nội', N'Vào ngày 10/08 chiếc điện thoại Samsung Galaxy Z Flip4 128GB cũng đã chính thức ra mắt và cũng là hồi kết cho nhiều lời đồn đoán về thông số của chiếc máy. Sở hữu bên trong nhiều công nghệ hàng đầu cùng diện mạo độc đáo với cơ chế gấp gọn, hứa hẹn đây sẽ là sản phẩm được săn đón rất nhiều trong khoảng thời gian nửa cuối năm 2022.'),
('SS008', N'Samsung Galaxy S22 5G','DM002','H000000001','GG001', N'https://cdn.tgdd.vn/Products/Images/42/231110/Galaxy-S22-Black-600x600.jpg', 29000000, 25000000, 30, 33, N'Hà Nội', N'Samsung Galaxy S22 trình làng với diện mạo cực kì trẻ trung - hiện đại, kiểu dáng thiết kế phẳng bắt kịp xu hướng, sở hữu trên mình màn hình hiển thị cực kỳ chi tiết cùng tần số quét 120 Hz, chụp ảnh sắc nét với cụm camera 50 MP và trải nghiệm chơi game mượt mà nhờ bộ xử lý hàng đầu đến từ nhà Qualcomm.'),
('SS009', N'Samsung Galaxy S21 FE 5G','DM002','H000000001','GG001', N'https://cdn.tgdd.vn/Products/Images/42/231110/Galaxy-S22-Black-600x600.jpg', 29000000, 25000000, 30, 33, N'Hà Nội', N'Samsung mang đến cho người dùng phiên bản điện thoại Samsung Galaxy S21 FE 5G (8GB/128GB) mới có sức hút hấp dẫn với ngoại hình tinh tế, nịnh mắt, một cấu hình mạnh mẽ từ chip Exynos 2100 và ấn tượng ở khả năng quay chụp từ hệ thống camera thông minh, xịn sò.'),
('SS010', N'Samsung Galaxy A73 5G Awesome Edition','DM002','H000000001','GG001', N'https://cdn.tgdd.vn/Products/Images/42/288597/Samsung-Galaxy-A73-PUBG-Thumb-600x600.jpg', 29000000, 25000000, 30, 33, N'Hà Nội', N'Samsung Galaxy S22 Ultra chính hãng tại ĐMX'),
('SS011', N'Samsung Galaxy A73 5G','DM002','H000000001','GG001', N'https://cdn.tgdd.vn/Products/Images/42/246195/samsung-galaxy-a73-5g-xanh-thumb-600x600.jpg', 29000000, 25000000, 30, 33, N'Hà Nội', N'Samsung Galaxy S22 Ultra chính hãng tại ĐMX'),
('SS012', N'Samsung Galaxy M53','DM002','H000000001','GG001', N'https://cdn.tgdd.vn/Products/Images/42/247364/samsung-galaxy-m53-nau-thumb-600x600.jpg', 29000000, 25000000, 30, 33, N'Hà Nội', N'Samsung Galaxy S22 Ultra chính hãng tại ĐMX'),
('SS013', N'Samsung Galaxy A53 5G','DM002','H000000001','GG001', N'https://cdn.tgdd.vn/Products/Images/42/246196/Samsung-Galaxy-A53-cam-thumb-600x600.jpg', 29000000, 25000000, 30, 33, N'Hà Nội', N'Samsung Galaxy S22 Ultra chính hãng tại ĐMX'),
('SS014', N'Samsung Galaxy A33 5G','DM002','H000000001','GG001', N'https://cdn.tgdd.vn/Products/Images/42/246199/samsung-galaxy-a33-5g-trang-thumb-600x600.jpg', 29000000, 25000000, 30, 33, N'Hà Nội', N'Samsung Galaxy S22 Ultra chính hãng tại ĐMX'),
('SS015', N'Samsung Galaxy M33 5G','DM002','H000000001','GG001', N'https://cdn.tgdd.vn/Products/Images/42/256197/Samsung-galaxy-m53-n%C3%A2u-600x600.jpg', 29000000, 25000000, 30, 33, N'Hà Nội', N'Samsung Galaxy S22 Ultra chính hãng tại ĐMX'),
('SS016', N'Samsung Galaxy A23 5G','DM002','H000000001','GG001', N'https://cdn.tgdd.vn/Products/Images/42/296239/sam-sung-galaxy-a23-5g-xanh-thumb-600x600.jpg', 29000000, 25000000, 30, 33, N'Hà Nội', N'Samsung Galaxy S22 Ultra chính hãng tại ĐMX'),
('SS017', N'Samsung Galaxy A22','DM002','H000000001','GG001', N'https://cdn.tgdd.vn/Products/Images/42/237603/samsung-galaxy-a22-4g-violet-600x600.jpg', 29000000, 25000000, 30, 33, N'Hà Nội', N'Samsung Galaxy S22 Ultra chính hãng tại ĐMX'),
('SS018', N'Samsung Galaxy A04s','DM002','H000000001','GG001', N'https://cdn.tgdd.vn/Products/Images/42/283819/samsung-galaxy-a04s-den-thumb-1-600x600.jpg', 29000000, 25000000, 30, 33, N'Hà Nội', N'Samsung Galaxy S22 Ultra chính hãng tại ĐMX'),
('SS019', N'Samsung Galaxy A03s','DM002','H000000001','GG001', N'https://cdn.tgdd.vn/Products/Images/42/241049/samsung-galaxy-a03s-black-600x600.jpg', 29000000, 25000000, 30, 33, N'Hà Nội', N'Samsung Galaxy S22 Ultra chính hãng tại ĐMX'),
('SS020', N'Samsung Galaxy A04','DM002','H000000001','GG001', N'https://cdn.tgdd.vn/Products/Images/42/275434/samsung-galaxy-a04-thumb-1-600x600.jpg', 29000000, 25000000, 30, 33, N'Hà Nội', N'Samsung Galaxy S22 Ultra chính hãng tại ĐMX'),
('SS021', N'Samsung Galaxy A03','DM002','H000000001','GG001', N'https://cdn.tgdd.vn/Products/Images/42/251856/samsung-galaxy-a03-xanh-thumb-600x600.jpg', 29000000, 25000000, 30, 33, N'Hà Nội', N'Samsung Galaxy S22 Ultra chính hãng tại ĐMX'),

--Oppo--
('OP001', N'OPPO Reno8 series','DM002','H000000017','GG001', N'https://cdn.tgdd.vn/Products/Images/42/285029/oppo-reno8-4g-thumb-vang-600x600.jpg', 27000000, 25000000, 30, 40, N'TP.HCM', N'Mới đây OPPO đã chính thức tung ra thị trường bộ sản phẩm mới nhất đến từ dòng Reno với nhiều nâng cấp đáng kể, OPPO Reno8 sẽ là một cái tên trong số đó với nhiều nâng cấp đáng giá như hiệu năng cao, camera chụp ảnh sắc nét.'),
('OP002', N'OPPO Reno7 series','DM002','H000000017','GG001', N'https://cdn.tgdd.vn/Products/Images/42/271717/oppo-reno7-z-5g-thumb-2-1-600x600.jpg', 15000000, 12000000, 50, 100, N'TP.HCM', N'Bên cạnh phiên bản 5G thì OPPO còn tung ra thị trường phiên bản OPPO Reno7 4G với những điểm nổi bật như: Thiết kế thời thượng, sạc siêu nhanh, camera cảm biến thông minh hứa hẹn sẽ mang đến những trải nghiệm cực kỳ trơn tru.'),
('OP003', N'OPPO A55 ','DM002','H000000017','GG001', N'https://cdn.tgdd.vn/Products/Images/42/249944/oppo-a55-4g-thumb-new-600x600.jpg', 4000000, 3000000, 200, 250, N'TP.HCM', N'Hứng thú với chất lượng selfie trên điện thoại tầm trung, ắt hẳn chẳng nên bỏ qua các phiên bản đẹp mắt của OPPO, trong đó có OPPO A55 4G với ngoại hình tinh tế, hiệu năng ổn định, cụm camera chất lượng cùng dung lượng pin tuyệt vời, thỏa mãn nhiều tiêu chí tìm kiếm mà bạn mong muốn.'),
('OP004', N'OPPO Find X5 5G','DM002','H000000017','GG001', N'https://cdn.tgdd.vn/Products/Images/42/250622/oppo-find-x5-pro-den-thumb-600x600.jpg', 27000000, 25000000, 30, 40, N'TP.HCM', N'OPPO Find X5 Pro là một trong những sản phẩm cao cấp được OPPO tung ra thị trường với thiết kế thời thượng, màn hình 2K+ chất lượng cao, cấu hình mạnh mẽ,... hứa hẹn sẽ là một sản phẩm đáp ứng đầy đủ các tiêu chí của người dùng.'),
('OP005', N'OPPO Reno6 series','DM002','H000000017','GG001', N'https://cdn.tgdd.vn/Products/Images/42/236186/oppo-reno6-5g-black-600x600.jpg', 27000000, 25000000, 30, 40, N'TP.HCM', N'OPPO Reno6 sẽ mang lại một làn gió mới cho phân khúc tầm trung khi sở hữu một thiết kế cao cấp, hệ thống camera thông minh cùng hiệu năng vô cùng ấn tượng, hứa hẹn sẽ mẫu điện thoại OPPO thu hút nhiều sự chú ý nhất người dùng trong năm 2021.'),
('OP006', N'OPPO A96','DM002','H000000017','GG001', N'https://cdn.tgdd.vn/Products/Images/42/274381/oppo-a96-den-thumb-1-600x600.jpg', 27000000, 25000000, 30, 40, N'TP.HCM', N'OPPO Find X5 chính hãng'),
('OP007', N'OPPO A77s','DM002','H000000017','GG001', N'https://cdn.tgdd.vn/Products/Images/42/292780/oppo-a77s-den-thumb-1-2-600x600.jpg', 27000000, 25000000, 30, 40, N'TP.HCM', N'OPPO Find X5 chính hãng'),
('OP008', N'OPPO A95','DM002','H000000017','GG001', N'https://cdn.tgdd.vn/Products/Images/42/251703/oppo-a95-4g-bac-2-600x600.jpg', 27000000, 25000000, 30, 40, N'TP.HCM', N'OPPO Find X5 chính hãng'),
('OP009', N'OPPO A76','DM002','H000000017','GG001', N'https://cdn.tgdd.vn/Products/Images/42/270360/OPPO-A76-%C4%91en-600x600.jpg', 27000000, 25000000, 30, 40, N'TP.HCM', N'OPPO Find X5 chính hãng'),
('OP010', N'OPPO A54','DM002','H000000017','GG001', N'https://cdn.tgdd.vn/Products/Images/42/236768/oppo-a54-4g-black-600x600.jpg', 27000000, 25000000, 30, 40, N'TP.HCM', N'OPPO Find X5 chính hãng'),
('OP011', N'OPPO A57','DM002','H000000017','GG001', N'https://cdn.tgdd.vn/Products/Images/42/282090/oppo-a57-xanh-thumb-1-600x600.jpg', 27000000, 25000000, 30, 40, N'TP.HCM', N'OPPO Find X5 chính hãng'),
('OP012', N'OPPO A17','DM002','H000000017','GG001', N'https://cdn.tgdd.vn/Products/Images/42/288401/oppo-a17-den-thumb-600x600.jpg', 27000000, 25000000, 30, 40, N'TP.HCM', N'OPPO Find X5 chính hãng'),
('OP013', N'OPPO A16','DM002','H000000017','GG001', N'https://cdn.tgdd.vn/Products/Images/42/240631/oppo-a16-silver-8-600x600.jpg', 27000000, 25000000, 30, 40, N'TP.HCM', N'OPPO Find X5 chính hãng'),
('OP014', N'OPPO A15s','DM002','H000000017','GG001', N'https://cdn.tgdd.vn/Products/Images/42/229948/oppo-a15s-xanh-600x600-3-600x600.jpg', 27000000, 25000000, 30, 40, N'TP.HCM', N'OPPO Find X5 chính hãng'),
('OP015', N'OPPO A17K','DM002','H000000017','GG001', N'https://cdn.tgdd.vn/Products/Images/42/288404/oppo-a17k-vang-thumb-%C4%83-600x600.jpg', 27000000, 25000000, 30, 40, N'TP.HCM', N'OPPO Find X5 chính hãng'),
('OP016', N'OPPO A16K','DM002','H000000017','GG001', N'https://cdn.tgdd.vn/Products/Images/42/249945/oppo-a16k-thumb1-600x600-1-600x600.jpg', 27000000, 25000000, 30, 40, N'TP.HCM', N'OPPO Find X5 chính hãng'),

--Vivo--
('VV001', N'Vivo X80','DM002','H000000018','GG001', N'https://cdn.tgdd.vn/Products/Images/42/253138/vivo-x80-xanh-thumb-600x600.jpg', 20000000, 19000000, 40, 50, N'TP.HCM', N'Điện thoại Vivo X80 sở hữu ngoại hình trẻ trung với hai màu đen và xanh nổi bật, cung cấp thời lượng pin tốt kèm khả năng sạc nhanh đến 80 W. Điểm nhấn chính ở X80 là tích hợp nhiều tính năng chụp ảnh, quay phim chuyên nghiệp, đánh dấu sự hợp tác giữa Vivo và ZEISS.'),
('VV002', N'Vivo V25 series','DM002','H000000018','GG001', N'https://cdn.tgdd.vn/Products/Images/42/283148/vivo-v25-5g-vang-thumb-1-1-600x600.jpg', 10000000, 8000000, 50, 70, N'TP.HCM', N'Vivo V25 sở hữu tạo hình hợp xu hướng cùng kiểu thiết kế mặt lưng chuyển màu độc đáo khi tiếp xúc với ánh nắng, bên cạnh đó máy còn được sử dụng một con chip hiệu năng cao, camera chụp ảnh sắc nét để đáp ứng tốt mọi nhu cầu sử dụng của bạn.'),
('VV003', N'Vivo Y15 series','DM002','H000000018','GG001', N'https://cdn.tgdd.vn/Products/Images/42/249720/Vivo-y15s-2021-xanh-den-660x600.jpg', 10000000, 8000000, 50, 70, N'TP.HCM', N'Vivo Y15s là chiếc điện thoại sở hữu nhiều ưu điểm nổi bật từ thiết kế màn hình lớn, vẻ ngoài thời trang, hiệu năng ổn định để sử dụng lâu dài và đi kèm với mức giá vô cùng tốt trong phân khúc, hứa hẹn sẽ đáp ứng tốt nhu cầu giải trí của bạn.'),
('VV004', N'Vivo V25 Pro 5G','DM002','H000000018','GG001', N'https://cdn.tgdd.vn/Products/Images/42/282389/vivo-v25-pro-5g-xanh-thumb-1-600x600.jpg', 10000000, 8000000, 50, 70, N'TP.HCM', N'Vivo V25 Pro 5G sở hữu mặt lưng được làm bằng kính AG có thể đổi màu sắc độc đáo đi cùng màn hình AMOLED chất lượng, tích hợp theo đó là bộ vi xử lý MediaTek Dimensity 1300 mạnh mẽ, hứa hẹn sẽ trở thành tâm điểm, thu hút mọi ánh nhìn khi cầm trên tay.'),
('VV005', N'Vivo V23 series','DM002','H000000018','GG001', N'https://cdn.tgdd.vn/Products/Images/42/264034/vivo-V23-5G-6-1-2-600x600.jpg', 10000000, 8000000, 50, 70, N'TP.HCM', N'Vivo V23 5G không chỉ chinh phục người dùng ở thiết kế mà còn là cấu hình mạnh mẽ và cụm camera siêu ấn tượng, xứng đáng là lựa chọn sáng giá cho nhu cầu săn smartphone selfie giải trí và làm việc.'),
('VV006', N'Vivo Y55','DM002','H000000018','GG001', N'https://cdn.tgdd.vn/Products/Images/42/278949/vivo-y55-den-thumb-600x600.jpg', 6000000, 5000000, 60, 70, N'TP.HCM', N'Vivo Y55 chính hãng'),
('VV007', N'Vivo Y35','DM002','H000000018','GG001', N'https://cdn.tgdd.vn/Products/Images/42/286697/vivo-y35-thumb-den-600x600.jpg', 6000000, 5000000, 60, 70, N'TP.HCM', N'Vivo Y55 chính hãng'),
('VV008', N'Vivo Y33s','DM002','H000000018','GG001', N'https://cdn.tgdd.vn/Products/Images/42/249102/Vivo-y33s-yellow-thumb-600x600.jpg', 6000000, 5000000, 60, 70, N'TP.HCM', N'Vivo Y55 chính hãng'),
('VV009', N'Vivo T1 series','DM002','H000000018','GG001', N'https://cdn.tgdd.vn/Products/Images/42/253137/vivo-t1x-xanh-thumb-600x600.jpg', 5500000, 4000000, 40, 80, N'TP.HCM', N'Vivo T1 series chính hãng'),
('VV010', N'Vivo Y22s','DM002','H000000018','GG001', N'https://cdn.tgdd.vn/Products/Images/42/285224/vivo-y22s-vang-thumb-600x600.jpg', 6000000, 5000000, 60, 70, N'TP.HCM', N'Vivo Y55 chính hãng'),
('VV011', N'Vivo Y21s','DM002','H000000018','GG001', N'https://cdn.tgdd.vn/Products/Images/42/249429/vivo-y21s-blue-600x600.jpg', 6000000, 5000000, 60, 70, N'TP.HCM', N'Vivo Y55 chính hãng'),
('VV012', N'Vivo Y16','DM002','H000000018','GG001', N'https://cdn.tgdd.vn/Products/Images/42/291697/vivo-y16-vang-thumb-600x600.jpg', 6000000, 5000000, 60, 70, N'TP.HCM', N'Vivo Y55 chính hãng'),
('VV013', N'Vivo Y02s','DM002','H000000018','GG001', N'https://cdn.tgdd.vn/Products/Images/42/285032/vivo-y02s-thumb-1-2-3-600x600.jpg', 6000000, 5000000, 60, 70, N'TP.HCM', N'Vivo Y55 chính hãng'),
('VV014', N'Vivo Y01','DM002','H000000018','GG001', N'https://cdn.tgdd.vn/Products/Images/42/268880/vivi-y01-%C4%91en-thumb-600x600.jpg', 6000000, 5000000, 60, 70, N'TP.HCM', N'Vivo Y55 chính hãng'),
('VV015', N'Vivo Y02','DM002','H000000018','GG001', N'https://cdn.tgdd.vn/Products/Images/42/298388/vivo-y02-xanh-thumb-600x600.jpg', 6000000, 5000000, 60, 70, N'TP.HCM', N'Vivo Y55 chính hãng'),

--Xiaomi--
('XM001', N'Xiaomi 12 series','DM002','H000000016','GG001', N'https://cdn.tgdd.vn/Products/Images/42/234621/Xiaomi-12-xam-thumb-mau-600x600.jpg', 15000000, 14000000, 50, 55, N'TP.HCM', N'Không chỉ gây ấn tượng bởi mức giá bán, điện thoại Xiaomi 12 5G còn mang đến nhiều bất ngờ hơn nữa về bộ thông số kỹ thuật và những nâng cấp đáng kể trên camera, giúp bạn có được những phút giây trải nghiệm hết sức tuyệt vời hay lưu giữ những khoảnh khắc xung quanh như một nhiếp ảnh gia thực thụ.'),
('XM002', N'Xiaomi Redmi Note 11','DM002','H000000016','GG001', N'https://cdn.tgdd.vn/Products/Images/42/269831/Xiaomi-redmi-note-11-black-600x600.jpeg', 4500000, 4000000, 80, 100, N'TP.HCM', N'Xiaomi Redmi Note 11 (4GB/64GB) thực sự là 1 tuyệt tác của phân khúc điện thoại có mức giá dễ tiếp cận với cụm 4 camera sau chụp ảnh chuyên nghiệp, tích hợp con chip Snapdragon đáp ứng đa tác vụ, dung lượng pin lớn cho bạn thỏa sức giải trí cả ngày.'),
('XM003', N'Xiaomi Redmi Note 11S 5G','DM002','H000000016','GG001', N'https://cdn.tgdd.vn/Products/Images/42/272668/xiaomi-redmi-note-11s-5g-lam-hong-thumb-600x600.jpg', 4500000, 4000000, 80, 100, N'TP.HCM', N'Xiaomi Redmi Note 11S 5G một trong những sản phẩm nổi bật của Xiaomi với thiết kế hiện đại, cấu hình vượt trội, hệ thống camera thông minh, dung lượng pin lớn,... Chiếc điện thoại này hứa hẹn sẽ mang lại trải nghiệm tuyệt vời cho người dùng.'),
('XM004', N'Xiaomi 12T Pro 5G','DM002','H000000016','GG001', N'https://cdn.tgdd.vn/Products/Images/42/279066/xiaomi-12t-pro-thumb-bac-1-600x600.jpg', 15000000, 14000000, 50, 55, N'TP.HCM', N'Cuối cùng thì Xiaomi 12T Pro 5G cũng chính thức lộ diện trên thị trường sau hàng loạt thông tin rò rỉ về thông số, đúng như dự đoán thì phiên bản lần này được nhà sản xuất nâng cấp đáng kể về phần camera, giúp máy trở thành thiết bị có khả năng ghi hình sắc nét thuộc top đầu giới smartphone. Đi kèm với đó là màn hình chất lượng cùng bộ vi xử lý mạnh mẽ xứng tầm flagship.'),
('XM005', N'Xiaomi 12T','DM002','H000000016','GG001', N'https://cdn.tgdd.vn/Products/Images/42/279065/xiaomi-12t-thumb-bac-1-600x600.jpg', 15000000, 14000000, 50, 55, N'TP.HCM', N'Xiaomi 12T 5G 128GB ra mắt với nhiều ưu điểm vượt trội về hiệu năng và camera, đây chắc hẳn là một sự nâng cấp đáng chú ý ở dòng điện thoại cận cao cấp của hãng, điều này nhằm mang lại nhiều trải nghiệm vượt trội tiệm cận với các dòng flagship nhưng mức giá bán tối ưu hơn.'),
('XM006', N'Xiaomi 11T','DM002','H000000016','GG001', N'https://cdn.tgdd.vn/Products/Images/42/262566/xiaomi-11t-pro-5g-8gb-thumb-600x600.jpeg', 15000000, 14000000, 50, 55, N'TP.HCM', N'Xiaomi đã trang bị hàng loạt tính năng đỉnh cao cho Xiaomi 11T 5G 128GB như tần số quét màn hình 120 Hz, camera 108 MP cùng vi xử lý Dimensity 1200, chiếc smartphone này chắc chắn sẽ đem đến sự hài lòng dành cho bạn.'),
('XM007', N'Xiaomi 11T Pro 5G','DM002','H000000016','GG001', N'https://cdn.tgdd.vn/Products/Images/42/248293/Xiaomi-11T-White-1-2-3-600x600.jpg', 15000000, 14000000, 50, 55, N'TP.HCM', N'Một chiếc flagship giá siêu hấp dẫn đến từ "tiểu mễ" - điện thoại Xiaomi 11T Pro 5G 8GB được chế tác tinh xảo, tích hợp bộ vi xử lý đột phá Snapdragon 888, quay phim chuẩn điện ảnh với camera chính 108 MP, sạc nhanh với công suất 120 W, thời lượng pin khủng và còn gì nữa? Mời bạn khám phá nhanh qua nội dung sau.'),
('XM008', N'Xiaomi 11 Lite 5G NE','DM002','H000000016','GG001', N'https://cdn.tgdd.vn/Products/Images/42/249427/xiaomi-11-lite-5g-ne-black-600x600.jpg', 15000000, 14000000, 50, 55, N'TP.HCM', N'Ngoài Xiaomi 11T thì Xiaomi vẫn còn tung ra mẫu Xiaomi 11 Lite 5G NE, máy mang một thiết kế mỏng nhẹ bậc nhất nhưng chứa đầy một hiệu năng mạnh mẽ khi sử dụng chip Snapdragon 778G, màn hình AMOLED cho màu sắc rực rỡ. Chiếc smartphone này chắc chắn sẽ phục vụ tốt mọi nhu cầu sử dụng của bạn.'),
('XM009', N'Xiaomi Redmi Note 11 Pro series','DM002','H000000016','GG001', N'https://cdn.tgdd.vn/Products/Images/42/246640/xiaomi-redmi-note-11-pro-5g-xam-thumb-600x600.jpg', 4500000, 4000000, 80, 100, N'TP.HCM', N'Xiaomi Redmi Note 11 chính hãng'),
('XM010', N'Xiaomi Redmi Note 10 Pro','DM002','H000000016','GG001', N'https://cdn.tgdd.vn/Products/Images/42/229228/xiaomi-redmi-note-10-pro-thumb-vang-dong-600x600-600x600.jpg', 4000000, 3500000, 200, 250, N'TP.HCM', N'Xiaomi Redmi 10 series chính hãng'),
('XM011', N'Xiaomi Redmi Note 10s','DM002','H000000016','GG001', N'https://cdn.tgdd.vn/Products/Images/42/262534/xiaomi-redmi-note-10s-6gb-thumb-600x600.jpeg', 4000000, 3500000, 200, 250, N'TP.HCM', N'Xiaomi Redmi 10 series chính hãng'),
('XM012', N'Xiaomi Redmi Note 10 5G','DM002','H000000016','GG001', N'https://cdn.tgdd.vn/Products/Images/42/235971/xiaomi-redmi-note-10-5g-xanh-cuc-quang-600x600.jpg', 4000000, 3500000, 200, 250, N'TP.HCM', N'Xiaomi Redmi 10 series chính hãng'),
('XM013', N'Xiaomi Redmi 10 series','DM002','H000000016','GG001', N'https://cdn.tgdd.vn/Products/Images/42/262004/xiaomi-redmi-10-2022-xanh-thumb-600x600.jpg', 4000000, 3500000, 200, 250, N'TP.HCM', N'Xiaomi Redmi 10 series chính hãng'),
('XM014', N'Xiaomi Redmi 10C','DM002','H000000016','GG001', N'https://cdn.tgdd.vn/Products/Images/42/271843/xiaomi-redmi-10c-xanh-luc-thumb-600x600.jpg', 4000000, 3500000, 200, 250, N'TP.HCM', N'Xiaomi Redmi 10 series chính hãng'),
('XM015', N'Xiaomi Redmi 9C','DM002','H000000016','GG001', N'https://cdn.tgdd.vn/Products/Images/42/246937/xiaomi-redmi-9c-4gb-xanh-1-600x600.jpg', 4000000, 3500000, 200, 250, N'TP.HCM', N'Xiaomi Redmi 10 series chính hãng'),
('XM016', N'POCO C40','DM002','H000000017','GG001', N'https://cdn.tgdd.vn/Products/Images/42/277057/xiaomi-poco-c40-den-thumb-1-600x600.jpg', 3000000, 2500000, 300, 350, N'TP.HCM', N'POCO C40 chính hãng'),
('XM017', N'Xiaomi Redmi 10A','DM002','H000000016','GG001', N'https://cdn.tgdd.vn/Products/Images/42/271734/xiaomi-redmi-10a-thumb-600x600.jpg', 4000000, 3500000, 200, 250, N'TP.HCM', N'Xiaomi Redmi 10 series chính hãng'),
('XM018', N'Xiaomi Redmi 9A','DM002','H000000016','GG001', N'https://cdn.tgdd.vn/Products/Images/42/218734/xiaomi-redmi-9a-grey-600x600-1-600x600.jpg', 4000000, 3500000, 200, 250, N'TP.HCM', N'Xiaomi Redmi 10 series chính hãng'),
('XM019', N'Xiaomi Redmi 1A','DM002','H000000016','GG001', N'https://cdn.tgdd.vn/Products/Images/42/286702/Xiaomi-Redmi-A1-thumb-xanh-duong-600x600.jpg', 4000000, 3500000, 200, 250, N'TP.HCM', N'Xiaomi Redmi 10 series chính hãng'),

--Realme--
('RM001', N'Realme 8 series','DM002','H000000015','GG001', N'https://cdn.tgdd.vn/Products/Images/42/233135/realme-8-silver-600x600.jpg', 9000000, 8000000, 100, 120, N'TP.HCM', N'Realme mang đến cho người dùng chiếc điện thoại Realme 8 có diện mạo độc đáo đầy sang trọng, hiệu năng mạnh mẽ đi kèm viên pin lớn cho năng lượng hoạt động dồi dào,... Smartphone hứa hẹn sẽ đem lại sự hài lòng đáng mong đợi cho chủ sở hữu.'),
('RM002', N'Realme 9 series','DM002','H000000015','GG001', N'https://cdn.tgdd.vn/Products/Images/42/255513/realme-9-pro-plus-5g-blue-thumb-600x600.jpg', 9000000, 8000000, 100, 120, N'TP.HCM', N'Realme 9 Pro+ 5G ra mắt với một cấu hình mạnh mẽ, màn hình hiển thị đẹp, camera chụp ảnh sắc nét cùng màu sắc vô cùng lạ mắt, hứa hẹn mang đến những trải nghiệm tuyệt vời trên mọi tác vụ.'),
('RM003', N'Realme C35','DM002','H000000015','GG001', N'https://cdn.tgdd.vn/Products/Images/42/261888/realme-c35-thumb-new-600x600.jpg', 3000000, 2500000, 100, 150, N'TP.HCM', N'Realme C35 được ra mắt với kiểu dáng bắt kịp xu hướng, camera sắc nét cùng hiệu năng ổn định và thời lượng sử dụng lâu dài nhờ viên pin khủng được trang bị bên trong, được xem là một cái tên sáng giá trong dòng sản phẩm điện thoại thuộc phân khúc giá rẻ.'),
('RM004', N'Realme C33','DM002','H000000015','GG001', N'https://cdn.tgdd.vn/Products/Images/42/292632/realme-c33-thumb-xanh-600x600.jpg', 3000000, 2500000, 100, 150, N'TP.HCM', N'Realme C33 (3GB/32GB) sở hữu thiết kế siêu mỏng với cạnh viền vát phẳng hiện đại, màn hình giọt nước kích thước lớn và camera 50 MP, đây quả thực là những điểm hết sức nổi bật khi điện thoại chỉ có mức giá bán thuộc phân khúc cấp thấp.'),
('RM005', N'Realme C25Y','DM002','H000000015','GG001', N'https://cdn.tgdd.vn/Products/Images/42/265313/realme-c25y-64gb-xanh-thumb-600x600.jpeg', 3000000, 2500000, 100, 150, N'TP.HCM', N'Realme C33 chính hãng'),
('RM006', N'Realme C11 series','DM002','H000000015','GG001', N'https://cdn.tgdd.vn/Products/Images/42/236257/realme-c11-2021-blue-1-600x600.jpg', 3000000, 2500000, 100, 150, N'TP.HCM', N'Realme C33 chính hãng'),
('RM007', N'Realme 9','DM002','H000000015','GG001', N'https://cdn.tgdd.vn/Products/Images/42/275632/realme-9-4g-vang-thumb-1-600x600.jpg', 9000000, 8000000, 100, 120, N'TP.HCM', N'Realme 9 series chính hãng'),
('RM008', N'Realme 9i','DM002','H000000015','GG001', N'https://cdn.tgdd.vn/Products/Images/42/275732/realme-9i-den-thumb-600x600.jpg', 9000000, 8000000, 100, 120, N'TP.HCM', N'Realme 9 series chính hãng'),
('RM009', N'Realme C30s','DM002','H000000015','GG001', N'https://cdn.tgdd.vn/Products/Images/42/290877/Realme-c30s-xanh-temp-600x600.jpg', 3000000, 2500000, 100, 150, N'TP.HCM', N'Realme C33 chính hãng'),
('RM010', N'Realme C21Y','DM002','H000000015','GG001', N'https://cdn.tgdd.vn/Products/Images/42/253401/realme-c21-y-black-600x600.jpg', 3000000, 2500000, 100, 150, N'TP.HCM', N'Realme C33 chính hãng'),

--Nokia--
('NO001', N'Nokia G21','DM002','H000000014','GG001', N'https://cdn.tgdd.vn/Products/Images/42/270207/nokia-g21-xanh-thumb-600x600.jpg', 4000000, 3500000, 100, 200, N'TP.HCM', N'Nokia G21 được ra mắt với màn hình lớn, hiệu năng ổn định giúp bạn trải nghiệm mượt mà trên các tác vụ hàng ngày cùng viên pin khủng được tích hợp trên điện thoại.'),
('NO002', N'Nokia G11','DM002','H000000014','GG001', N'https://cdn.tgdd.vn/Products/Images/42/272148/Nokia-g11-x%C3%A1m-thumb-600x600.jpg', 4000000, 3500000, 100, 200, N'TP.HCM', N'Được ra mắt vào tháng 04/2022, Nokia G11 mang trong mình hiệu năng ổn định, màn hình kích thước lớn, đem đến những trải nghiệm giải trí tuyệt vời cùng thời gian sử dụng lâu dài nhờ viên pin lớn được trang bị.'),
('NO003', N'Nokia G11 Plus','DM002','H000000014','GG001', N'https://cdn.tgdd.vn/Products/Images/42/272148/Nokia-g11-x%C3%A1m-thumb-600x600.jpg', 4000000, 3500000, 100, 200, N'TP.HCM', N'Nokia G11 Plus 32GB là mẫu điện thoại được nhà Nokia vừa cho ra mắt với mức giá tốt, sở hữu vẻ ngoài đặc trưng của dòng Nokia G, trang bị bộ đôi camera AI hiện đại, hiệu năng ổn định cùng viên pin dung lượng lớn mang đến cho bạn trải nghiệm tuyệt vời.'),
('NO004', N'Nokia C31 series','DM002','H000000014','GG001', N'https://cdn.tgdd.vn/Products/Images/42/292717/Nokia-C31-Green-thumb-600x600.jpg', 4000000, 3500000, 100, 200, N'TP.HCM', N'Nokia C31 (3GB/32GB) là chiếc điện thoại giá rẻ được giới thiệu và kinh doanh chính thức tại thị trường Việt Nam vào tháng 10/2022, sản phẩm tập trung khá nhiều vào phần màn hình nhằm giúp khách hàng có những trải nghiệm giải trí tốt hơn, cùng với đó là một viên pin lớn để máy có thể duy trì tác vụ sử dụng dài lâu.'),
('NO005', N'Nokia C30','DM002','H000000014','GG001', N'https://cdn.tgdd.vn/Products/Images/42/239748/nokia-c30-xanh-la-600x600.jpg', 4000000, 3500000, 100, 200, N'TP.HCM', N'Với sự yêu thích từ hãng Nokia và mong muốn có một thời lượng pin trâu thì điện thoại Nokia C30 là sự lựa chọn đúng đắn khi được trang bị viên pin cực khủng, được nâng cấp hơn so với Nokia C20, hứa hẹn sẽ tạo ra làn sóng mới trong phân khúc smartphone giá rẻ.'),
('NO006', N'Nokia C21 Plus','DM002','H000000014','GG001', N'https://cdn.tgdd.vn/Products/Images/42/280139/nokia-c21-plus-600x600.jpg', 4000000, 3500000, 100, 200, N'TP.HCM', N'Nokia G21 chính hãng'),
('NO007', N'Nokia C20','DM002','H000000014','GG001', N'https://cdn.tgdd.vn/Products/Images/42/236437/nokia-c20-blue-1-600x600.jpg', 4000000, 3500000, 100, 200, N'TP.HCM', N'Nokia G21 chính hãng'),

('NO008', N'Nokia 5710','DM002','H000000014','GG001', N'https://cdn.tgdd.vn/Products/Images/42/286133/nokia-5710-thumb-den-1-600x600.jpg', 1800000, 1300000, 300, 500, N'TP.HCM', N'Nokia 5710 chính hãng'),
('NO009', N'Nokia 215 4G','DM002','H000000014','GG001', N'https://cdn.tgdd.vn/Products/Images/42/228366/nokia-215-xanh-ngoc-new-600x600-600x600.jpg', 1800000, 1300000, 300, 500, N'TP.HCM', N'Nokia 5710 chính hãng'),
('NO010', N'Nokia 8210 4G','DM002','H000000014','GG001', N'https://cdn.tgdd.vn/Products/Images/42/286060/Nokia%208210-do-thumb-600x600.jpg', 1800000, 1300000, 300, 500, N'TP.HCM', N'Nokia 5710 chính hãng')

--TV--



select * from QL_SanPham
--=================KHO

INSERT INTO QL_Kho
VALUES
('K0001','SS001',N'Kho hàng bán',9999,500,50,N'A')
INSERT INTO QL_Kho
VALUES
('K0002','XM001',N'Kho hàng hỏng',9999,500,50,N'B')
INSERT INTO QL_Kho
VALUES
('K0003','OP001',N'Kho hàng đổi trả ',9999,500,50,N'C')

select * from QL_Kho order by QL_Kho.ID_Kho asc
--======Chi tiết hóa đơn nhập
INSERT INTO QL_CT_HDN
VALUES
('CTN01','IN00000001','SS001','GG001',10,30000000,500000,null)


--======Khách hàng
INSERT INTO QL_KhachHang
VALUES
('0346824776',N'Dương Minh Huy','0346824776',N'Kiên Giang')

--==========Phương Thức Thanh Toán
INSERT INTO PhuongThucThanhToan
VALUES
('PT001',N'Thanh toán thẻ',N'Khách hàng chuyển khoảng',1),
('PT002',N'Thanh toán tiền mặt',N'Khách hàng đặt hàng giao hàng xong thanh toán',1)


--========Hóa đơn bán
Create trigger TG_Auto_HDBID on QL_HD_Ban
for insert
as
	begin
		declare @Full_ID varchar(10)
		Set @Full_ID = (Select Top 1 ID_HDB from QL_HD_Ban order by ID_HDB desc)
		Update QL_HD_Ban set ID_HDB = dbo.FUNC_AutoID (@Full_ID,'SO',10) where ID_HDB =''
	end
go

SET DATEFORMAT DMY
INSERT INTO QL_HD_Ban
VALUES
('','0346824776','PT002',N'HCM','30/11/2022','27/11/2022',0,1)

--============Chi tiết hóa đơn bán

INSERT INTO QL_CT_HDB
VALUES 
('CTB01','SO00000001','SS001',1,30000000,500000,null)


--===========Thanh toán
INSERT INTO ThanhToan
VALUES
('TT001','SO00000001','30/11/2022',null,null)

--=============Bảo hành
Create trigger TG_Auto_BaoHanhID on QL_BaoHanh
for insert
as
	begin
		declare @Full_ID varchar(10)
		Set @Full_ID = (Select Top 1 ID_BaoHanh from QL_BaoHanh order by ID_BaoHanh desc)
		Update QL_BaoHanh set ID_BaoHanh = dbo.FUNC_AutoID (@Full_ID,'BH',10) where ID_BaoHanh =''
	end
go


SET DATEFORMAT DMY
INSERT INTO QL_BaoHanh
VALUES
('','SP00000001','IPhone 14','0346824776','0346824776','90','30/11/20222')

--============DS CHƯƠNG TRÌNH KHUYẾN MÃI
SET DATEFORMAT DMY
INSERT INTO DS_CTKM
VALUES
('KM001',N'World Cup siêu lớn','14/11/2022','30/11/2022')

--===========CT_CHƯƠNG TRÌNH KHUYẾN MÃI
INSERT INTO CT_CTKM
VALUES
('KM001','SS001','SP019',Null,1)