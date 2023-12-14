
create database storeManagement
go
use storeManagement
go
create table NhanVien (
	maNhanVien nvarchar(10) NOT NULL , 
	tenNhanVien nvarchar(50), 
	gioiTinh bit, sdt char(10),
	chucVu nvarchar(10)
	CONSTRAINT PK_NhanVien PRIMARY KEY (maNhanVien)
)
create table TaiKhoan (
	tenDangNhap varchar(10) NOT NULL, 
	maNhanVien nvarchar(10), 
	matKhau varchar(50)
	CONSTRAINT PK_TaiKhoan PRIMARY KEY (tenDangNhap)
	CONSTRAINT FK_TaiKhoan FOREIGN KEY (maNhanVien) REFERENCES NhanVien(maNhanVien)
)
create table LoaiSanPham (
	maLoaiSanPham varchar(10) NOT NULL, 
	tenLoaiSanPham nvarchar(50),
	CONSTRAINT PK_LoaiSanPham PRIMARY KEY (maLoaiSanPham)
)
create table KhachHang(
	maKhachHang varchar(10) NOT NULL,
	tenKhachHang nvarchar(50),
	sdt char(10)
	CONSTRAINT PK_KhachHang PRIMARY KEY (maKhachHang)
)
create table SanPham(
	maSanPham varchar(10) NOT NULL,
	maLoaiSanPham varchar(10),
	tenSanPham nvarchar(100),
	giaTien int,
	soLuongHienCo int
	CONSTRAINT PK_SanPham PRIMARY KEY (maSanPham),
	CONSTRAINT FK_MaLoaiSanPham FOREIGN KEY (maLoaiSanPham) REFERENCES LoaiSanPham(maLoaiSanPham)
)

create table NhapHang(
	maNhanVien nvarchar(10) NOT NULL,
	maSanPham varchar(10) NOT NULL,
	ngayNhapHang datetime NOT NULL DEFAULT GETDATE(),
	soLuong int,
	CONSTRAINT PK_NhapHang PRIMARY KEY (maNhanVien, maSanPham, ngayNhapHang),
	CONSTRAINT FK_maNhanVien FOREIGN KEY (maNhanVien) REFERENCES NhanVien(maNhanVien),
	CONSTRAINT FK_maSanPham FOREIGN KEY (maSanPham) REFERENCES SanPham(maSanPham)
)

create table DonHang(
	maDonHang INT PRIMARY KEY IDENTITY,
	maKhachHang varchar(10), 
	ngayDatHang datetime DEFAULT GETDATE(),
	tongCong int,
	maNhanVien nvarchar(10)
	CONSTRAINT FK_maNhanVienDonHang FOREIGN KEY (maNhanVien) REFERENCES NhanVien(maNhanVien),
)

create table ChiTietDonHang(
	maSanPham varchar(10) NOT NULL,
	soLuong int,
	giaTien int,
	thoiGian datetime NOT NULL DEFAULT GETDATE()
	Primary key (maSanPham, thoiGian)
	CONSTRAINT FK_maSanPhamChiTiet FOREIGN KEY (maSanPham) REFERENCES SanPham(maSanPham)
)



---Thêm dữ liệu bảng NhanVien (maNhanVien, tenNhanVien, gioiTinh, sdt, chucVu)
INSERT INTO NhanVien VALUES ('NV001', N'Nguyễn Minh Anh', 1, '0315468521', 'Staff');
INSERT INTO NhanVien VALUES ('NV002', N'Dương Ngọc Bình', 0, '0516485214', 'Admin');
INSERT INTO NhanVien VALUES ('NV003', N'Cao Công Chương', 1, '0626541589', 'Staff');
INSERT INTO NhanVien VALUES ('NV004', N'Nguyễn Tiến Đạt', 1, '0136521478', 'Staff');
INSERT INTO NhanVien VALUES ('NV005', N'Phạm Minh Dương', 1, '0649135287', 'Admin');
INSERT INTO NhanVien VALUES ('NV006', N'Lê Minh Duy', 1, '0346157283', 'Staff');
INSERT INTO NhanVien VALUES ('NV007', N'Trịnh Thị Ngọc Dung', 0, '0346157283', 'Staff');
INSERT INTO NhanVien VALUES ('NV008', N'Trần Ngọc Kim Cúc', 0, '0316425376', 'Staff');
INSERT INTO NhanVien VALUES ('NV009', N'Nguyễn Ngọc Châu', 1, '0346518954', 'Admin');
INSERT INTO NhanVien VALUES ('NV010', N'Nguyễn Trí Thức', 1, '0654125631', 'Staff');

