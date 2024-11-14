﻿CREATE database Ban_Ao_DB
go
use Ban_Ao_DB

go
IF OBJECT_ID('THUONG_HIEU') IS NOT NULL
DROP TABLE THUONG_HIEU
CREATE TABLE THUONG_HIEU (
ID INT IDENTITY(1,1) PRIMARY KEY,
TEN_THUONG_HIEU NVARCHAR(225) NOT NULL,
 MA_THUONG_HIEU VARCHAR(10),
NGAY_TAO DATETIME DEFAULT GETDATE() ,
TRANG_THAI BIT,
NGAY_SUA DATETIME
)
GO
IF OBJECT_ID('CHAT_LIEU') IS NOT NULL
DROP TABLE CHAT_LIEU
CREATE TABLE CHAT_LIEU (
ID INT IDENTITY(1,1) PRIMARY KEY,
MA_CHAT_LIEU VARCHAR(12) ,
TEN_CHAT_LIEU NVARCHAR(225) ,
TRANG_THAI BIT,
NGAY_TAO DATETIME DEFAULT GETDATE() ,
NGAY_SUA DATETIME
)
GO
IF OBJECT_ID('DANH_MUC') IS NOT NULL
DROP TABLE DANH_MUC
CREATE TABLE DANH_MUC (
ID INT IDENTITY(1,1) PRIMARY KEY,
TEN_DANH_MUC NVARCHAR(225) NOT NULL,
MA_DANH_MUC VARCHAR(10),
TRANG_THAI BIT,
NGAY_TAO DATETIME DEFAULT GETDATE() ,
NGAY_SUA DATETIME
)
GO
IF OBJECT_ID('NHA_SAN_XUAT') IS NOT NULL
DROP TABLE NHA_SAN_XUAT
CREATE TABLE NHA_SAN_XUAT (
ID INT IDENTITY(1,1) PRIMARY KEY,
MA_NHA_SAN_XUAT VARCHAR(12) ,
TEN_NHA_SAN_XUAT NVARCHAR(225) ,
TRANG_THAI BIT,
NGAY_TAO DATETIME DEFAULT GETDATE(),
NGAY_SUA DATETIME
)
GO
IF OBJECT_ID('CO_AO') IS NOT NULL
DROP TABLE CO_AO
CREATE TABLE CO_AO (
ID INT IDENTITY(1,1) PRIMARY KEY,
TEN_CO_AO NVARCHAR(225) ,
MA_CO_AO VARCHAR(10),
TRANG_THAI BIT,
NGAY_TAO DATETIME DEFAULT GETDATE() ,
NGAY_SUA DATETIME
)
GO

IF OBJECT_ID('SAN_PHAM') IS NOT NULL
DROP TABLE SAN_PHAM
CREATE TABLE SAN_PHAM (
ID INT IDENTITY(1,1) PRIMARY KEY,
MA_SAN_PHAM VARCHAR(12) ,
TEN_SAN_PHAM NVARCHAR(255),
ANH_SAN_PHAM NVARCHAR(255),
NGAY_TAO DATETIME DEFAULT GETDATE(),
NGAY_SUA DATETIME,
ID_DANH_MUC INT,
ID_NHA_SAN_XUAT INT,
SO_LUONG_SAN_PHAM INT,
ID_THUONG_HIEU INT,
ID_CO_AO INT,
ID_CHAT_LIEU INT,
TRANG_THAI BIT,
CONSTRAINT FK_SAN_PHAM_CHAT_LIEU FOREIGN KEY(ID_CHAT_LIEU) REFERENCES CHAT_LIEU(ID),
CONSTRAINT FK_SAN_PHAM_DANH_MUC FOREIGN KEY(ID_DANH_MUC) REFERENCES DANH_MUC(ID),
CONSTRAINT FK_SAN_PHAM_NHA_SAN_XUA FOREIGN KEY(ID_NHA_SAN_XUAT) REFERENCES NHA_SAN_XUAT(ID),
CONSTRAINT FK_SAN_PHAM_THUONG_HIEU FOREIGN KEY(ID_THUONG_HIEU) REFERENCES THUONG_HIEU(ID),
CONSTRAINT FK_SAN_PHAM_CO_AO FOREIGN KEY(ID_CO_AO) REFERENCES CO_AO (ID),
)
GO
IF OBJECT_ID('MAU_SAC') IS NOT NULL
DROP TABLE MAU_SAC
CREATE TABLE MAU_SAC (
ID INT IDENTITY(1,1) PRIMARY KEY,
MA_MAU_SAC VARCHAR(10),
TEN_MAU_SAC NVARCHAR(225) ,
TRANG_THAI BIT,
NGAY_TAO DATETIME DEFAULT GETDATE(),
NGAY_SUA DATETIME,
)
GO
IF OBJECT_ID('HINH_ANH_SAN_PHAM') IS NOT NULL
DROP TABLE HINH_ANH_SAN_PHAM
CREATE TABLE HINH_ANH_SAN_PHAM (
    ID INT PRIMARY KEY IDENTITY(1,1),
    TEN_ANH NVARCHAR(255),
    DU_LIEU_ANH VARBINARY(MAX),
	ID_SAN_PHAM INT,
	ID_MAU_SAC INT,
	MO_TA NVARCHAR(255) 
	CONSTRAINT FK_HINH_ANH_SAN_PHAM_MAU_SAC FOREIGN KEY(ID_MAU_SAC) REFERENCES MAU_SAC(ID),
	CONSTRAINT FK_HINH_ANH_SAN_PHAM_SAN_PHAM FOREIGN KEY(ID_SAN_PHAM) REFERENCES SAN_PHAM(ID),
)
GO
IF OBJECT_ID('KICH_THUOC') IS NOT NULL
DROP TABLE KICH_THUOC
CREATE TABLE KICH_THUOC (
ID INT IDENTITY(1,1) PRIMARY KEY,
MA_KICH_THUOC VARCHAR(10),
TEN_KICH_THUOC NVARCHAR(225) ,
TRANG_THAI BIT,
NGAY_TAO  DATETIME DEFAULT GETDATE(),
NGAY_SUA DATETIME
)

