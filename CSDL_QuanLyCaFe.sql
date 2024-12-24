CREATE DATABASE QUANLICAFE

USE QUANLICAFE
-- Bảng Users
CREATE TABLE Users (
    maUser VARCHAR(10) PRIMARY KEY,
    tenUser NVARCHAR(100) NOT NULL,
    tenDN NVARCHAR(50) NOT NULL UNIQUE,
    matkhau NVARCHAR(255) NOT NULL,
    LoaiUser NVARCHAR(50),
    ngaysinh DATE,
    gioitinh NVARCHAR(10),
    diachi NVARCHAR(255),
    email NVARCHAR(100),
    sdt NVARCHAR(15),
    ngayThem DATETIME DEFAULT GETDATE(), 
    nguoiThem NVARCHAR(100),             
    ngaySua DATETIME,  
    nguoiSua NVARCHAR(100)    
);

CREATE TABLE DanhMucThucUong (
    maDM VARCHAR(10) PRIMARY KEY,
    tenDM NVARCHAR(100) NOT NULL,
    mota NVARCHAR(255),
    ngayThem DATETIME DEFAULT GETDATE(), 
    nguoiThem NVARCHAR(100),          
    ngaySua DATETIME, 
    nguoiSua NVARCHAR(100)              
);

-- Bảng ThucUong
DROP TABLE IF EXISTS ThucUong;
CREATE TABLE ThucUong (
    maTU VARCHAR(10) PRIMARY KEY,
    tenTU NVARCHAR(100) NOT NULL,
    gia DECIMAL NOT NULL,
    maDM VARCHAR(10),
    ngayThem DATETIME DEFAULT GETDATE(), 
    nguoiThem NVARCHAR(100),             
    ngaySua DATETIME,  
    nguoiSua NVARCHAR(100),
    FOREIGN KEY (maDM) REFERENCES DanhMucThucUong(maDM)
);

-- Bảng HoaDon
DROP TABLE IF EXISTS HoaDon;
CREATE TABLE HoaDon (
    maHD VARCHAR(10) PRIMARY KEY,
    ngaytao DATETIME NOT NULL DEFAULT GETDATE(), 
    maUser VARCHAR(10),
    ghiChu NVARCHAR(255),
	tinhTrang NVARCHAR(255),
    nguoiThem NVARCHAR(100),             
    ngaySua DATETIME, 
    nguoiSua NVARCHAR(100),              
    FOREIGN KEY (maUser) REFERENCES Users(maUser)
);

-- Bảng ChiTietHoaDon
DROP TABLE IF EXISTS ChiTietHoaDon;
CREATE TABLE ChiTietHoaDon (
    maCTHD VARCHAR(10) PRIMARY KEY,
    maTU VARCHAR(10),
    soluong INT NOT NULL,
    maHD VARCHAR(10),
    FOREIGN KEY (maTU) REFERENCES ThucUong(maTU),
    FOREIGN KEY (maHD) REFERENCES HoaDon(maHD)
);


-- Thêm dữ liệu mẫu vào bảng Users
INSERT INTO Users (maUser, tenUser, tenDN, matkhau, LoaiUser, ngaysinh, gioitinh, diachi, email, sdt, nguoiThem, nguoiSua) 
VALUES
('AD001', N'Nguyễn Văn Linh', N'nguyenvanlinh', N'admin123', N'Admin', '1992-02-15', N'Nữ', N'Hà Nội', N'lan@example.com', N'0123456789', N'Nguyễn Văn Linh', N''),
('NV001', N'Hoàng Văn Bình', N'hoangvanbinh', N'password123', N'Nhân viên', '1994-04-20', N'Nam', N'Hồ Chí Minh', N'binh@example.com', N'0934567890', N'Nguyễn Văn Linh', N''),
('NV002', N'Trần Thị Mai', N'tranthimai', N'password123', N'Nhân viên', '1996-06-25', N'Nữ', N'Đà Nẵng', N'mai@example.com', N'0912345678', N'Nguyễn Văn Linh', N''),
('NV003', N'Lê Minh Tuấn', N'leminhtuan', N'password123', N'Nhân viên', '1995-08-10', N'Nam', N'Hải Phòng', N'tuan@example.com', N'0976543210', N'Nguyễn Văn Linh', N''),
('NV004', N'Phan Thị Lan', N'phanthilan', N'password123', N'Nhân viên', '1993-12-05', N'Nữ', N'Quảng Ninh', N'lan123@example.com', N'0987654321', N'Nguyễn Văn Linh', N''),
('NV005', N'Võ Quang Huy', N'voquanghuy', N'password123', N'Nhân viên', '1990-07-14', N'Nam', N'Bình Dương', N'huy@example.com', N'0932456789', N'Nguyễn Văn Linh', N''),
('NV006', N'Trần Kim Anh', N'trankimanh', N'password123', N'Nhân viên', '1998-11-30', N'Nữ', N'Hà Giang', N'kimanh@example.com', N'0965432109', N'Nguyễn Văn Linh', N''),
('NV007', N'Nguyễn Thanh Tùng', N'nguyenthantung', N'password123', N'Nhân viên', '1988-05-22', N'Nam', N'Vĩnh Phúc', N'tung@example.com', N'0945123456', N'Nguyễn Văn Linh', N''),
('NV008', N'Phạm Thu Hà', N'phamthuha', N'password123', N'Nhân viên', '1997-03-03', N'Nữ', N'Hà Nam', N'thuha@example.com', N'0916782345', N'Nguyễn Văn Linh', N''),
('NV009', N'Ngô Quang Hảo', N'ngoquanghao', N'password123', N'Nhân viên', '1994-09-18', N'Nam', N'Tiền Giang', N'hao@example.com', N'0943012345', N'Nguyễn Văn Linh', N'');


