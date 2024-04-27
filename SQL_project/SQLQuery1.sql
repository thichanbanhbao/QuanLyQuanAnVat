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

CREATE TABLE DanhMucMonAn
(
id INT IDENTITY PRIMARY KEY,
ten NVARCHAR (100)  NOT NULL
)
GO
insert into DanhMucMonAn (id , ten)
values (1,N'Mì'),
       (2,N'Lẩu'),
	   (3,N'Khai vị'),
	   (4,N'Giải khát'),
	   (5,N'Món thêm mì'),
	   (6,N'Món thêm lẩu');

CREATE TABLE MonAn
(
id INT IDENTITY PRIMARY KEY,
ten NVARCHAR(100) NOT NULL,
gia float NOT NULL,
iddanhmucmonan int NOT NULL 

FOREIGN KEY (iddanhmucmonan) REFERENCES dbo.DanhMucMonAn(id)
)
GO
insert into MonAn (id,ten,gia,iddanhmucmonan)
values  (1,N'Mì Kim chi đặc biệt',69000,1),
		(2,N'Mì Soyum đặc biệt',69000,1),
		(3,N'Mì Kim chi hải sản',62000,1),
		(4,N'Mì Kim chi cá',49000,1),
		(5,N'Mì Kim chi bò Mỹ',55000,1),
		(6,N'Mì Kim chi gà',59000,1),
		(7,N'Mì Soyum hải sản',62000,1),
		(8,N'Mì Soyum bò Mỹ',55000,1),
		(9,N'Mì Sincay bò Mỹ',59000,1),
		(10,N'Mì Soyum heo gà',55000,1),
		(11,N'Mì Soyum heo',55000,1),
		(12,N'Mì Sincay hải sản',62000,1),
		(13,N'Lẩu 2 ngăn',199000,2),
		(14,N'Lẩu Tokbokki bò Mỹ (2 người)',199000,2),
		(15,N'Lẩu Tokbokki hải sản (2 người)',199000,2),
		(16,N'Kimbap chiên',45000,3),
		(17,N'Khoai tây chiên',32000,3),
		(18,N'Mandu chiên xốt cay',35000,3),
		(19,N'Phô mai viên',29000,3),
		(20,N'Bánh bạch tuộc',39000,3),
		(21,N'Xiên bánh cá hầm',39000,3),
		(22,N'Cơm nắm',39000,3),
		(23,N'Đậu hũ xốt mè rang',39000,3),
		(24,N'Bánh bao Hàn Quốc nhân Heo Hầm',28000,3),
		(25,N'Bánh bao Hàn Quốc nhân Dồi Sụn',30000,3),
		(26,N'Bánh bao Hàn Quốc nhân Bò Bulgogi',32000,3),
		(27,N'Soda dâu dưa lưới',35000,4),
		(28,N'Dưa lưới thơm hạt chia',35000,4),
		(29,N'Soda dừa dứa đác thơm',35000,4),
		(30,N'Nước gạo Hàn Quốc',35000,4),
		(31,N'Trà đào Sasin',29000,4),
		(32,N'Trà dâu hoa hồng',29000,4),
		(33,N'Trà sữa Matcha',29000,4),
		(34,N'Trà sữa Sasin',29000,4),
		(35,N'Thịt heo cuộn',29000,5),
		(36,N'Trứng ngâm tương',12000,5),
		(37,N'Bò Mỹ',9000,5),
		(38,N'Tôm',9000,5),
		(39,N'Cá viên',6000,5),
		(40,N'Mực',9,0005),
		(41,N'Xúc xích',9000,5),
		(42,N'Bắp cải tím',6000,5),
		(43,N'Combo thịt (để sống)',69000,6),
		(44,N'Combo hải sản (để sống)',79000,6),
		(45,N'Combo rau nấm (để sống)',45000,6),
		(46,N'Combo Tokbokki thêm lẩu (để sống)',49000,6),
		(47,N'Tôm thêm lẩu (để sống)',45000,6);

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
trangthai int  not null default 0 ,--1:da thanh toan || 0 chua thanh toan

FOREIGN KEY (idban) REFERENCES dbo.Ban(id)
)
GO
insert into HoaDon(id,ngaykhachvao,ngaykhachra,idban,trangthai,tonggia)

values		(1,GETDATE(),null,1,0,0),
			(2,GETDATE(),GETDATE(),1,1,0),
			(3,GETDATE(),null,1,0,0);

CREATE TABLE ThongTinHoaDon
(
id INT IDENTITY PRIMARY KEY,
idhoadon int  not null,
idmonan int not null,
soluongmonan int not null default 0,

FOREIGN KEY (idhoadon) REFERENCES dbo.HoaDon(id),
FOREIGN KEY (idmonan) REFERENCES dbo.MonAn(id)
)
insert into ThongTinHoaDon(id,idhoadon,idmonan,soluongmonan)
values(1,1,1,3),
      (2,3,5,1),
	  (3,2,3,2);


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





select * from Ban 
select * from HoaDon
select * from ThongTinHoaDon
select * from MonAn
select * from DanhMucMonAn

SET IDENTITY_INSERT DanhMucMonAn ON


SET IDENTITY_INSERT HoaDon OFF


	   SET IDENTITY_INSERT ThongTinHoaDon ON

ALTER TABLE HoaDon
ALTER COLUMN trangthai int ;
		
drop database QuanLyQuanAnVat		
		




      