GO
IF OBJECT_ID('SAN_PHAM_CHI_TIET') IS NOT NULL
DROP TABLE SAN_PHAM_CHI_TIET
CREATE TABLE SAN_PHAM_CHI_TIET (
ID INT IDENTITY(1,1) PRIMARY KEY,
ANH_SAN_PHAM_CHI_TIET VARBINARY(MAX),
ID_SAN_PHAM INT,
ID_KICH_THUOC INT,
ID_MAU_SAC INT,
SO_LUONG_SAN_PHAM_CHI_TIET INT,
DON_GIA DECIMAL(10, 2),
MO_TA NVARCHAR(255) ,
NGAY_TAO DATETIME DEFAULT GETDATE() ,
NGAY_SUA DATETIME,
TRANG_THAI BIT,
CONSTRAINT FK_SAN_PHAM_CHI_TIET_SAN_PHAM FOREIGN KEY(ID_SAN_PHAM) REFERENCES SAN_PHAM(ID),
CONSTRAINT FK_SAN_PHAM_CHI_TIET_KICH_THUOC FOREIGN KEY(ID_KICH_THUOC) REFERENCES KICH_THUOC(ID),
CONSTRAINT FK_SAN_PHAM_CHI_TIET_MAU_SAC FOREIGN KEY(ID_MAU_SAC) REFERENCES MAU_SAC(ID),
)
GO
IF OBJECT_ID('TINH_THANH_PHO') IS NOT NULL
DROP TABLE TINH_THANH_PHO
CREATE TABLE TINH_THANH_PHO (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    TEN_TINH_THANH_PHO NVARCHAR(100)
);
GO
IF OBJECT_ID('QUAN_HUYEN') IS NOT NULL
DROP TABLE QUAN_HUYEN
CREATE TABLE QUAN_HUYEN (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    TEN_QUAN_HUYEN NVARCHAR(100),
    ID_TINH_THANH_PHO INT,
    CONSTRAINT FK_QUAN_HUYEN_TINH_THANH_PHO FOREIGN KEY (ID_TINH_THANH_PHO) REFERENCES TINH_THANH_PHO(ID)
);
GO
IF OBJECT_ID('XA_PHUONG') IS NOT NULL
DROP TABLE XA_PHUONG
CREATE TABLE XA_PHUONG (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    TEN_XA_PHUONG NVARCHAR(100),
    ID_QUAN_HUYEN INT,
    CONSTRAINT FK_XA_PHUONG_QUAN_HUYEN FOREIGN KEY (ID_QUAN_HUYEN) REFERENCES QUAN_HUYEN(ID)
);
GO
CREATE TABLE TAI_KHOAN(
TEN_DANG_NHAP NVARCHAR(225) PRIMARY KEY,
MAT_KHAU VARCHAR(225) NULL,
)
INSERT INTO TAI_KHOAN VALUES
('A','1'),
('B','2'),
('TK1', 'MK1'),
('TK2', 'MK2'),
('taikhoan1','1'),
('taikhoan2','1')