---Thêm dữ liệu bảng TaiKhoan (tenDangNhap, maNhanVien, matKhau)
INSERT INTO TaiKhoan VALUES ('nv001', 'NV001', '123456');
INSERT INTO TaiKhoan VALUES ('nv002', 'NV002', '123456');
INSERT INTO TaiKhoan VALUES ('nv003', 'NV003', '123456');
INSERT INTO TaiKhoan VALUES ('nv004', 'NV004', '123456');
INSERT INTO TaiKhoan VALUES ('nv005', 'NV005', '123456');
INSERT INTO TaiKhoan VALUES ('nv006', 'NV006', '123456');
INSERT INTO TaiKhoan VALUES ('nv007', 'NV007', '123456');
INSERT INTO TaiKhoan VALUES ('nv008', 'NV008', '123456');
INSERT INTO TaiKhoan VALUES ('nv009', 'NV009', '123456');
INSERT INTO TaiKhoan VALUES ('nv010', 'NV010', '123456');

---Thêm dữ liệu bảng KhachHang (maKhachHang, tenKhachHang, sdt)
INSERT INTO KhachHang VALUES ('KH001', N'Nguyễn Minh Kha', '0541256145');
INSERT INTO KhachHang VALUES ('KH002', N'Đỗ Kim Ngọc', '094613527');
INSERT INTO KhachHang VALUES ('KH003', N'Nguyễn Hoàng Lực', '0825850092');
INSERT INTO KhachHang VALUES ('KH004', N'Nguyễn Quốc Huy', '0842955519');

---Thêm dữ liệu bảng LoaiSanPham (maLoaiSanPham, tenLoaiSanPham)
INSERT INTO LoaiSanPham VALUES ('SNACKPOCA', N'Bánh - Snack Poca');
INSERT INTO LoaiSanPham VALUES ('SNACKOISHI', N'Bánh - Snack Oishi');
INSERT INTO LoaiSanPham VALUES ('SNACKSWING', N'Bánh - Snack Swing ');
INSERT INTO LoaiSanPham VALUES ('NUOCNGOT', N'Nước Ngọt');
INSERT INTO LoaiSanPham VALUES ('NUOCKGAS', N'Nước Giải Khác');
INSERT INTO LoaiSanPham VALUES ('FASTFOOD', N'Thức ăn nhanh');

