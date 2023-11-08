drop database testexam;
create database testexam;
use testexam;
create table dmsp(
	MaDM varchar (5) primary key not null,
	TenDM varchar (50),
    MoTaDM varchar(50),
    TrangThaiDM bit default 0
);
create table sp(
	MaSP varchar (5) not null,
    TenSP varchar (50) unique,
    GiaNhap int check(GiaNhap>0),
    GiaXuat int check(GiaXuat>0),
    TieuDeSP varchar (30),
    MoTaSP varchar (60),
    SoLuongSP smallint default 0,
    TrangThaiSP varchar(20),
    MaDM varchar(5),
    constraint primary key(MaSP,MaDM)
);
create table nd(
	MaND varchar (5) primary key not null,
	TenDangNhap varchar (30) not null,
    MatKhau varchar (30) not null,
    TenKH varchar (30) not null,
    email varchar (30) unique,
    SDT varchar (11) unique,
    DiaChi varchar(50) not null,
    NTNS date not null
);
create table hd(
	MaHD varchar(5) not null,
    NgayTaoHD date not null,
    MaND varchar (5),
    TrangThaiHD varchar (20),
    constraint primary key(MaHD,MaND)
);
create table hdct(
	MaHDCT int auto_increment,
    MaHD varchar (5),
    MaSP varchar (5),
    GiaSP int check (GiaSP>0),
    SoluongSPMua smallint,
    TongTien int,
    constraint primary key(MaHDCT,MaHD,MaSP)
);
create table bl(
	MaBL varchar (5), 
    MaND varchar (5),
    MaSP varchar (5) unique,
    NDBL text,
    NgayBL date,
    TrangThaiBL varchar (20),
    constraint primary key(MaBL,MaND,MaSP),
    foreign key (MaSP) references sp(MaSP)
);
alter table sp add constraint foreign key (MaDM) references dmsp(MaDM);
alter table hd add constraint foreign key (MaND) references nd(MaND);
alter table bl add constraint foreign key (MaND) references nd(MaND);
alter table hdct add constraint foreign key (MaHD) references hd(MaHD);
alter table hdct add constraint foreign key (MaSP) references sp(MaSP);

INSERT INTO dmsp
VALUES
    ('C001', 'Điện thoại di động', 'Mô tả danh mục sản phẩm điện thoại', 1),
    ('C002', 'Laptop', 'Mô tả danh mục sản phẩm laptop', 1),
    ('C003', 'Thời trang', 'Mô tả danh mục sản phẩm thời trang', 1),
    ('C004', 'Đồ gia dụng', 'Mô tả danh mục sản phẩm đồ gia dụng', 1),
    ('C005', 'Thực phẩm', 'Mô tả danh mục sản phẩm thực phẩm', 1);

INSERT INTO sp
VALUES
    ('P001', 'Samsung Galaxy', 8000000, 10000000, 'Điện thoại cao cấp', 'Mô tả chi tiết sản phẩm Samsung Galaxy', 50, 'Bán','C001'),
    ('P002', 'Dell XPS 13', 15000000, 18000000, 'Laptop siêu mỏng', 'Mô tả chi tiết sản phẩm Dell XPS 13', 30, 'Bán', 'C002'),
    ('P003', 'Áo sơ mi nam', 500000, 800000, 'Áo thời trang', 'Mô tả chi tiết sản phẩm áo sơ mi nam', 100, 'Bán', 'C003'),
    ('P004', 'Bếp điện từ', 2000000, 2500000, 'Bếp hiện đại', 'Mô tả chi tiết sản phẩm bếp điện từ', 20, 'Bán', 'C004'),
    ('P005', 'Gạo Lức', 20000, 25000, 'Gạo ngon', 'Mô tả chi tiết sản phẩm gạo Lức', 200, 'Bán', 'C005');
    
    
INSERT INTO nd
VALUES
    ('U001', 'user1', 'password1','user1', 'user1@gmail.com', '0123456789', 'Hà Nội', '1990-11-9'),
    ('U002', 'user2', 'password2','user2', 'user2@gmail.com', '0944454321', 'Quảng Nam','2000-05-15'),
    ('U003', 'user3', 'password3','user3', 'user3@gmail.com', '0369855555', 'Đà Nẵng', '1998-2-7'),
    ('U004', 'user4', 'password4','user4', 'user4@gmail.com', '0321657861', 'Cần Thơ', '2001-06-22'),
    ('U005', 'user5', 'password5','user5', 'user5@gmail.com', '0999779654', 'Hà Tĩnh', '1995-08-10');
    