CREATE TABLE VAI_TRO(
	ID INT IDENTITY (1,1) PRIMARY KEY,
	TEN_VAI_TRO NVARCHAR(225),
)
INSERT INTO VAI_TRO VALUES
('QUANLY'),
('NHANVIEN'),
('KHACHHANG')

CREATE TABLE CHI_TIET_VAI_TRO(
	ID INT IDENTITY (1,1) PRIMARY KEY,
	ID_VAI_TRO	INT,
	TEN_DANG_NHAP NVARCHAR(225) unique, -- đảm bảo là duy nhất
	CONSTRAINT FK_CHI_TIET_VAI_TRO_TAI_KHOAN FOREIGN KEY (TEN_DANG_NHAP) REFERENCES TAI_KHOAN(TEN_DANG_NHAP),
	CONSTRAINT FK_CHI_TIET_VAI_TRO_VAI_TRO FOREIGN KEY (ID_VAI_TRO) REFERENCES VAI_TRO(ID)
)
INSERT INTO CHI_TIET_VAI_TRO VALUES
(3,'taikhoan2'),
(1,'A'),
(2,'B'),
(3,'TK1'),
(2,'taikhoan1')
GO
IF OBJECT_ID('KHACH_HANG') IS NOT NULL
DROP TABLE KHACH_HANG
CREATE TABLE KHACH_HANG (
ID INT IDENTITY(1,1) PRIMARY KEY,
	AVATAR VARBINARY(MAX),
    MA_KHACH_HANG NVARCHAR(225),
    TEN_TAI_KHOAN NVARCHAR(225),
    MAT_KHAU VARCHAR(15),
    SO_DIEN_THOAI VARCHAR(12),
    DIA_CHI_CU_THE NVARCHAR(225),
    TEN_KHACH_HANG NVARCHAR(225) ,
	GIOI_TINH INT ,
    TRANG_THAI BIT,
    NGAY_TAO DATETIME DEFAULT GETDATE(),
    NGAY_SUA DATETIME,
    GHI_CHU NVARCHAR(255),
    ID_TINH_THANH_PHO INT,
    ID_QUAN_HUYEN INT,
    ID_XA_PHUONG INT,
	DELETEAT BIT,
	TINH_TRANG BIT,
	TEN_DANG_NHAP NVARCHAR(225) unique, -- đảm bảo là duy nhất
--	ID_GIO_HANG INT,
	--   CONSTRAINT FK_KHACH_HANG_GIO_HANG FOREIGN KEY (ID_GIO_HANG) REFERENCES GIO_HANG(ID),
   --CONSTRAINT FK_KHACH_HANG_TINH_THANH_PHO FOREIGN KEY (ID_TINH_THANH_PHO) REFERENCES TINH_THANH_PHO(ID),
   -- CONSTRAINT FK_KHACH_HANG_QUAN_HUYEN FOREIGN KEY (ID_QUAN_HUYEN) REFERENCES QUAN_HUYEN(ID),
   -- CONSTRAINT FK_KHACH_HANG_XA_PHUONG FOREIGN KEY (ID_XA_PHUONG) REFERENCES XA_PHUONG(ID),
	CONSTRAINT FK_KHACH_HANG_TAI_KHOAN FOREIGN KEY (TEN_DANG_NHAP) REFERENCES TAI_KHOAN(TEN_DANG_NHAP)
)