---Thêm dữ liệu bảng SanPham (maSanPham, tenSanPham, giaTien)
INSERT INTO SanPham VALUES ('SP001', 'SNACKPOCA', N'Đậu Phộng Poca Nutz Da Cá Vị Phô Mai ', 5800, 30);
INSERT INTO SanPham VALUES ('SP002', 'SNACKPOCA', N'Snack Poca khoai tây vị rong biển', 11700, 30);
INSERT INTO SanPham VALUES ('SP003', 'SNACKPOCA', N'Snack Poca Khoai Tây Sườn Nướng BBQ', 11700, 30);
INSERT INTO SanPham VALUES ('SP004', 'SNACKPOCA', N'Snack Poca Khoai Tây Classic 56g', 11700, 30);
INSERT INTO SanPham VALUES ('SP005', 'SNACKPOCA', N'Đậu phộng Poca Nutz da cá nước cốt dừa 42g', 5800, 30);
INSERT INTO SanPham VALUES ('SP006', 'SNACKOISHI', N'Snack bí đỏ vị bò nướng Oishi 35g', 7000, 30);
INSERT INTO SanPham VALUES ('SP007', 'SNACKOISHI', N'Snack vị bắp ngọt Oishi 35g', 7000, 30);
INSERT INTO SanPham VALUES ('SP008', 'SNACKOISHI', N'Snack vị cua sốt chua ngọt Oishi Crab Me 35g', 7000, 30);
INSERT INTO SanPham VALUES ('SP009', 'SNACKOISHI', N'Snack vị cà chua Oishi Tomati 35g', 7000, 30);
INSERT INTO SanPham VALUES ('SP010', 'SNACKOISHI', N'Snack khoai tây vị muối Oishi Flutes 35g', 7000, 30);
INSERT INTO SanPham VALUES ('SP011', 'SNACKSWING', N'Snack vị bít tết Swing 152g', 29000, 30);
INSERT INTO SanPham VALUES ('SP012', 'SNACKSWING', N'Snack vị bít tết Swing 108g', 22900, 30);
INSERT INTO SanPham VALUES ('SP013', 'SNACKSWING', N'Snack vị bít tết Swing 63g', 12000, 30);
INSERT INTO SanPham VALUES ('SP014', 'SNACKSWING', N'Snack vị bít tết Swing 32g', 7000, 30);
INSERT INTO SanPham VALUES ('SP015', 'SNACKSWING', N'Snack phô mai 2 lớp Swing gói 152g', 29000, 30);
INSERT INTO SanPham VALUES ('SP016', 'NUOCNGOT', N'Nước Tăng Lực Number 1', 8000, 30);
INSERT INTO SanPham VALUES ('SP017', 'NUOCNGOT', N'Nước ngọt Pepsi 390ml', 7000, 30);
INSERT INTO SanPham VALUES ('SP018', 'NUOCNGOT', N'Nước ngọt Fanta hương Cam chai 1.5l', 16000, 30);
INSERT INTO SanPham VALUES ('SP019', 'NUOCNGOT', N'Nước Ngọt 7 Up 1.5l', 16000, 30);
INSERT INTO SanPham VALUES ('SP020', 'NUOCNGOT', N'Nước Ngọt Coca Cola 390ml', 68000, 30);
INSERT INTO SanPham VALUES ('SP021', 'NUOCKGAS', N'Trà Bí Đao Wonderfarm 310ml', 78000, 30);
INSERT INTO SanPham VALUES ('SP022', 'NUOCKGAS', N'Trà Bí Đao Wonderfarm 280ml', 68000, 30);
INSERT INTO SanPham VALUES ('SP023', 'NUOCKGAS', N'Trà thanh nhiệt Dr. Thanh 330ml', 9000, 30);
INSERT INTO SanPham VALUES ('SP024', 'NUOCKGAS', N'Trà xanh 0 Độ hương Chanh 500ml', 87000, 30);
INSERT INTO SanPham VALUES ('SP025', 'NUOCKGAS', N'Trà Xanh C2 Hương Chanh chai 360ml', 70000, 30);
INSERT INTO SanPham VALUES ('SP026', 'FASTFOOD', N'Đùi gà nướng vị Teriyaki', 43000, 30);
INSERT INTO SanPham VALUES ('SP027', 'FASTFOOD', N'Cơm trộn gà 270g', 35000, 30);
INSERT INTO SanPham VALUES ('SP028', 'FASTFOOD', N'Bánh mì pate trứng', 18000, 30);
INSERT INTO SanPham VALUES ('SP029', 'FASTFOOD', N'Bánh bao xá xíu', 21000, 30);
INSERT INTO SanPham VALUES ('SP030', 'FASTFOOD', N'Mì trộn Indomie', 17000, 30);