-- Thêm dữ liệu mẫu vào bảng DanhMucThucUong
INSERT INTO DanhMucThucUong (maDM, tenDM, mota, nguoiThem, nguoiSua) VALUES 
('DM001', N'Cà phê', N'Các loại cà phê thơm ngon', N'Nguyễn Văn Linh', N''),
('DM002', N'Sinh tố', N'Các loại sinh tố trái cây bổ dưỡng', N'Nguyễn Văn Linh', N''),
('DM003', N'Trà sữa', N'Trà sữa các loại thạch và topping', N'Nguyễn Văn Linh', N''),
('DM004', N'Nhâm nhi', N'Trà, nước ép, bánh ngọt', N'Nguyễn Văn Linh', N''),
('DM005', N'Sữa tươi', N'Sữa tươi các loại', N'Nguyễn Văn Linh', N''),
('DM006', N'Nước ép', N'Nước ép hoa quả tươi', N'Nguyễn Văn Linh', N''),
('DM007', N'Cocktail', N'Cocktail các loại', N'Nguyễn Văn Linh', N''),
('DM008', N'Sữa chua', N'Sữa chua trái cây tươi', N'Nguyễn Văn Linh', N''),
('DM009', N'Bia', N'Bia các loại', N'Nguyễn Văn Linh', N''),
('DM010', N'Khác', N'Món uống khác', N'Nguyễn Văn Linh', N'');


-- Thêm dữ liệu mẫu vào bảng ThucUong
INSERT INTO ThucUong (maTU, tenTU, gia, maDM, nguoiThem, nguoiSua) VALUES 
('TU001', N'Cà phê đen', 30000, 'DM001', N'Nguyễn Văn Linh', N''),
('TU002', N'Cà phê sữa', 35000, 'DM001', N'Nguyễn Văn Linh', N''),
('TU003', N'Sinh tố dâu', 32000, 'DM002', N'Nguyễn Văn Linh', N''),
('TU004', N'Sinh tố chuối', 32000, 'DM002', N'Nguyễn Văn Linh', N''),
('TU005', N'Trà sữa truyền thống', 25000, 'DM003', N'Nguyễn Văn Linh', N''),
('TU006', N'Trà sữa matcha', 27000, 'DM003', N'Nguyễn Văn Linh', N''),
('TU007', N'Nước ép cam', 18000, 'DM006', N'Nguyễn Văn Linh', N''),
('TU008', N'Nước ép táo', 20000, 'DM006', N'Nguyễn Văn Linh', N''),
('TU009', N'Sữa chua dẻo', 22000, 'DM008', N'Nguyễn Văn Linh', N''),
('TU010', N'Cocktail trái cây', 45000, 'DM007', N'Nguyễn Văn Linh', N'');


INSERT INTO HoaDon (maHD, ngaytao, maUser, ghiChu, tinhTrang, nguoiThem, ngaySua, nguoiSua) VALUES 
('HD001', GETDATE(), 'NV001', N'Giao hàng tận nơi', N'Hoàn thành', N'Nguyễn Văn Linh', '', ''),
('HD002', GETDATE(), 'NV002', N'Khách đến tại quán', N'Hoàn thành', N'Nguyễn Văn Linh', '', ''),
('HD003', GETDATE(), 'NV003', N'Giao hàng tại quán', N'Hoàn thành', N'Nguyễn Văn Linh', '', ''),
('HD004', GETDATE(), 'NV004', N'Khách yêu cầu hủy món', N'Hoàn thành', N'Nguyễn Văn Linh', '', ''),
('HD005', GETDATE(), 'NV005', N'Giao hàng tận nơi', N'Hoàn thành', N'Nguyễn Văn Linh', '', ''),
('HD006', GETDATE(), 'NV006', N'Thêm món tráng miệng', N'Hoàn thành', N'Nguyễn Văn Linh', '', ''),
('HD007', GETDATE(), 'NV007', N'Khách đến tại quán', N'Hoàn thành', N'Nguyễn Văn Linh', '', ''),
('HD008', GETDATE(), 'NV008', N'Giao hàng tận nơi', N'Hoàn thành', N'Nguyễn Văn Linh', '', ''),
('HD009', GETDATE(), 'NV009', N'Khách yêu cầu nhanh', N'Hoàn thành', N'Nguyễn Văn Linh', '', ''),
('HD010', GETDATE(), 'NV001', N'Thêm nước ép', N'Hoàn thành', N'Nguyễn Văn Linh', '', '');


-- Thêm dữ liệu mẫu vào bảng ChiTietHoaDon
INSERT INTO ChiTietHoaDon (maCTHD, maTU, soluong, maHD) VALUES 
('CT001', 'TU001', 2, 'HD001'),
('CT002', 'TU002', 1, 'HD002'),
('CT003', 'TU003', 3, 'HD003'),
('CT004', 'TU004', 2, 'HD004'),
('CT005', 'TU005', 1, 'HD005'),
('CT006', 'TU006', 1, 'HD006'),
('CT007', 'TU007', 2, 'HD007'),
('CT008', 'TU008', 1, 'HD008'),
('CT009', 'TU009', 1, 'HD009'),
('CT010', 'TU010', 2, 'HD010');


update dbo.Users 
set ngaySua =N'';

update dbo.DanhMucThucUong
set ngaySua=N''

update dbo.ThucUong 
set ngaySua =N'';

update dbo.HoaDon 
set ngaySua =N'';

delete from dbo.users
select * from dbo.Users
select * from dbo.HoaDon
select * from dbo.DanhMucThucUong
select * from dbo.ThucUong
select * from dbo.ChiTietHoaDon