GO
IF OBJECT_ID('GIO_HANG') IS NOT NULL
DROP TABLE GIO_HANG
CREATE TABLE GIO_HANG (
ID INT IDENTITY(1,1) PRIMARY KEY,
ID_KHACH_HANG INT ,
ID_SAN_PHAM_CHI_TIET INT ,
SO_LUONG INT,
TONG_TIEN DECIMAL(10,2),
CONSTRAINT FK_GIO_HANG_KHACH_HANG FOREIGN KEY (ID_KHACH_HANG) REFERENCES KHACH_HANG (ID),
CONSTRAINT FK_GIO_HANG_SAN_PHAM_CHI_TIET FOREIGN KEY (ID_SAN_PHAM_CHI_TIET) REFERENCES SAN_PHAM_CHI_TIET (ID),
)
GO
GO
IF OBJECT_ID('NHAN_VIEN') IS NOT NULL
DROP TABLE NHAN_VIEN
CREATE TABLE NHAN_VIEN (
ID INT IDENTITY(1,1) PRIMARY KEY,
AVATAR VARBINARY(MAX) ,
TEN_NHAN_VIEN NVARCHAR(225) ,
MA_NHAN_VIEN VARCHAR(225) ,
GIOI_TINH INT,
TEN_TAI_KHOAN NVARCHAR(225),
MAT_KHAU VARCHAR(225),
CHUC_VU NVARCHAR(255),
TRANG_THAI BIT,
NGAY_TAO DATETIME DEFAULT GETDATE() ,
NGAY_SUA DATETIME,
DELETEAT BIT,
TINH_TRANG BIT,
TEN_DANG_NHAP NVARCHAR(225) unique, -- đảm bảo là duy nhất
/*ID_TINH_THANH_PHO INT,
ID_QUAN_HUYEN INT,
ID_XA_PHUONG INT,
    CONSTRAINT FK_NHAN_VIEN_TINH_THANH_PHO FOREIGN KEY (ID_TINH_THANH_PHO) REFERENCES TINH_THANH_PHO(ID),
    CONSTRAINT FK_NHAN_VIEN_QUAN_HUYEN FOREIGN KEY (ID_QUAN_HUYEN) REFERENCES QUAN_HUYEN(ID),
    CONSTRAINT FK_NHAN_VIEN_XA_PHUONG FOREIGN KEY (ID_XA_PHUONG) REFERENCES XA_PHUONG(ID)*/
	CONSTRAINT FK_NHAN_VIEN_TAI_KHOAN FOREIGN KEY (TEN_DANG_NHAP) REFERENCES TAI_KHOAN(TEN_DANG_NHAP),
)
GO
IF OBJECT_ID('VOUCHER') IS NOT NULL
DROP TABLE VOUCHER
CREATE TABLE VOUCHER (
ID INT IDENTITY(1,1) PRIMARY KEY,
MA_KHUYEN_MAI NVARCHAR(255),
MO_MA NVARCHAR(255),
TEN_KHUYEN_MAI NVARCHAR(255),
NGAY_BAT_DAU DATETIME DEFAULT GETDATE(),
NGAY_KET_THUC DATETIME ,
MUC_GIAM VARCHAR(100),
TRANG_THAI NVARCHAR(255),
Loai Bit,
So_Luong Nvarchar(10),
NGAY_TAO DATETIME ,
NGAY_SUA DATETIME ,
DIEU_KIEN_KHUYEN_MAI NVARCHAR(255),
)
GO
IF OBJECT_ID('HOA_DON') IS NOT NULL
DROP TABLE HOA_DON
CREATE TABLE HOA_DON (
ID INT IDENTITY(1,1) PRIMARY KEY,
MAHD VARCHAR(10),
ID_NHAN_VIEN INT ,
SO_LUONG INT ,
DON_GIA DECIMAL(10,2) ,
DIA_CHI_CU_THE NVARCHAR(225),
mo_ta_ly_do_huy nvarchar(255),
SO_DIEN_THOAI VARCHAR(12) ,
ID_KHACH_HANG INT ,
TONG_TIEN DECIMAL(10,2) ,
NGAY_MUA DATETIME DEFAULT GETDATE(),
TRANG_THAI INT,
NGAY_TAO DATETIME DEFAULT GETDATE() ,
NGAY_SUA DATETIME,
THANH_TIEN DECIMAL(10,2),
ID_VOUCHER int,
ACTIVE BIT,
CONSTRAINT FK_HOA_DON_KHACH_HANG FOREIGN KEY (ID_KHACH_HANG) REFERENCES KHACH_HANG (ID),
CONSTRAINT FK_HOA_DON_NHAN_VIEN FOREIGN KEY (ID_NHAN_VIEN) REFERENCES NHAN_VIEN (ID),
CONSTRAINT FK_HOA_DON_VOUCHER FOREIGN KEY (ID_VOUCHER) REFERENCES VOUCHER (ID),
)
GO
IF OBJECT_ID('TRANG_THAI_DON_HANG') IS NOT NULL
DROP TABLE TRANG_THAI_DON_HANG
CREATE TABLE TRANG_THAI_DON_HANG (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    TEN_TRANG_THAI NVARCHAR(50) NOT NULL,
	ANH_TRANG_THAI_DON_HANG VARBINARY(MAX)
);