---Thêm dữ liệu bảng NhapHang (maSanPham, maNhanVien, ngayNhapHang, soLuong)
INSERT INTO NhapHang(maSanPham, maNhanVien, soLuong) VALUES ('SP001', 'NV001', 30);
INSERT INTO NhapHang(maSanPham, maNhanVien, soLuong) VALUES ('SP002', 'NV001', 30);
INSERT INTO NhapHang(maSanPham, maNhanVien, soLuong) VALUES ('SP003', 'NV001', 30);
INSERT INTO NhapHang(maSanPham, maNhanVien, soLuong) VALUES ('SP004', 'NV001', 30);
INSERT INTO NhapHang(maSanPham, maNhanVien, soLuong) VALUES ('SP005', 'NV001', 30);
INSERT INTO NhapHang(maSanPham, maNhanVien, soLuong) VALUES ('SP006', 'NV001', 30);
INSERT INTO NhapHang(maSanPham, maNhanVien, soLuong) VALUES ('SP007', 'NV001', 30);
INSERT INTO NhapHang(maSanPham, maNhanVien, soLuong) VALUES ('SP008', 'NV001', 30);
INSERT INTO NhapHang(maSanPham, maNhanVien, soLuong) VALUES ('SP009', 'NV001', 30);
INSERT INTO NhapHang(maSanPham, maNhanVien, soLuong) VALUES ('SP010', 'NV001', 30);
INSERT INTO NhapHang(maSanPham, maNhanVien, soLuong) VALUES ('SP011', 'NV001', 30);
INSERT INTO NhapHang(maSanPham, maNhanVien, soLuong) VALUES ('SP012', 'NV001', 30);
INSERT INTO NhapHang(maSanPham, maNhanVien, soLuong) VALUES ('SP013', 'NV001', 30);
INSERT INTO NhapHang(maSanPham, maNhanVien, soLuong) VALUES ('SP014', 'NV001', 30);
INSERT INTO NhapHang(maSanPham, maNhanVien, soLuong) VALUES ('SP015', 'NV001', 30);
INSERT INTO NhapHang(maSanPham, maNhanVien, soLuong) VALUES ('SP016', 'NV001', 30);
INSERT INTO NhapHang(maSanPham, maNhanVien, soLuong) VALUES ('SP017', 'NV001', 30);
INSERT INTO NhapHang(maSanPham, maNhanVien, soLuong) VALUES ('SP018', 'NV001', 30);
INSERT INTO NhapHang(maSanPham, maNhanVien, soLuong) VALUES ('SP019', 'NV001', 30);
INSERT INTO NhapHang(maSanPham, maNhanVien, soLuong) VALUES ('SP020', 'NV001', 30);
INSERT INTO NhapHang(maSanPham, maNhanVien, soLuong) VALUES ('SP021', 'NV001', 30);
INSERT INTO NhapHang(maSanPham, maNhanVien, soLuong) VALUES ('SP022', 'NV001', 30);
INSERT INTO NhapHang(maSanPham, maNhanVien, soLuong) VALUES ('SP023', 'NV001', 30);
INSERT INTO NhapHang(maSanPham, maNhanVien, soLuong) VALUES ('SP024', 'NV001', 30);
INSERT INTO NhapHang(maSanPham, maNhanVien, soLuong) VALUES ('SP025', 'NV001', 30);
INSERT INTO NhapHang(maSanPham, maNhanVien, soLuong) VALUES ('SP026', 'NV001', 30);
INSERT INTO NhapHang(maSanPham, maNhanVien, soLuong) VALUES ('SP027', 'NV001', 30);
INSERT INTO NhapHang(maSanPham, maNhanVien, soLuong) VALUES ('SP028', 'NV001', 30);
INSERT INTO NhapHang(maSanPham, maNhanVien, soLuong) VALUES ('SP029', 'NV001', 30);
INSERT INTO NhapHang(maSanPham, maNhanVien, soLuong) VALUES ('SP030', 'NV001', 30);


INSERT INTO DonHang(maKhachHang, tongCong, maNhanVien) VALUES ('KH001', 17500, 'NV001');

delete from SanPham where SanPham.maSanPham = 'SP030'