USE [master]
GO
/****** Object:  Database [SachOnline]    Script Date: 29/11/2024 9:28:40 SA ******/
CREATE DATABASE [SachOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SachOnline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SachOnline.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SachOnline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SachOnline_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SachOnline] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SachOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SachOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SachOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SachOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SachOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SachOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [SachOnline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SachOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SachOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SachOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SachOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SachOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SachOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SachOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SachOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SachOnline] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SachOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SachOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SachOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SachOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SachOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SachOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SachOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SachOnline] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SachOnline] SET  MULTI_USER 
GO
ALTER DATABASE [SachOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SachOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SachOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SachOnline] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SachOnline] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SachOnline] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SachOnline', N'ON'
GO
ALTER DATABASE [SachOnline] SET QUERY_STORE = ON
GO
ALTER DATABASE [SachOnline] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SachOnline]
GO
/****** Object:  Table [dbo].[ADMIN]    Script Date: 29/11/2024 9:28:41 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADMIN](
	[MaAd] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[DienThoai] [varchar](10) NULL,
	[TenDN] [varchar](15) NULL,
	[MatKhau] [varchar](15) NULL,
	[Quyen] [int] NULL,
 CONSTRAINT [PK_AM] PRIMARY KEY CLUSTERED 
(
	[MaAd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BINHLUAN]    Script Date: 29/11/2024 9:28:41 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BINHLUAN](
	[MaBL] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NOT NULL,
	[MaSach] [int] NOT NULL,
	[NoiDung] [ntext] NOT NULL,
	[NgayBL] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_BINHLUAN] PRIMARY KEY CLUSTERED 
(
	[MaBL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHITIETDATHANG]    Script Date: 29/11/2024 9:28:41 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETDATHANG](
	[MaDonHang] [int] NOT NULL,
	[MaSach] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](9, 2) NULL,
 CONSTRAINT [PK_CTDH] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC,
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHUDE]    Script Date: 29/11/2024 9:28:41 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHUDE](
	[MaCD] [int] IDENTITY(1,1) NOT NULL,
	[TenChuDe] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CD] PRIMARY KEY CLUSTERED 
(
	[MaCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DONDATHANG]    Script Date: 29/11/2024 9:28:41 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONDATHANG](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[DaThanhToan] [bit] NULL,
	[TinhTrangGiaoHang] [int] NULL,
	[NgayDat] [smalldatetime] NULL,
	[NgayGiao] [smalldatetime] NULL,
	[MaKH] [int] NULL,
 CONSTRAINT [PK_DDH] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 29/11/2024 9:28:41 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[TaiKhoan] [varchar](15) NULL,
	[MatKhau] [varchar](70) NOT NULL,
	[Email] [varchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[DienThoai] [varchar](10) NULL,
	[NgaySinh] [smalldatetime] NULL,
 CONSTRAINT [PK_Kh] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MENU]    Script Date: 29/11/2024 9:28:41 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MENU](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](50) NULL,
	[MenuLink] [nvarchar](100) NULL,
	[ParentId] [int] NULL,
	[OrderNumber] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHAXUATBAN]    Script Date: 29/11/2024 9:28:41 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHAXUATBAN](
	[MaNXB] [int] IDENTITY(1,1) NOT NULL,
	[TenNXB] [nvarchar](100) NOT NULL,
	[DiaChi] [nvarchar](150) NULL,
	[DienThoai] [nvarchar](15) NULL,
 CONSTRAINT [PK_NXB] PRIMARY KEY CLUSTERED 
(
	[MaNXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SACH]    Script Date: 29/11/2024 9:28:41 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SACH](
	[MaSach] [int] IDENTITY(1,1) NOT NULL,
	[TenSach] [nvarchar](100) NOT NULL,
	[MoTa] [ntext] NULL,
	[AnhBia] [varchar](50) NULL,
	[NgayCapNhat] [smalldatetime] NULL,
	[SoLuongBan] [int] NULL,
	[GiaBan] [money] NULL,
	[MaCD] [int] NULL,
	[MaNXB] [int] NULL,
 CONSTRAINT [PK_S] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TACGIA]    Script Date: 29/11/2024 9:28:41 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TACGIA](
	[MaTG] [int] IDENTITY(1,1) NOT NULL,
	[TenTG] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](100) NULL,
	[TieuSu] [ntext] NULL,
	[DienThoai] [varchar](15) NULL,
 CONSTRAINT [PK_TG] PRIMARY KEY CLUSTERED 
(
	[MaTG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRANGTIN]    Script Date: 29/11/2024 9:28:41 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRANGTIN](
	[MaTT] [int] IDENTITY(1,1) NOT NULL,
	[TenTrang] [nvarchar](100) NOT NULL,
	[NoiDung] [ntext] NULL,
	[NgayTao] [smalldatetime] NULL,
	[MetaTitle] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VIETSACH]    Script Date: 29/11/2024 9:28:41 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VIETSACH](
	[MaTG] [int] NOT NULL,
	[MaSach] [int] NOT NULL,
	[VaiTro] [nvarchar](30) NULL,
	[ViTri] [nvarchar](30) NULL,
 CONSTRAINT [PK_VS] PRIMARY KEY CLUSTERED 
(
	[MaTG] ASC,
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ADMIN] ON 

INSERT [dbo].[ADMIN] ([MaAd], [HoTen], [DienThoai], [TenDN], [MatKhau], [Quyen]) VALUES (1, N'Võ Quốc Lương', N'0988936592', N'luongvq', N'12345', 1)
INSERT [dbo].[ADMIN] ([MaAd], [HoTen], [DienThoai], [TenDN], [MatKhau], [Quyen]) VALUES (2, N'Võ Nguyễn Nhật Minh', N'012344444', N'minhvnn', N'12345', 2)
INSERT [dbo].[ADMIN] ([MaAd], [HoTen], [DienThoai], [TenDN], [MatKhau], [Quyen]) VALUES (3, N'Võ Nguyễn Thái Hoàng', N'012344444', N'hoangvnt', N'12345', 2)
INSERT [dbo].[ADMIN] ([MaAd], [HoTen], [DienThoai], [TenDN], [MatKhau], [Quyen]) VALUES (4, N'Nguyễn Đức Quang Huy', N'0984265798', N'ndqhuy', N'12345', 1)
SET IDENTITY_INSERT [dbo].[ADMIN] OFF
GO
SET IDENTITY_INSERT [dbo].[BINHLUAN] ON 

INSERT [dbo].[BINHLUAN] ([MaBL], [MaKH], [MaSach], [NoiDung], [NgayBL]) VALUES (4, 1, 3, N'Sách hay quá ', CAST(N'2024-10-08T20:59:00' AS SmallDateTime))
INSERT [dbo].[BINHLUAN] ([MaBL], [MaKH], [MaSach], [NoiDung], [NgayBL]) VALUES (6, 1, 3, N'Mặc dù chưa mua
', CAST(N'2024-10-08T21:26:00' AS SmallDateTime))
INSERT [dbo].[BINHLUAN] ([MaBL], [MaKH], [MaSach], [NoiDung], [NgayBL]) VALUES (1010, 1, 13, N'a', CAST(N'2024-11-06T23:10:00' AS SmallDateTime))
INSERT [dbo].[BINHLUAN] ([MaBL], [MaKH], [MaSach], [NoiDung], [NgayBL]) VALUES (1011, 15, 3, N'Quá dễ đối với nam', CAST(N'2024-11-28T08:52:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[BINHLUAN] OFF
GO
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [MaSach], [SoLuong], [DonGia]) VALUES (1, 19, 1, CAST(25000.00 AS Decimal(9, 2)))
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [MaSach], [SoLuong], [DonGia]) VALUES (1, 23, 2, CAST(25000.00 AS Decimal(9, 2)))
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [MaSach], [SoLuong], [DonGia]) VALUES (2, 1, 1, CAST(26000.00 AS Decimal(9, 2)))
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [MaSach], [SoLuong], [DonGia]) VALUES (2, 17, 3, CAST(18000.00 AS Decimal(9, 2)))
GO
SET IDENTITY_INSERT [dbo].[CHUDE] ON 

INSERT [dbo].[CHUDE] ([MaCD], [TenChuDe]) VALUES (1, N'Ngoại ngữ')
INSERT [dbo].[CHUDE] ([MaCD], [TenChuDe]) VALUES (2, N'Công nghệ thông tin')
INSERT [dbo].[CHUDE] ([MaCD], [TenChuDe]) VALUES (3, N'Luật')
INSERT [dbo].[CHUDE] ([MaCD], [TenChuDe]) VALUES (4, N'Văn học')
INSERT [dbo].[CHUDE] ([MaCD], [TenChuDe]) VALUES (5, N'Khoa học kỹ thuật')
INSERT [dbo].[CHUDE] ([MaCD], [TenChuDe]) VALUES (6, N'Nông nghiệp')
INSERT [dbo].[CHUDE] ([MaCD], [TenChuDe]) VALUES (7, N'Triết học-Chính trị')
INSERT [dbo].[CHUDE] ([MaCD], [TenChuDe]) VALUES (8, N'Lịch sử, địa lý')
INSERT [dbo].[CHUDE] ([MaCD], [TenChuDe]) VALUES (9, N'Kinh tế')
INSERT [dbo].[CHUDE] ([MaCD], [TenChuDe]) VALUES (10, N'Sách giáo khoa')
INSERT [dbo].[CHUDE] ([MaCD], [TenChuDe]) VALUES (11, N'Nghệ thuật sống')
SET IDENTITY_INSERT [dbo].[CHUDE] OFF
GO
SET IDENTITY_INSERT [dbo].[DONDATHANG] ON 

INSERT [dbo].[DONDATHANG] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH]) VALUES (1, 0, 4, CAST(N'2021-05-10T00:00:00' AS SmallDateTime), CAST(N'2021-05-12T00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[DONDATHANG] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH]) VALUES (2, 0, 2, CAST(N'2021-05-07T00:00:00' AS SmallDateTime), CAST(N'2021-05-11T00:00:00' AS SmallDateTime), 1)
SET IDENTITY_INSERT [dbo].[DONDATHANG] OFF
GO
SET IDENTITY_INSERT [dbo].[KHACHHANG] ON 

INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChi], [DienThoai], [NgaySinh]) VALUES (1, N'Võ Quốc Lương', N'luongvq', N'12345', N'luongvq@tdmu.edu.vn', N'Phú Hòa', N'0988936592', CAST(N'1982-02-10T00:00:00' AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChi], [DienThoai], [NgaySinh]) VALUES (2, N'Nguyễn Tiến Luân', N'thang', N'123456', N'ntluan@hcmuns.edu.vn', N'Quận 6', N'Chua có', CAST(N'1981-03-10T00:00:00' AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChi], [DienThoai], [NgaySinh]) VALUES (3, N'Đặng Quốc Hòa', N'dqhoa', N'hoa', N'dqhoa@hcmuns.edu.vn', N'Sư Vạn Hạnh', N'Chua có', CAST(N'1980-04-10T00:00:00' AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChi], [DienThoai], [NgaySinh]) VALUES (4, N'Ngô Ngọc Ngân', N'nnngan', N'ngan', N'nnngan@hcmuns.edu.vn', N'Khu chung cư', N'0918544699', CAST(N'1982-02-19T00:00:00' AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChi], [DienThoai], [NgaySinh]) VALUES (5, N'Đỗ Quỳnh Hương', N'dqhuong', N'huong', N'dqhuong@hcmuns.edu.vn', N'Cống Quỳnh', N'0908123456', CAST(N'1985-06-13T00:00:00' AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChi], [DienThoai], [NgaySinh]) VALUES (6, N'Trần Thị Thu Trang', N'ttttrang', N'trang', N'ttrang@yahoo.com', N'Nơ Trang Long', N'Chua có', CAST(N'1990-12-10T00:00:00' AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChi], [DienThoai], [NgaySinh]) VALUES (7, N'Nguyễn Thiên Thanh', N'ntthanh', N'thanh', N'ntthanh@t3h.hcmuns.edu.vn', N'Hai Bà Trưng', N'0908320111', CAST(N'1986-12-12T00:00:00' AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChi], [DienThoai], [NgaySinh]) VALUES (8, N'Trần Thị Hải Yến', N'tthyen', N'yen', N'tthyan@vol.vnn.vn', N'Trần Hưng Đạo', N'8111111   ', CAST(N'1988-02-07T00:00:00' AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChi], [DienThoai], [NgaySinh]) VALUES (9, N'Nguyễn Thị Thanh Mai', N'nttmai', N'mai', NULL, N'Trần Quang Diệu', N'81111222', CAST(N'1992-06-10T00:00:00' AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChi], [DienThoai], [NgaySinh]) VALUES (10, N'Nguyễn Thành Danh', N'ntdanh', N'danh', N'ntdanh@yahoo.com', N'Cộng Hòa', N'8103751', CAST(N'1978-07-10T00:00:00' AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChi], [DienThoai], [NgaySinh]) VALUES (11, N'Phạm Thị Nga', N'ptnga', N'nga', N'ptnhung@hcmuns.edu.vn', N'Q6 - Tp.HCM', N'0831564512', CAST(N'1986-03-20T00:00:00' AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChi], [DienThoai], [NgaySinh]) VALUES (12, N'Lê Doanh Doanh', N'lddoanh', N'doanh', N'lddoanh@yahoo.com', N'2Bis Hùng Vương', N'07077865', CAST(N'1982-02-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChi], [DienThoai], [NgaySinh]) VALUES (13, N'Đòan Ngọc Minh Tâm', N'dnmtam', N'tam', N'ndmtam@yahoo.com', N'2 Đinh Tiên Hòang', N'0909092222', CAST(N'1982-10-21T00:00:00' AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChi], [DienThoai], [NgaySinh]) VALUES (14, N'Trần Khải Nhi', N'tknhi', N'nhi', N'tknhi@yahoo.com', N'3 Bùi Hữu Nghĩa', N'0909095555', CAST(N'1982-11-24T00:00:00' AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChi], [DienThoai], [NgaySinh]) VALUES (15, N'Vũ Văn Đạt', N'VuVanDat', N'123456', N'2224802010920@student.tdmu.edu.vn', N'1234MPTV', N'0869083495', CAST(N'2004-12-16T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF
GO
SET IDENTITY_INSERT [dbo].[MENU] ON 

INSERT [dbo].[MENU] ([Id], [MenuName], [MenuLink], [ParentId], [OrderNumber]) VALUES (1, N'TRANG CHỦ', N'', NULL, 1)
INSERT [dbo].[MENU] ([Id], [MenuName], [MenuLink], [ParentId], [OrderNumber]) VALUES (2, N'GIỚI THIỆU', N'gioi-thieu', NULL, 2)
INSERT [dbo].[MENU] ([Id], [MenuName], [MenuLink], [ParentId], [OrderNumber]) VALUES (3, N'DANH MỤC', N'danh-muc', NULL, 3)
INSERT [dbo].[MENU] ([Id], [MenuName], [MenuLink], [ParentId], [OrderNumber]) VALUES (4, N'LIÊN HỆ', N'lien-he', NULL, 4)
INSERT [dbo].[MENU] ([Id], [MenuName], [MenuLink], [ParentId], [OrderNumber]) VALUES (5, N'TDMU Link tự do', N'https://tdmu.edu.vn', NULL, 5)
INSERT [dbo].[MENU] ([Id], [MenuName], [MenuLink], [ParentId], [OrderNumber]) VALUES (6, N'Sách Ngoại ngữ', N'sach-theo-chu-de-1', 3, 1)
INSERT [dbo].[MENU] ([Id], [MenuName], [MenuLink], [ParentId], [OrderNumber]) VALUES (7, N'Sách CNTT', N'sach-theo-chu-de-2', 3, 2)
INSERT [dbo].[MENU] ([Id], [MenuName], [MenuLink], [ParentId], [OrderNumber]) VALUES (8, N'Tin học văn phòng', N'chi-tiet-sach-21', 7, 1)
INSERT [dbo].[MENU] ([Id], [MenuName], [MenuLink], [ParentId], [OrderNumber]) VALUES (9, N'Tin học ứng dụng', N'chi-tiet-sach-15', 7, 2)
SET IDENTITY_INSERT [dbo].[MENU] OFF
GO
SET IDENTITY_INSERT [dbo].[NHAXUATBAN] ON 

INSERT [dbo].[NHAXUATBAN] ([MaNXB], [TenNXB], [DiaChi], [DienThoai]) VALUES (1, N'Nhà xuất bản Trẻ', N'124 Nguyễn Văn Cừ Q.1 Tp.HCM', N'19001560')
INSERT [dbo].[NHAXUATBAN] ([MaNXB], [TenNXB], [DiaChi], [DienThoai]) VALUES (2, N'NXB Thống kê', N'Đồng Nai', N'19001511')
INSERT [dbo].[NHAXUATBAN] ([MaNXB], [TenNXB], [DiaChi], [DienThoai]) VALUES (3, N'Kim đồng', N'Tp.HCM', N'19001570')
INSERT [dbo].[NHAXUATBAN] ([MaNXB], [TenNXB], [DiaChi], [DienThoai]) VALUES (4, N'Đại học quốc gia', N'Tp.HCM', N'0908419981')
INSERT [dbo].[NHAXUATBAN] ([MaNXB], [TenNXB], [DiaChi], [DienThoai]) VALUES (5, N'Văn hóa nghệ thuật', N'Đà Nẵng', N'0903118833')
INSERT [dbo].[NHAXUATBAN] ([MaNXB], [TenNXB], [DiaChi], [DienThoai]) VALUES (6, N'Văn hóa', N'Bình Dương', N'0913336677')
INSERT [dbo].[NHAXUATBAN] ([MaNXB], [TenNXB], [DiaChi], [DienThoai]) VALUES (7, N'Lao động - Xã hội', N'Tp.HCM', N'0989888888')
INSERT [dbo].[NHAXUATBAN] ([MaNXB], [TenNXB], [DiaChi], [DienThoai]) VALUES (8, N'Khoa Học & Kỹ Thuật', N'Hà Nội', N'8351056')
SET IDENTITY_INSERT [dbo].[NHAXUATBAN] OFF
GO
SET IDENTITY_INSERT [dbo].[SACH] ON 

INSERT [dbo].[SACH] ([MaSach], [TenSach], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongBan], [GiaBan], [MaCD], [MaNXB]) VALUES (1, N'Giáo trình Tin học cơ bản', N'Nội dung của cuốn: Tin Học Cơ Bản Windows XP gồm có 7 chương:
Chương 1: Một số vấn đề cơ bản.     
Chương 2: Sử dụng nhanh thanh công cụ và thanh thực đơn trong My Computer và Windows Explorer.    
Chương 3: Các thao tác trong windows XP. 
Chương 4: Các thiết lập trong Windows XP. 
Chương 5: Bảo trì máy tính. 
Chương 6: Các phím tắt 
Chương 7: Hỏi và đáp các thắc mắc.
Xin trân trọng giới thiệu cuốn sách cùng bạn', N'THCB.jpg', CAST(N'2021-04-12T00:00:00' AS SmallDateTime), 120, 26000.0000, 7, 1)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongBan], [GiaBan], [MaCD], [MaNXB]) VALUES (2, N'Giáo trình Tin học văn phòng', N'Cuốn sách này gồm 3 phần sau:
Phần 1: Xử lý văn bản trong Microsoft Office Word 2007. 
Phần 2: Xử lý bảng tính trong Microsoft Office Excel 2007. 
Phần 3: Quản lý cơ sở dữ liệu trong Microsoft Office Access 2007.
Xin trân trọng giới thiệu cùng các bạn.', N'TH004.jpg', CAST(N'2020-04-12T00:00:00' AS SmallDateTime), 25, 12000.0000, 2, 2)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongBan], [GiaBan], [MaCD], [MaNXB]) VALUES (3, N'Lập Trình Cơ Sở Dữ Liệu Với Visual Basic 2005 Và ADO.NET 2.0', N'Cuốn sách "Lập Trình Cơ Sở Dữ Liệu Với Visual Basic 2005 Và ADO.NET 2.0" này giới thiệu các nội dung sau:
Chương 1: Căn bản về cơ sở dữ liệu.
Chương 2: Các bộ kết nối và tương tác dữ liệu.
Chương 3: Bộ chứa dữ liệu DataSet.
Chương 4: Bộ điều hợp dữ liệu DataAdapter.
Chương 5: Sử dụng các điều khiển ràng buộc dữ liệu.
Chương 6: Tạo báo cáo với Crystal Report.
Chương 7: ADO.NET và XML.
Xin trân trọng giới thiệu cùng các bạn.', N'Gt_Thcb.jpg', CAST(N'2021-04-20T00:00:00' AS SmallDateTime), 23, 11500.0000, 7, 3)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongBan], [GiaBan], [MaCD], [MaNXB]) VALUES (4, N'Visual Basic 2005 Tập 3, Quyển 2: Lập Trình Web', N'"Visual Basic 2005 Tập 3, Quyển 2: Lập Trình Web Với Cơ Sở Dữ Liệu" sẽ cung cấp kỹ thuật và hướng dẫn bạn:
Tự học xây dựng ứng dụng Web quản lý CSDL toàn diện với ADO.NET 2.0 và ASP.NET. 
Khai thác các đối tượng và nguồn dữ liệu dành cho WebForm. 
Sử dụng các điều khiển dữ liệu đặc thù dành riêng cho ASP.NET và Web. 
Làm quen với những khái niệm xử lý dữ liệu hoàn toàn mới. 
Ràng buộc dữ liệu với các thành phần giao diện Web Forms. 
Thiết kế ứng dụng Web "Quản lý CD Shop" trực quan và thực tế. 
Cung cấp một kiến thức hoàn chỉnh về Web cho các bạn yêu thích ngôn ngữ Visual Basic và .NET Framework.
Sách có kèm theo CD-ROM bài tập.
Xin trân trọng giới thiệu cùng các bạn.', N'LTWeb2005.jpg', CAST(N'2019-05-12T00:00:00' AS SmallDateTime), 240, 20000.0000, 8, 4)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongBan], [GiaBan], [MaCD], [MaNXB]) VALUES (5, N'Giáo trình Tin học quản lý 1', N'Mạng Máy Tính Và Hệ Thống Bảo Mật gồm 7 chương:
Chương I: Tổng quan về công nghệ mạng máy tính và mạng cục bộ.
Chương II: Các thiết bị mạng thông dụng và các chuẩn kết nối vật lý.
Chương III: TCP/IP và mạng Internet.
Chương IV: Hệ điều hành mạng đặc điểm của hệ điều hành mạng.
Chương V: Một số vấn đề an toàn và bảo mật thông tin trên mạng máy tính.
Chương VI: Giới thiệu hệ điều hành Windows NT.
Chương VII: Giới thiệu hệ điều hành UNIX.
Trân trọng giới thiệu.', N'TH001.jpg', CAST(N'2021-04-10T00:00:00' AS SmallDateTime), 16, 21000.0000, 3, 1)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongBan], [GiaBan], [MaCD], [MaNXB]) VALUES (6, N'Giáo trình Tin học quản lý 2', N'Mục đích của bộ sách này giúp bạn trở nên thành thạo cơ sở dữ liệu (CSDL) Oracle9i, đề cập đến tất cả những kiến thức cần thiết từ mô hình dữ liệu, quản trị CSDL, sao lưu phục hồi, mạng và xử lý sự cố cũng như hiệu chỉnh hiệu suất thực thi..., với sự kết hợp lý thuyết và thực hành về điều mà Nhà quản trị CSDL Oracle9i cần biết để sử dụng CSDL Oracle9i một cách hiệu quả từ chính bộ sách này.
Bộ sách được chia làm 2 tập, tập 1 đề cập các kiến thức cơ bản về CSDL, mô hình dữ liệu. Bạn sẽ được biết về hệ quản trị CSDL Oracle9i, tạo CSDL, kết nối và quản lý người dùng. Tập 2 hướng dẫn bạn cách nạp, sao lưu và phục hồi dữ liệu, quản lý hoạt động CSDL Oracle9i, thực hiện hiệu chỉnh hiệu suất thực thi và xử lý sự cố cho CSDL.
Xin trân trọng giới thiệu Tập 1 cùng các bạn.', N'130499.jpg', CAST(N'2020-10-12T00:00:00' AS SmallDateTime), 65, 21000.0000, 10, 5)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongBan], [GiaBan], [MaCD], [MaNXB]) VALUES (7, N'Giáo trình SQL Server', N'Hệ quản trị cơ sở dữ liệu SQl Server 2003
Test thu', N'Gt_Thcb.jpg', CAST(N'2004-08-16T00:00:00' AS SmallDateTime), 5, 18000.0000, 3, 6)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongBan], [GiaBan], [MaCD], [MaNXB]) VALUES (8, N'Phong Cách Quản Lý Kinh Doanh Hiện Đại ', N'Cuốn sách này không đi vào chi tiết những chủ đề quản lý cổ điển đã được nhắc đến trong nhiều cuốn sách khác như tổ chức cuộc họp, cung cấp số liệu, quản lý thời gian. Mục đích của cuốn sách này là mang lại cho bạn "nhiều hơn", một giá trị gia tăng so với những gì bạn đã biết và đã áp dụng, và giúp bạn tối ưu hóa việc quản lý chuyên môn và quản lý nhân sự.
Nội dung sách bao gồm 9 chương:
Chương 1: Bốn cách nhìn quản lý theo sắc màu.
Chương 2: Quản lý các sắc màu của một cộng tác viên.
Chương 3: Quản lý nhóm theo màu sắc.
Chương 4: Quyết định cách thích hợp dựa vào bản thân, người khác và hoàn cảnh.
Chương 5: Phát triển hiệu quả tối ưu theo sắc màu.
Chương 6: Hiểu rõ những sai lệch trong cách quản lý của mình.
Chương 7: Nền tảng cơ sở của hệ thống Success Insights: Bốn màu với tám kiểu.
Chương 8: Nhận biết và quản lý tám kiểu cộng tác viên.
Chương 9: Cải thiện người quản lý.
Xin trân trọng giới thiệu. 
', N'KT0002.jpg', CAST(N'2021-01-10T00:00:00' AS SmallDateTime), 5, 61000.0000, 9, 8)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongBan], [GiaBan], [MaCD], [MaNXB]) VALUES (10, N'Cán Bộ Quản Lý Trong Sản Xuất Công Nghiệp', N'Cuốn sách này gồm những nội dung chính sau:
Phần 1: Quản lý sản xuất công nghiệp trong kinh tế thị trường
- Kinh doanh sản xuất công nghiệp trong kinh tế thị trường
- Sự cần thiết và các chức năng của quản lý nhà nước đối với doanh nghiệp sản xuất công nghiệp
- Nội dung và tính chất của những công việc mà cán bộ quản lý sản xuất công nghiệp phải đảm nhiệm, hoàn thành.
- Kinh nghiệm đào tạo và đánh giá cán bộ quản lý kinh doanh ở Nhật.
Phần 2: Thực trạng và một số giải pháp nhằm nâng cao chất lượng đội ngũ cán bộ quản lý sản xuất công nghiệp Việt Nam
- Thực trạng cán bộ quản lý doanh nghiệp công nghiệp của Việt Nam
- Tiêu chuẩn hóa cán bộ quản lý sản xuất công nghiệp Việt Nam
- Đổi mới căn bản nội dung và phương pháp đào tạo cán bộ quản lý sản xuất công nghiệp Việt Nam
Xin trân trọng giới thiệu. 
 
', N'KT0001.jpg', CAST(N'2018-04-12T00:00:00' AS SmallDateTime), 89, 25000.0000, 5, 6)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongBan], [GiaBan], [MaCD], [MaNXB]) VALUES (11, N'Tư Duy Chiến Lược (Quản Lý - Tại Sao? Thế Nào?', N'Khả năng hoạch định dài hạn đồng thời tối ưu hóa tình hình hoạt động ngắn hạn là một yêu cầu bắt buộc phải có đối với các nhà quản lý.Tư Duy Chiến Lược sẽ giúp bạn vạch ra con đường đến thành công đồng thời giúp hình thành các kỹ năng phân tích và hoạch định theo nhóm. Tất cả các lĩnh vực then chốt để hình thành và thực thi một chiến lược đều được trình bày cặn kẽ trong cuốn sách này, từ việc nghiên cứu và thu thập thông tin nền tảng, hình thành một chiến lược mới đến việc xem xét và ứng dụng chiến lược ấy. Cả thảy có 101 chỉ dẫn nhằm cung cấp cho các bạn những lời khuyên thực tiễn hơn, đồng thời bài tập tự đánh giá sẽ giúp bạn xác định xem mình là một nhà tư duy chiến lược hiệu quả đến mức nào. Khi bạn có nhiều tham vọng hơn về việc hoạch định cho tương lai, cẩm nang này sẽ là quyển sách tham khảo không thể thiếu, giúp suy nghĩ của bạn đi đúng hướng.
Xin trân trọng giới thiệu cuốn sách cùng bạn. ', N'KT0001.jpg', CAST(N'2003-09-19T00:00:00' AS SmallDateTime), 8, 18000.0000, 11, 3)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongBan], [GiaBan], [MaCD], [MaNXB]) VALUES (12, N'Quản Lý Dự Án (Quản Lý - Tại Sao? Thế Nào?) ', N'Để thành công trong môi trường kinh doanh cạnh tranh hiện nay, các giám đốc dự án phải đạt được kết quả trong phạm thời gian và ngân sách đưa ra. Biết cách áp dụng các quy trình, phương pháp và kỹ thuật chỉ dẫn trong cuốn Quản Lý Dự Án này, bạn sẽ tăng tối đa khả năng thực hiện công việc và đảm bảo đạt kết quả tối ưu khi thực hiện dự án.
Được thiết kế phù hợp với tất cả các nhà quản lý ở đủ mọi trình độ, cẩm nang này sẽ trang bị cho bạn những kiến thức cần thiết trong việc quản lý mọi dự án, dù lớn hay nhỏ, để đạt đến thành công. Từ việc khởi xướng một dự án, thúc đẩy, phát triển nhóm dự án đến việc vượt qua những khó khăn, trở ngại; mỗi một khía cạnh của quản lý dự án chuyện nghiệp đều được trình bày một cách rõ nét. Cẩm nang bao gồm các hướng dẫn từng bước về hoạch định dự án và 101 mẹo vặt cung cấp cho bạn những lời khuyên thực tế. 
', N'KT0001.jpg', CAST(N'2020-02-12T00:00:00' AS SmallDateTime), 4, 61000.0000, 4, 8)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongBan], [GiaBan], [MaCD], [MaNXB]) VALUES (13, N'Điều Chỉnh Một Số Chính Sách Kinh Tế Ở Trung Quốc (Giai Đoạn 1992 - 2010)', N'Cuốn sách này tập trung vào một số nội dung chính sau đây:

Tìm hiểu về những nhân tố đòi hỏi Trung Quốc phải điều chỉnh chính sách kinh tế.

Tìm hiểu về những nội dung chính trong điều chỉnh kinh tế ở Trung Quốc giai đoạn từ năm 1992 - 2010.

Tìm hiểu về tác động của việc điều chỉnh chính sách kinh tế của Trung Quốc đối với thế giới và khu vực trong đó có Việt Nam, sau đó rút tỉa một số kinh nghiệm của Trung Quốc trong quá trình điều chỉnh chính sách kinh tế mà Việt Nam có thể tham khảo.
Tập thể tác giả tham gia công trình này đều là những người chuyên nghiên cứu về Trung Quốc, hy vọng sẽ đem lại cho các bạn nhiều thông tin bổ ích.', N'KT0001.jpg', CAST(N'2021-04-02T00:00:00' AS SmallDateTime), 19, 21000.0000, 1, 7)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongBan], [GiaBan], [MaCD], [MaNXB]) VALUES (14, N'30 phút mỗi ngày để luyện kỹ năng viết câu tiếng Anh', N'30 phút mỗi ngày để luyện kỹ năng viết câu tiếng Anh là một cuốn sách bài tập dành cho những học sinh/sinh viên nghiêm túc quan tâm đến tầm quan trọng của việc nâng cao những yếu tố kỹ thuật cho kỹ năng viết của mình. Rèn luyện để viết cho tốt chẳng khác gì tự trang bị cho mình một sức mạnh cần thiết để thành công - khi đi học cũng như khi ra ngoài xã hội. Trui rèn được một trình độ viết “cứng” không hề là chuyện bỗng nhiên trời cho mà có được; đó phải là kết quả của một quá trình phấn đấu bền bỉ và rèn luyện chăm chỉ.

Đặc nét của sách này là sử dụng cách tiếp cận những kỹ thuật kết hợp câu cơ bản, có nghĩa là, sách không chỉ quan tâm đến việc tránh những sai lỗi, mà còn đặt mục tiêu tạo dựng được những câu hay, linh hoạt, và thể hiện một phong cách riêng. Cạnh đó, sách còn có những điểm đáng lưu ý như: 

- Bàn thảo rõ ràng về những qui tắc và kỹ thuật giúp viết tốt.

- Giải thích súc tích, hạn chế dùng những thuật ngữ ngữ pháp.

- Lượng bài tập phong phú, đa dạng, từ những câu hỏi điền vào chỗ trống với mục đích xác định các từ loại cho đến những câu hỏi kết hợp những câu ngắn thành những câu văn dài hơn, ý tứ “duyên” hơn.

- Đáp án cuối sách nhằm giúp học sinh/sinh viên học và nghiên cứu nhanh chậm theo trình độ và ý thích của mình, đồng thời kiểm tra được bài làm trong quá trình học tập.

Học sinh/sinh viên tiếp thu tốt nhất khi họ tham gia tích cực và quá trình học. Họ rất thích những bài tập nào rèn cho họ được những kỹ năng viết họ cần đồng thời có giá trị thông tin nào đó hoặc vui vui. Đó chính là lý do cuốn sách này sử dụng đủ loại chủ đề thú vị trong các bài tập. Cũng vì lý do tương tự, sách có phần trình bày và giảng giải rất ngắn gọn những đưa ra rất nhiều những ví dụ và minh họa mở rộng.

Sử dụng cuốn 30 phút mỗi ngày để luyện kỹ năng viết câu tiếng Anh này sẽ giúp học sinh/sinh viên viết “có nghề” và tự tin hơn".', N'TiengAnh01.jpg', CAST(N'2016-02-10T00:00:00' AS SmallDateTime), 7, 85000.0000, 2, 1)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongBan], [GiaBan], [MaCD], [MaNXB]) VALUES (15, N'Tin Học Ứng Dụng: Thành Thạo Oracle 9i - Quản Trị Cơ Sở Dữ Liệu (Tập 1) ', N'Mục đích của bộ sách này giúp bạn trở nên thành thạo cơ sở dữ liệu (CSDL) Oracle9i, đề cập đến tất cả những kiến thức cần thiết từ mô hình dữ liệu, quản trị CSDL, sao lưu phục hồi, mạng và xử lý sự cố cũng như hiệu chỉnh hiệu suất thực thi..., với sự kết hợp lý thuyết và thực hành về điều mà Nhà quản trị CSDL Oracle9i cần biết để sử dụng CSDL Oracle9i một cách hiệu quả từ chính bộ sách này.
Bộ sách được chia làm 2 tập, tập 1 đề cập các kiến thức cơ bản về CSDL, mô hình dữ liệu. Bạn sẽ được biết về hệ quản trị CSDL Oracle9i, tạo CSDL, kết nối và quản lý người dùng. Tập 2 hướng dẫn bạn cách nạp, sao lưu và phục hồi dữ liệu, quản lý hoạt động CSDL Oracle9i, thực hiện hiệu chỉnh hiệu suất thực thi và xử lý sự cố cho CSDL.
Xin trân trọng giới thiệu Tập 1 cùng các bạn. ', N'TH001.jpg', CAST(N'2019-04-12T00:00:00' AS SmallDateTime), 28, 21000.0000, 1, 2)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongBan], [GiaBan], [MaCD], [MaNXB]) VALUES (16, N'Mạng Máy Tính Và Hệ Thống Bảo Mật ', N'Mạng Máy Tính Và Hệ Thống Bảo Mật gồm 7 chương:
Chương I: Tổng quan về công nghệ mạng máy tính và mạng cục bộ.
Chương II: Các thiết bị mạng thông dụng và các chuẩn kết nối vật lý.
Chương III: TCP/IP và mạng Internet.
Chương IV: Hệ điều hành mạng đặc điểm của hệ điều hành mạng.
Chương V: Một số vấn đề an toàn và bảo mật thông tin trên mạng máy tính.
Chương VI: Giới thiệu hệ điều hành Windows NT.
Chương VII: Giới thiệu hệ điều hành UNIX.
Trân trọng giới thiệu. 
', N'TH001.jpg', CAST(N'2020-04-29T00:00:00' AS SmallDateTime), 4, 23000.0000, 4, 1)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongBan], [GiaBan], [MaCD], [MaNXB]) VALUES (17, N'Thủ Thuật Lập Trình Visual Basic 6 ', N'Mục Lục:
Chương 1: Multimedia.
Chương 2: String.
Chương 3: Form.
Chương 4:Windows Control.
Chương 5: Common Control.
Chương 6: System.
Chương 7: Disk - File.
Chương 8: Graphics.
Chương 9: Internet.
Chương 10: Microsoft Office.
Chương 11: Database.
Chương 12: Clipboard.
Chương 13: Các vấn đề khác.
Phụ lục A: Giới thiệu một số ActiveX Control.
Phụ lục B: Một số tiện ích hỗ trợ lập trình Win32 API.
Phụ lục C: Một số vấn đề về đóng gói phần mềm.
Phụ lục D: Giới thiệu một số Website về Visual Basic.
Trân trọng giới thiệu. 
', N'TH001.jpg', CAST(N'2020-07-29T00:00:00' AS SmallDateTime), 5, 18000.0000, 6, 7)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongBan], [GiaBan], [MaCD], [MaNXB]) VALUES (18, N'Lập Trình Mạng Trên Windows (Ấn bản dành cho sinh viên) ', N'Chào mừng đến với "Lập Trình Mạng Trên Windows (Ấn bản dành cho sinh viên)". Quyển sách này sẽ hướng dẫn bạn sử dụng một cách hiệu quả bao gồm một số lượng lớn và đa dạng các hàm mạng sẵn có trong Windows 95, Windows 98, Windows NT 4, Windows CE, và Windows 2000/XP/. NET. Sách được chủ định viết dành cho những lập trình viên từ trung cấp đến cao cấp, tuy nhiên những lập trình viên mới bắt đầu tìm hiểu lập trình mạng cũng sẽ nhận thấy đây là một quyển sách không thể thiếu cho các bước xây dựng ứng dụng mạng sau này.
', N'TH001.jpg', CAST(N'2020-03-29T00:00:00' AS SmallDateTime), 8, 16800.0000, 5, 5)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongBan], [GiaBan], [MaCD], [MaNXB]) VALUES (19, N'Căn Bản Về Photoshop CS Tinh Chỉnh Và Xử Lý Màu ', N'"Căn Bản Về Photoshop CS Tinh Chỉnh Và Xử Lý Màu" gồm 12 chương:
Chương 1: Những điểm cơ bản.
Chương 2: Màu Photoshop.
Chương 3: Các tác vụ xử lý ảnh căn bản.
Chương 4: Các điểm cơ bản về pixel.
Chương 5: Các điểm cơ bản về lớp.
Chương 6: Làm việc với các công cụ chọn.
Chương 7: Ghép ảnh.
Chương 8: Làm việc với các palette History.
Chương 9: Các kỹ thuật điều chỉnh hình ảnh.
Chương 10: Chọn các màu.
Chương 11: Tô màu lại.
Chương 12: Làm việc với các công cụ tô vẽ.
Xin trân trọng giới thiệu. ', N'TH002.jpg', CAST(N'2019-07-23T00:00:00' AS SmallDateTime), 56, 25000.0000, 1, 6)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongBan], [GiaBan], [MaCD], [MaNXB]) VALUES (20, N' Hướng Dẫn Sử Dụng Norton AntiVirus 2004 (Hướng dẫn bằng hình)  
 ', N'"Hướng Dẫn Sử Dụng Norton AntiVirus 2004 (Hướng dẫn bằng hình)" bao gồm 6 phần, 23 chương:
Phần I: Bắt đầu với Norton AntiVirus 2004.
Chương 1: Bắt đầu với Norton AntiVirus 2004.
Chương 2: Cài đặt Norton System Works Professional.
Chương 3: Các điểm cơ bản về Norton AntiVirus 2004.
Chương 4: Các tùy chọn trong Norton SystemWorks.
Chương 5: Cải tiến sự trình duyệt Web và phục hồi đĩa cứng.
Chương 6: Duy trì tính bảo mật password và cập nhật với LiveUpdate.
Phần II: Làm việc với Norton AntiVirus 2004.
Chương 7: Bảo vệ đĩa, file và dữ liệu để tránh bị nhiễm Virus.
Chương 8: Những điều cần làm nếu phát hiện virus.
', N'TH002.jpg', CAST(N'2020-07-29T00:00:00' AS SmallDateTime), 4, 16800.0000, 5, 7)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongBan], [GiaBan], [MaCD], [MaNXB]) VALUES (21, N'Tin Học Văn Phòng - Microsoft Word 2000 (Tái Bản Lần Thứ Nhất) ', N' ', N'TH002.jpg', CAST(N'2020-02-23T00:00:00' AS SmallDateTime), 6, 15600.0000, 2, 8)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongBan], [GiaBan], [MaCD], [MaNXB]) VALUES (22, N'Adobe Photoshop 6.0 và ImageReady 3.0 ', N'Cuốn sách Adobe Photoshop 6.0 và ImageReady 3.0 này sẽ giúp bạn tìm hiểu những tính năng tuyệt vời của phiên bản 6.0, nó cũng là con đường ngắn nhất cho những người mới sử dụng Photoshop lần đầu. Với bạn đọc đã sử dụng cuốn sách "Adobe Photoshop 5.5 và ImageReady 2.0" do MK.PUB biên soạn trước đây, cuốn sách này là một cách cập nhật nhanh chóng nhất.
Adobe Photoshop 6.0 và ImageReady 3.0 gồm hai phần chính, đan xen nhau: 

Adobe Photoshop 6.0: trình bày các kỹ thuật xử lý ảnh cao cấp, các tính năng mới, giúp bạn tạo được các ảnh đẹp, rõ nét và mang tính mỹ thuật cao, hỗ trợ đắc lực cho các chương trình dàn trang và tách màu điện tử. Đặc biệt trong phiên bản này, để đáp ứng cho mong mỏi từ lâu của người dùng, các hình thể vector bắt đầu được đưa vào sử dụng trong môi trường Photoshop.

', N'TH002.jpg', CAST(N'2020-02-20T00:00:00' AS SmallDateTime), 8, 21000.0000, 5, 5)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongBan], [GiaBan], [MaCD], [MaNXB]) VALUES (23, N'Hướng Dẫn Tự Học Photoshop CS (Photoshop 8.0) ', N' ', N'TH003.jpg', CAST(N'2019-07-29T00:00:00' AS SmallDateTime), 9, 25000.0000, 8, 4)
INSERT [dbo].[SACH] ([MaSach], [TenSach], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongBan], [GiaBan], [MaCD], [MaNXB]) VALUES (24, N'Tin Học Văn Phòng - Microsoft Excel 2000 (Tái Bản Lần Thứ Nhất)', N'Cuốn sách này gồm những nội dung chính sau:
Chương 1: Giới thiệu
Chương 2: Soạn thảo văn bản
Chương 3: Trình bày Font chữ
Chương 4: Trình bày Paragraph
Chương 5: Trình bày trang in
Chương 6: Bảng biểu - Table
Chương 7: Cột chữ - Column
Chương 8: Hình vẽ
Chương 9: Microsoft Equation
Chương 10: Trình bày văn bản nhanh
Chương 11: Bài tập mẫu
Xin trân trọng giới thiệu. 
', N'TH003.jpg', CAST(N'2020-01-29T00:00:00' AS SmallDateTime), 1, 16800.0000, 6, 5)
SET IDENTITY_INSERT [dbo].[SACH] OFF
GO
SET IDENTITY_INSERT [dbo].[TACGIA] ON 

INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (1, N'Phạm Công Anh', N'197 Trần Hưng Đạo', NULL, N'98877668')
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (2, N'Nguyễn Thế Giang', N'179 Chánh hưng - F.4 - Q.8 Tp.HCM', NULL, N'19001611')
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (3, N'Lê Việt Nhân', N'45 Lý Thái Tổ-F2.Q.3 Tp.HCM', NULL, N'19001570')
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (4, N'Hồng Phúc', N'', NULL, N'')
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (5, N'Ks.Phạm Quang Huy', N'', NULL, N'')
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (6, N'Nguyễn Bá Tiến', N'', NULL, N'')
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (7, N'Phạm Hữu Khang', N'', NULL, N'')
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (8, N'Nguyễn Minh Đức', NULL, NULL, NULL)
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (9, N'Trần Văn Lăng', NULL, NULL, NULL)
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (10, N'Quách Tuấn Ngọc', NULL, NULL, NULL)
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (11, N'Nguyễn Xuân Huy', NULL, NULL, NULL)
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (12, N'Đoàn Khắc Độ', NULL, NULL, NULL)
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (13, N'Nguyễn Tấn Tín', N'179 Chánh Hưng F.4 Q.8 Tp.HCM', NULL, N'8504122')
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (14, N'Phạm Phan Trung', N'124 Bắc Hải P.6 Q.TB', NULL, N'0918121188')
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (15, N'TS. Nguyễn Phương Liên', N'', NULL, N'')
INSERT [dbo].[TACGIA] ([MaTG], [TenTG], [DiaChi], [TieuSu], [DienThoai]) VALUES (16, N'BS. Vũ Thị Uyên Thanh', N'', NULL, N'')
SET IDENTITY_INSERT [dbo].[TACGIA] OFF
GO
SET IDENTITY_INSERT [dbo].[TRANGTIN] ON 

INSERT [dbo].[TRANGTIN] ([MaTT], [TenTrang], [NoiDung], [NgayTao], [MetaTitle]) VALUES (1, N'GIỚI THIỆU', N'Đây là nội dung trang giới thiệu', CAST(N'2021-04-12T00:00:00' AS SmallDateTime), N'gioi-thieu')
INSERT [dbo].[TRANGTIN] ([MaTT], [TenTrang], [NoiDung], [NgayTao], [MetaTitle]) VALUES (2, N'LIÊN HỆ', N'Đây là nội dung trang liên hệ', CAST(N'2022-04-10T00:00:00' AS SmallDateTime), N'lien-he')
SET IDENTITY_INSERT [dbo].[TRANGTIN] OFF
GO
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (1, 1, N'Tác giả', N'')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (2, 24, N'Tác giả', N'')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (3, 1, N'Đồng tác giả', N'')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (3, 2, N'Tác giả', N'')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (4, 1, N'Hiệu đính', N'')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (5, 3, N'Tác giả', N'')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (5, 4, N'Tác giả', N'')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (5, 19, N'Tác giả', N'')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (6, 3, N'Hiệu đính', N'')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (6, 5, N'Tác giả', N'')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (6, 11, N'Tác giả', N'')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (7, 8, N'Tác giả', N'')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (7, 14, N'Tác giả', N'')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (8, 7, N'Tác giả', N'')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (8, 20, N'Tác giả', N'')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (10, 1, N'Chủ biên', N'')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (10, 22, N'Tác giả', N'')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (11, 10, N'Tác giả', N'')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (11, 23, N'Tác giả', N'')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (12, 5, N'Chủ biên', N'')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (12, 15, N'Tác giả', N'')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (13, 12, N'Tác giả', N'')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (13, 21, N'Tác giả', N'')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (14, 2, N'Đồng tác giả', N'')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (14, 6, N'Sưu tầm và biên soạn', N'')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (14, 16, N'Tác giả', N'')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (14, 17, N'Chủ biên', N'')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (15, 17, N'Tác giả', N'')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (15, 18, N'Tác giả', N'')
INSERT [dbo].[VIETSACH] ([MaTG], [MaSach], [VaiTro], [ViTri]) VALUES (16, 13, N'Tác giả', N'')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KHACHHAN__A9D105345900BE7C]    Script Date: 29/11/2024 9:28:41 SA ******/
ALTER TABLE [dbo].[KHACHHANG] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KHACHHAN__D5B8C7F02A5129E2]    Script Date: 29/11/2024 9:28:41 SA ******/
ALTER TABLE [dbo].[KHACHHANG] ADD UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ADMIN] ADD  DEFAULT ((1)) FOR [Quyen]
GO
ALTER TABLE [dbo].[DONDATHANG] ADD  DEFAULT ((0)) FOR [DaThanhToan]
GO
ALTER TABLE [dbo].[DONDATHANG] ADD  DEFAULT ((1)) FOR [TinhTrangGiaoHang]
GO
ALTER TABLE [dbo].[BINHLUAN]  WITH CHECK ADD  CONSTRAINT [FK_BINHLUAN_KHACHHANG] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[BINHLUAN] CHECK CONSTRAINT [FK_BINHLUAN_KHACHHANG]
GO
ALTER TABLE [dbo].[BINHLUAN]  WITH CHECK ADD  CONSTRAINT [FK_BINHLUAN_SACH] FOREIGN KEY([MaSach])
REFERENCES [dbo].[SACH] ([MaSach])
GO
ALTER TABLE [dbo].[BINHLUAN] CHECK CONSTRAINT [FK_BINHLUAN_SACH]
GO
ALTER TABLE [dbo].[CHITIETDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_CTDH_DDH] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DONDATHANG] ([MaDonHang])
GO
ALTER TABLE [dbo].[CHITIETDATHANG] CHECK CONSTRAINT [FK_CTDH_DDH]
GO
ALTER TABLE [dbo].[CHITIETDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_CTDH_S] FOREIGN KEY([MaSach])
REFERENCES [dbo].[SACH] ([MaSach])
GO
ALTER TABLE [dbo].[CHITIETDATHANG] CHECK CONSTRAINT [FK_CTDH_S]
GO
ALTER TABLE [dbo].[DONDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_DDH_KH] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[DONDATHANG] CHECK CONSTRAINT [FK_DDH_KH]
GO
ALTER TABLE [dbo].[SACH]  WITH CHECK ADD  CONSTRAINT [FK_S_CD] FOREIGN KEY([MaCD])
REFERENCES [dbo].[CHUDE] ([MaCD])
GO
ALTER TABLE [dbo].[SACH] CHECK CONSTRAINT [FK_S_CD]
GO
ALTER TABLE [dbo].[SACH]  WITH CHECK ADD  CONSTRAINT [FK_Sach_NXB] FOREIGN KEY([MaNXB])
REFERENCES [dbo].[NHAXUATBAN] ([MaNXB])
GO
ALTER TABLE [dbo].[SACH] CHECK CONSTRAINT [FK_Sach_NXB]
GO
ALTER TABLE [dbo].[VIETSACH]  WITH CHECK ADD  CONSTRAINT [FK_VS_S] FOREIGN KEY([MaSach])
REFERENCES [dbo].[SACH] ([MaSach])
GO
ALTER TABLE [dbo].[VIETSACH] CHECK CONSTRAINT [FK_VS_S]
GO
ALTER TABLE [dbo].[VIETSACH]  WITH CHECK ADD  CONSTRAINT [FK_VS_TG] FOREIGN KEY([MaTG])
REFERENCES [dbo].[TACGIA] ([MaTG])
GO
ALTER TABLE [dbo].[VIETSACH] CHECK CONSTRAINT [FK_VS_TG]
GO
ALTER TABLE [dbo].[CHITIETDATHANG]  WITH CHECK ADD CHECK  (([DonGia]>=(0)))
GO
ALTER TABLE [dbo].[CHITIETDATHANG]  WITH CHECK ADD CHECK  (([SoLuong]>(0)))
GO
ALTER TABLE [dbo].[SACH]  WITH CHECK ADD CHECK  (([GiaBan]>=(0)))
GO
ALTER TABLE [dbo].[SACH]  WITH CHECK ADD CHECK  (([SoLuongBan]>(0)))
GO
USE [master]
GO
ALTER DATABASE [SachOnline] SET  READ_WRITE 
GO