GO
IF OBJECT_ID('DON_HANG') IS NOT NULL
DROP TABLE DON_HANG
CREATE TABLE DON_HANG (
    ID INT IDENTITY(1,1) PRIMARY KEY,
	ID_HOA_DON INT,
    NGAY_TAO DATETIME DEFAULT GETDATE(),
    ID_KHACH_HANG INT,
    ID_TRANG_THAI INT,
	DIACHI NVARCHAR(255),
	GHICHU NVARCHAR(255),
	TONGTIEN DECIMAL(10,2),
	SO_DIEN_THOAI VARCHAR(12),
	ID_NHAN_VIEN INT,
	TRANG_THAI BIT,
	CONSTRAINT FK_DON_HANG_HOA_DON FOREIGN KEY (ID_HOA_DON) REFERENCES HOA_DON (ID),
    CONSTRAINT FK_DON_HANG_TRANG_THAI FOREIGN KEY (ID_TRANG_THAI) REFERENCES TRANG_THAI_DON_HANG(ID),
    CONSTRAINT FK_DON_HANG_KHACH_HANG FOREIGN KEY (ID_KHACH_HANG) REFERENCES KHACH_HANG(ID),
	CONSTRAINT FK_DON_HANG_NHAN_VIEN FOREIGN KEY (ID_NHAN_VIEN) REFERENCES NHAN_VIEN(ID) 
);
GO
IF OBJECT_ID('LICH_SU_DON_HANG') IS NOT NULL
DROP TABLE LICH_SU_DON_HANG
CREATE TABLE LICH_SU_DON_HANG (
ID INT IDENTITY(1,1) PRIMARY KEY,
NGAY_TAO DATETIME DEFAULT GETDATE() ,
NGAY_SUA DATETIME,
ID_NHAN_VIEN INT ,
ID_TRANG_THAI_DON_HANG INT,
ID_DON_HANG INT,
TRANG_THAI BIT,
MO_TA NVARCHAR(255),
GHI_CHU NVARCHAR(255),
CONSTRAINT FK_LICH_SU_DON_HANG_TRANG_THAI_DON_HANG FOREIGN KEY (ID_TRANG_THAI_DON_HANG) REFERENCES TRANG_THAI_DON_HANG (ID),
CONSTRAINT FK_LICH_SU_DON_HANG_NHAN_VIEN FOREIGN KEY (ID_NHAN_VIEN) REFERENCES NHAN_VIEN (ID),
CONSTRAINT FK_LICH_SU_DON_HANG_DON_HANG FOREIGN KEY (ID_DON_HANG) REFERENCES DON_HANG (ID),
)
GO
IF OBJECT_ID('THANH_TOAN') IS NOT NULL
DROP TABLE THANH_TOAN
CREATE TABLE THANH_TOAN (
ID INT IDENTITY(1,1) PRIMARY KEY,
HINH_THUC_THANH_TOAN INT ,
ID_KHACH_HANG INT ,
ID_HOA_DON INT ,
CONSTRAINT FK_THANH_TOAN_KHACH_HANG FOREIGN KEY (ID_KHACH_HANG) REFERENCES KHACH_HANG (ID),
CONSTRAINT FK_THANH_TOAN_HOA_DON FOREIGN KEY (ID_HOA_DON) REFERENCES HOA_DON (ID),

)
GO
IF OBJECT_ID('HOA_DON_CHI_TIET') IS NOT NULL
DROP TABLE HOA_DON_CHI_TIET
CREATE TABLE HOA_DON_CHI_TIET (
ID INT IDENTITY(1,1) PRIMARY KEY,
MAHDCT VARCHAR(10) ,
ID_NHAN_VIEN INT ,
ID_SAN_PHAM_CHI_TIET INT ,
ID_HOA_DON INT ,
SO_LUONG INT,
DON_GIA DECIMAL(10,2) ,
NGAY_TAO DATETIME DEFAULT GETDATE() ,
NGAY_SUA DATETIME,
TONG_TIEN  DECIMAL(10,2),
HINH_THUC_THANH_TOAN NVARCHAR(255),
TRANG_THAI BIT,
CONSTRAINT FK_HOA_DON_CHI_TIET_SAN_PHAM_CHI_TIET FOREIGN KEY (ID_SAN_PHAM_CHI_TIET) REFERENCES SAN_PHAM_CHI_TIET (ID),
CONSTRAINT FK_HOA_DON_CHI_TIET_HOA_DON FOREIGN KEY (ID_HOA_DON) REFERENCES HOA_DON (ID),

)
GO
IF OBJECT_ID('DOI_TRA') IS NOT NULL
DROP TABLE DOI_TRA
CREATE TABLE DOI_TRA (
ID INT IDENTITY(1,1) PRIMARY KEY,
ANH_SAN_PHAM_LOI VARBINARY(MAX),
ID_KHACH_HANG INT ,
LY_DO_DOI NVARCHAR(255) ,
NGAY_DOI_TRA DATETIME,
TRANG_THAI BIT ,
MO_MA NVARCHAR(255),
ID_HOA_DON_CHI_TIET INT,
HINH_THUC_THANH_TOAN NVARCHAR(255) 
CONSTRAINT FK_DOI_TRA_KHACH_HANG FOREIGN KEY (ID_KHACH_HANG) REFERENCES KHACH_HANG (ID),
CONSTRAINT FK_DOI_TRA_HOA_DON_CHI_TIET FOREIGN KEY (ID_HOA_DON_CHI_TIET) REFERENCES HOA_DON_CHI_TIET (ID),
)
GO
IF OBJECT_ID('SAN_PHAM_LOI') IS NOT NULL
DROP TABLE SAN_PHAM_LOI
CREATE TABLE SAN_PHAM_LOI (
ID INT IDENTITY(1,1) PRIMARY KEY,
TEN_SAN_PHAM_LOI NVARCHAR(255),
MO_MA NVARCHAR(255),
ID_HOA_DON_CHI_TIET INT,
SO_LUONG INT ,
CONSTRAINT FK_SAN_PHAM_LOI_HOA_DON_CHI_TIET FOREIGN KEY (ID_HOA_DON_CHI_TIET) REFERENCES HOA_DON_CHI_TIET (ID),
)