INSERT INTO hd
VALUES
    ('I001', '2023-01-15', 'U001', 'Đã duyệt'),
    ('I002', '2023-02-10', 'U002', 'Đang chuyển hàng'),
    ('I003', '2023-03-20', 'U003', 'Đã nhận hàng'),
    ('I004', '2023-04-05', 'U004', 'Hoàn tất'),
    ('I005', '2023-05-12', 'U005', 'Đang đặt');
   
INSERT INTO hdct(MaHD,MaSP,GiaSP,SoluongSPMua,TongTien)
VALUES
    ('I001', 'P001', 10000000, 2, 20000000),
    ('I002', 'P002', 18000000, 1, 18000000),
    ('I003', 'P003', 800000, 5, 4000000),
    ('I004', 'P004', 2500000, 3, 7500000),
    ('I005', 'P005', 25000, 100, 2500000);   
    
INSERT INTO bl
VALUES
    ('C001', 'U001', 'P001', 'Sản phẩm tốt', '2023-02-01', 'Đã được duyệt'),
    ('C002', 'U002', 'P002', 'Rất ổn', '2023-03-05', 'Đang bình luận'),
    ('C003', 'U003', 'P003', 'Tuyệt vời', '2023-04-15', 'Đã được duyệt'),
    ('C004', 'U004', 'P004', 'Hàng chất lượng', '2023-05-20', 'Đang bình luận'),
    ('C005', 'U005', 'P005', 'Rẻ và ngon', '2023-06-10', 'Đã được duyệt');    
    
UPDATE dmsp SET MoTaDM = 'Mô tả danh mục sản phẩm điện thoại di dong' WHERE MaDM = 'C001';   
UPDATE sp SET GiaXuat = 700000 WHERE MaSP = 'P001'; 
UPDATE nd SET email = 'user1@gmail.com.vn' WHERE MaND = 'U001';
UPDATE hd SET NgayTaoHD = '2023-01-30' WHERE MaHD = 'I001'; 
UPDATE hdct SET SoluongSPMua = 9 WHERE MaHDCT = 2;
UPDATE bl SET TrangThaiBL ='Đã được duyệt' WHERE MaBL ='C002';

SELECT p.MaSP, p.TenSP, p.GiaXuat, p.MoTaSP, p.TrangThaiSP, Cl.TenDM
	FROM sp p
	INNER JOIN dmsp Cl ON Cl.MaDM = p.MaDM;

SELECT * FROM sp WHERE TenSP LIKE '_a%';    

SELECT * FROM sp WHERE GiaNhap IN(100000,350000, 700000);

SELECT * FROM sp WHERE GiaNhap BETWEEN 100000 AND 5000000
	ORDER BY GiaNhap;

SELECT u.TenKH, cmt.NDBL, cmt.NgayBL, p.TenSP
	FROM bl cmt
	INNER JOIN nd u ON u.MaND = cmt.MaND
    INNER JOIN sp p ON p.MaSP = cmt.MaSP
    ORDER BY cmt.NgayBL DESC;     
 
SELECT p.MaSP, p.TenSP, SUM(InvDe.SoluongSPMua) AS TongSoLuong
	FROM hd inv
	INNER JOIN hdct InvDe ON inv.MaHD = InvDe.MaHD
	INNER JOIN sp p ON InvDe.MaSP = p.MaSP
	WHERE inv.NgayTaoHD BETWEEN '2023-1-01' AND '2023-12-31'
	GROUP BY p.MaSP, p.TenSP
	ORDER BY TongSoLuong DESC
	LIMIT 3; 
    
 SELECT InvDe.MaHDCT,InvDe.MaHD, p.TenSP, MAX(InvDe.TongTien) AS TongTien
	FROM hdct InvDe
	INNER JOIN sp p ON p.MaSP = InvDe.MaSP
    INNER JOIN hd Inv ON Inv.MaHD = InvDe.MaHD
    GROUP BY InvDe.MaHDCT,InvDe.MaHD, p.TenSP
    ORDER BY TongTien DESC
	LIMIT 1;   

SELECT c.MaDM, c.TenDM, COUNT(p.MaSP) AS SoLuongSanPham
	FROM dmsp c
	LEFT JOIN sp p ON c.MaDM = p.MaDM
	GROUP BY c.MaDM, c.TenDM;
    
SELECT u.MaND, u.TenKH, u.email, p.TenSP, u.email, u.SDT, MAX(InvDe.SoluongSPMua)AS SoLuong
	FROM nd u
    INNER JOIN hd Inv ON Inv.MaND = u.MaND
    INNER JOIN hdct InvDe ON InvDE.MaHD = InvDe.MaHD
    INNER JOIN sp p ON p.MaSP = InvDe.MaSP
    GROUP BY u.MaND, u.TenKH, u.email, p.TenSP
    ORDER BY SoLuong DESC
    LIMIT 1;    