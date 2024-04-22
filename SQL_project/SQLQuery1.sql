CREATE DATABASE QuanLyQuanAnVat
GO

USE QuanLyQuanAnVat
GO

CREATE TABLE TaiKhoan
(
tendangnhap NVARCHAR(100) primary key,
tenhienthi NVARCHAR(100) NOT NULL default N'an vat cung bee',
matkhau NVARCHAR(100) NOT NULL,
loai INT NOT NULL default 0 -- 1: anh chu dep trai || 0 nhan vien
)
GO 

CREATE TABLE DanhMucMonAn
(
id INT IDENTITY PRIMARY KEY,
ten NVARCHAR (100)  NOT NULL
)
GO

CREATE TABLE MonAn
(
id INT IDENTITY PRIMARY KEY,
ten NVARCHAR(100) NOT NULL,
gia float NOT NULL,
iddanhmucmonan int NOT NULL 

FOREIGN KEY (iddanhmucmonan) REFERENCES dbo.DanhMucMonAn(id)
)
GO

CREATE TABLE Ban
(
id INT PRIMARY KEY,
ten NVARCHAR(100) not null,
trangthai NVARCHAR (100) not null DEFAULT N'Trống'--trong || co nguoi
)
GO

CREATE TABLE HoaDon
(
id INT IDENTITY PRIMARY KEY,
ngaykhachvao DATE default getdate(),
ngaykhachra date,
idban int,
trangthai nvarchar not null default 0 ,--1:da thanh toan || 0 chuaw thanh toan
tonggia float

FOREIGN KEY (idban) REFERENCES dbo.Ban(id)
)
GO

CREATE TABLE ThongTinHoaDon
(
id INT IDENTITY PRIMARY KEY,
idhoadon int  not null,
idmonan int not null,
soluongmonan int not null default 0,

FOREIGN KEY (idhoadon) REFERENCES dbo.HoaDon(id),
FOREIGN KEY (idmonan) REFERENCES dbo.MonAn(id)
)


INSERT INTO dbo.TaiKhoan
(tendangnhap,
 tenhienthi,
 matkhau,
 loai
)
VALUES   (N'2k3',
          N'anh chủ quán đẹp trai',
		  N'123',
		  N'1'
         )
INSERT INTO dbo.TaiKhoan
(tendangnhap,
tenhienthi,
matkhau,
loai
)
VALUES   (N'staff',
          N'nhân viên',
		  N'123',
		  N'0'
         )
select *from TaiKhoan
GO 

CREATE PROC USP_GetAccountByUserName
@tendangnhap nvarchar(100)
AS 
BEGIN 
     SELECT * FROM TaiKhoan WHERE tendangnhap = @tendangnhap
END 
GO

EXEC USP_GetAccountByUserName @tendangnhap =N'2k3'

create proc USP_DangNhap
@tendangnhap nvarchar (100), @matkhau nvarchar (100)
as 
begin 
select *from TaiKhoan where tendangnhap = @tendangnhap and matkhau = @matkhau
end 
go

declare @i int = 1 
while @i<=10 
begin 
insert Ban(id,ten)values (@i,N'Bàn '+ cast (@i as nvarchar(100)))
set @i = @i+1
end 

select *from Ban

create proc USP_GetTableList
as 
select*from Ban
go

exec USP_GetTableList
go

update Ban set trangthai = N'Có người' where id = 3
go 






select * from HoaDon
select * from ThongTinHoaDon
select * from MonAn
select * from DanhMucMonAn