GO
IF OBJECT_ID('HOA_DON_VOUCHER') IS NOT NULL
DROP TABLE HOA_DON_VOUCHER
CREATE TABLE HOA_DON_VOUCHER (
ID INT IDENTITY(1,1) PRIMARY KEY,
ID_VOUCHER INT ,
ID_HOA_DON_CHI_TIET INT,
SO_TIEN_CON_LAI DECIMAL(10,2) ,
CONSTRAINT FK_HOA_DON_VOUCHER_VOUCHER FOREIGN KEY (ID_VOUCHER) REFERENCES VOUCHER (ID),
CONSTRAINT FK_HOA_DON_VOUCHER_HOA_DON_CHI_TIEN FOREIGN KEY (ID_HOA_DON_CHI_TIET) REFERENCES HOA_DON_CHI_TIET (ID),
)
GO
IF OBJECT_ID('SAN_PHAM_YEU_THICH') IS NOT NULL
DROP TABLE SAN_PHAM_YEU_THICH
CREATE TABLE SAN_PHAM_YEU_THICH (
ID INT IDENTITY(1,1) PRIMARY KEY,
ID_KHACH_HANG INT ,
ID_SAN_PHAM INT,
NGAY_TAO DATETIME DEFAULT GETDATE(),
CONSTRAINT FK_SAN_PHAM_YEU_THICH_KHACH_HANG FOREIGN KEY (ID_KHACH_HANG) REFERENCES KHACH_HANG (ID),
CONSTRAINT FK_SAN_PHAM_YEU_THICH_SAN_PHAM FOREIGN KEY (ID_SAN_PHAM) REFERENCES SAN_PHAM (ID),
)
GO
IF OBJECT_ID('SAN_PHAM_DA_XEM') IS NOT NULL
DROP TABLE SAN_PHAM_DA_XEM
CREATE TABLE SAN_PHAM_DA_XEM (
ID INT IDENTITY(1,1) PRIMARY KEY,
NGAY_XEM DATETIME DEFAULT GETDATE() ,
 TRANG_THAI BIT ,
ID_KHACH_HANG INT ,
ID_SAN_PHAM INT,
CONSTRAINT FK_SAN_PHAM_DA_XEM_KHACH_HANG FOREIGN KEY (ID_KHACH_HANG) REFERENCES KHACH_HANG (ID),
CONSTRAINT FK_SAN_PHAM_DA_XEM_SAN_PHAM FOREIGN KEY (ID_SAN_PHAM) REFERENCES SAN_PHAM (ID),
)

INSERT INTO THUONG_HIEU (TEN_THUONG_HIEU, MA_THUONG_HIEU, TRANG_THAI)
VALUES 
('Nike', 'TH001', 1),
('Adidas', 'TH002', 1),
('Puma', 'TH003', 1);
INSERT INTO CHAT_LIEU (MA_CHAT_LIEU, TEN_CHAT_LIEU, TRANG_THAI)
VALUES 
('CL001', 'Cotton', 1),
('CL002', 'Polyester', 1),
('CL003', 'Leather', 1);
INSERT INTO DANH_MUC (TEN_DANH_MUC, MA_DANH_MUC, TRANG_THAI)
VALUES 
('Áo Thể Thao', 'DM001', 1),
('Áo Thun', 'DM002', 1),
('Áo Sơ Mi', 'DM003', 1);
INSERT INTO NHA_SAN_XUAT (MA_NHA_SAN_XUAT, TEN_NHA_SAN_XUAT, TRANG_THAI)
VALUES 
('NSX001', 'Việt Nam', 1),
('NSX002', 'Trung Quốc', 1),
('NSX003', 'Mỹ', 1);
INSERT INTO CO_AO (TEN_CO_AO, MA_CO_AO, TRANG_THAI)
VALUES 
('Cổ Tròn', 'CA001', 1),
('Cổ Tim', 'CA002', 1),
('Cổ Bẻ', 'CA003', 1);
INSERT INTO SAN_PHAM (MA_SAN_PHAM, TEN_SAN_PHAM, ANH_SAN_PHAM, ID_DANH_MUC, ID_NHA_SAN_XUAT, SO_LUONG_SAN_PHAM, ID_THUONG_HIEU, ID_CO_AO, ID_CHAT_LIEU, TRANG_THAI)
VALUES 
('SP001', 'Áo Thể Thao Nike', 'ao_nike.jpg', 1, 1, 100, 1, 1, 1, 1),
('SP002', 'Áo Thun Adidas', 'ao_adidas.jpg', 2, 2, 150, 2, 2, 2, 1),
('SP003', 'Áo Sơ Mi Puma', 'ao_puma.jpg', 3, 3, 200, 3, 3, 3, 1),
('SP004', 'Áo Thun đen', 'ao_adidas.jpg', 2, 2, 150, 2, 2, 2, 1),
('SP005', 'Áo Sơ Mi trắng', 'ao_puma.jpg', 3, 3, 200, 3, 3, 3, 1),
('SP006', 'Áo len', 'ao_puma.jpg', 3, 3, 200, 3, 3, 3, 1);
INSERT INTO KICH_THUOC (MA_KICH_THUOC, TEN_KICH_THUOC, TRANG_THAI)
VALUES 
('KT001', 'S', 1),
('KT002', 'M', 1),
('KT003', 'L', 1);
INSERT INTO MAU_SAC (MA_MAU_SAC, TEN_MAU_SAC, TRANG_THAI)
VALUES 
('MS001', 'Đỏ', 1),
('MS002', 'Xanh', 1),
('MS003', 'Trắng', 1);
INSERT INTO SAN_PHAM_CHI_TIET (ANH_SAN_PHAM_CHI_TIET, ID_SAN_PHAM, ID_KICH_THUOC, ID_MAU_SAC, SO_LUONG_SAN_PHAM_CHI_TIET, DON_GIA, MO_TA, TRANG_THAI)
VALUES 
('ct_sp1.jpg', 1, 1, 1, 50, 199.99, 'Áo thể thao màu đỏ size S', 1),
('ct_sp2.jpg', 2, 2, 2, 60, 299.99, 'Áo thun màu xanh size M', 1),
('ct_sp3.jpg', 3, 3, 3, 70, 399.99, 'Áo sơ mi màu trắng size L', 1);
INSERT INTO TINH_THANH_PHO (TEN_TINH_THANH_PHO)
VALUES 
('Hà Nội'),
('Hồ Chí Minh'),
('Đà Nẵng');
INSERT INTO QUAN_HUYEN (TEN_QUAN_HUYEN, ID_TINH_THANH_PHO)
VALUES 
('Ba Đình', 1),
('Quận 1', 2),
('Hải Châu', 3);
INSERT INTO XA_PHUONG (TEN_XA_PHUONG, ID_QUAN_HUYEN)
VALUES 
('Phường 1', 1),
('Phường 2', 2),
('Phường 3', 3);
INSERT INTO KHACH_HANG (MA_KHACH_HANG, TEN_TAI_KHOAN, MAT_KHAU, SO_DIEN_THOAI, DIA_CHI_CU_THE, TEN_KHACH_HANG, TRANG_THAI, ID_TINH_THANH_PHO, ID_QUAN_HUYEN, ID_XA_PHUONG)
VALUES 
('KH001', 'khachhang1', 'pass123', '0901234567', 'Số 1, Hà Nội', 'Nguyễn Văn A', 1, 1, 1, 1),
('KH002', 'khachhang2', 'pass456', '0901234568', 'Số 2, HCM', 'Trần Thị B', 1, 2, 2, 2),
('KH003', 'khachhang3', 'pass789', '0901234569', 'Số 3, Đà Nẵng', 'Lê Văn C', 1, 3, 3, 3);
INSERT INTO NHAN_VIEN (TEN_NHAN_VIEN, MA_NHAN_VIEN, TEN_TAI_KHOAN, MAT_KHAU, CHUC_VU, TRANG_THAI)
VALUES 
('Nhân Viên 1', 'NV001', 'nhanvien1', 'nvpass123', 'Bán hàng', 1),
('Nhân Viên 2', 'NV002', 'nhanvien2', 'nvpass456', 'Quản lý', 1);



SELECT * FROM danh_muc WHERE TEN_DANH_MUC = 'ad';

SELECT * FROM mau_sac
SELECT * FROM SAN_PHAM_CHI_TIET
select * from THUONG_HIEU
select * from NHAN_VIEN
select * from HOA_DON_CHI_TIET
select * from HOA_DON
select * from CHAT_LIEU
select * from tai_khoan
select * from KHACH_HANG
select * from NHAN_VIEN
select * from VAI_TRO
select * from CHI_TIET_VAI_TRO
SELECT * FROM SAN_PHAM_CHI_TIET

SELECT * FROM gio_hang

DECLARE @tenSanPham NVARCHAR(255) = N'áo thun nam'; 
DECLARE @chatLieu NVARCHAR(255) =  null; 
DECLARE @mauSac NVARCHAR(255) = null; 
DECLARE @kichThuoc NVARCHAR(255) = null; 

SELECT spct.*
FROM SAN_PHAM_CHI_TIET spct
INNER JOIN SAN_PHAM sp ON spct.ID_SAN_PHAM = sp.ID
INNER JOIN KICH_THUOC kt ON spct.ID_KICH_THUOC = kt.ID
INNER JOIN MAU_SAC ms ON spct.ID_MAU_SAC = ms.ID
INNER JOIN CHAT_LIEU cl ON sp.ID_CHAT_LIEU = cl.ID
WHERE 
    (sp.TEN_SAN_PHAM LIKE '%' + COALESCE(@tenSanPham, '') + '%' OR @tenSanPham IS NULL)
    AND (kt.TEN_KICH_THUOC = @kichThuoc OR @kichThuoc IS NULL)
    AND (ms.TEN_MAU_SAC = @mauSac OR @mauSac IS NULL)
    AND (cl.TEN_CHAT_LIEU = @chatLieu OR @chatLieu IS NULL);


/*  test
SELECT kh.ten_khach_hang, kh.so_dien_thoai, qh.ten_quan_huyen, t.ten_tinh
FROM khach_hang kh
JOIN quan_huyen qh ON kh.quan_huyen_id = qh.id
JOIN tinh t ON qh.tinh_id = t.id
WHERE t.ten_tinh = 'Hà Nội';
*/

select * from nhan_vien
select * from danh_muc 
select * from KHACH_HANG
delete danh_muc where TEN_DANH_MUC = 'áo có quai'

select * from MAU_SAC

update NHAN_VIEN
set AVATAR = GETDATE()

ALTER TABLE KHACH_HANG
ADD AVATAR VARBINARY(MAX);


----test ở đây nè , đăng nhập ở đây này




SELECT NV.TEN_KHACH_HANG, NV.TEN_TAI_KHOAN, NV.MAT_KHAU, R.TEN_DANG_NHAP , TEN_VAI_TRO
FROM KHACH_HANG NV
JOIN CHI_TIET_VAI_TRO R ON R.TEN_DANG_NHAP = NV.TEN_DANG_NHAP
JOIN VAI_TRO V ON V.ID = R.ID_VAI_TRO


-- Thêm dữ liệu vào bảng KHACH_HANG
INSERT INTO KHACH_HANG (MA_KHACH_HANG, TEN_TAI_KHOAN, MAT_KHAU, SO_DIEN_THOAI, DIA_CHI_CU_THE, TEN_KHACH_HANG, TRANG_THAI,DELETEAT,TINH_TRANG,TEN_DANG_NHAP)
VALUES
('KH001', 'taikhoan1', 'matkhau1', '0123456789', N'123 Đường A', N'Nguyễn Văn A', 1,1,1,'taikhoan1'),
('KH002', 'taikhoan2', 'matkhau2', '0987654321', N'456 Đường B', N'Trần Thị B', 1,1,1,'taikhoan2');

SELECT NV.TEN_NHAN_VIEN, NV.TEN_TAI_KHOAN, NV.MAT_KHAU, R.TEN_DANG_NHAP , TEN_VAI_TRO
FROM NHAN_VIEN NV
JOIN CHI_TIET_VAI_TRO R ON R.TEN_DANG_NHAP = NV.TEN_DANG_NHAP
JOIN VAI_TRO V ON V.ID = R.ID_VAI_TRO


UPDATE NHAN_VIEN
SET DELETEAT = 1 , TINH_TRANG =1 
WHERE ID = 3

INSERT INTO NHAN_VIEN (TEN_NHAN_VIEN,MA_NHAN_VIEN,TEN_TAI_KHOAN,MAT_KHAU,CHUC_VU,TRANG_THAI,DELETEAT,TINH_TRANG,TEN_DANG_NHAP) VALUES
(N'Ngô Văn Thái','NV003','A','THAI123',N'QUANLY',1,1,1,'A'),
(N'Trần Duy Khải','NV004','B','KHAI123',N'NHANVIEN',1,1,1,'B')