USE [Pet_Care]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 06/06/2025 11:37:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[AdminName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Avatar] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 06/06/2025 11:37:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[AppointmentID] [int] IDENTITY(1,1) NOT NULL,
	[AppointmentDate] [date] NOT NULL,
	[AppointmentTime] [time](7) NOT NULL,
	[Status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banners]    Script Date: 06/06/2025 11:37:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banners](
	[BannerID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[CreatedDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[BannerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 06/06/2025 11:37:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](20) NULL,
	[Description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryServices]    Script Date: 06/06/2025 11:37:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryServices](
	[CategoryServiceID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryServiceName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 06/06/2025 11:37:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](15) NULL,
	[Address] [nvarchar](100) NULL,
	[Content] [nvarchar](max) NULL,
	[CreatedDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 06/06/2025 11:37:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](150) NULL,
	[Phone] [nvarchar](10) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[DateOfBirth] [date] NULL,
	[RegistrationDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 06/06/2025 11:37:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Content] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 06/06/2025 11:37:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ServiceID] [int] NULL,
	[PetID] [int] NULL,
	[AppointmentID] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [float] NOT NULL,
	[TotalPrice]  AS ([Quantity]*[Price]) PERSISTED,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 06/06/2025 11:37:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[StaffID] [int] NULL,
	[PaymentMethodID] [int] NULL,
	[OrderDate] [date] NULL,
	[Status] [nvarchar](50) NULL,
	[TotalAmount] [float] NULL,
	[Notes] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethods]    Script Date: 06/06/2025 11:37:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethods](
	[PaymentMethodID] [int] IDENTITY(1,1) NOT NULL,
	[MethodName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentMethodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pets]    Script Date: 06/06/2025 11:37:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pets](
	[PetID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[CategoryID] [int] NULL,
	[PetName] [nvarchar](100) NOT NULL,
	[Age] [int] NULL,
	[Weight] [float] NULL,
	[Color] [nvarchar](20) NULL,
	[Notes] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[PetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 06/06/2025 11:37:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[ServiceID] [int] NULL,
	[Comment] [nvarchar](max) NULL,
	[ReviewDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 06/06/2025 11:37:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryServiceID] [int] NULL,
	[ServiceName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [float] NOT NULL,
	[Status] [nvarchar](50) NULL,
	[CreatedDate] [date] NULL,
	[Image] [nvarchar](max) NULL,
	[OldPrice] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staffs]    Script Date: 06/06/2025 11:37:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staffs](
	[StaffID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](10) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[DateOfBirth] [date] NULL,
	[Salary] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admins] ON 

INSERT [dbo].[Admins] ([AdminID], [AdminName], [Email], [Password], [Avatar]) VALUES (1, N'Thhh', N'vuthao@gmail.com', N'8888', N'/images/admin/nth.jpg')
INSERT [dbo].[Admins] ([AdminID], [AdminName], [Email], [Password], [Avatar]) VALUES (2, N'Đậu', N'hanho@gmail.com', N'3257', N'/images/admin/hwh.jpg')
INSERT [dbo].[Admins] ([AdminID], [AdminName], [Email], [Password], [Avatar]) VALUES (3, N'Motor', N'bobo@gmail.com', N'0508', N'/images/admin/bhh.jpg')
INSERT [dbo].[Admins] ([AdminID], [AdminName], [Email], [Password], [Avatar]) VALUES (6, N'jungkook', N'jk@gmail.com', N'010998', N'/images/admin/jk.jpg')
SET IDENTITY_INSERT [dbo].[Admins] OFF
GO
SET IDENTITY_INSERT [dbo].[Appointments] ON 

INSERT [dbo].[Appointments] ([AppointmentID], [AppointmentDate], [AppointmentTime], [Status]) VALUES (1, CAST(N'2025-02-28' AS Date), CAST(N'09:00:00' AS Time), N'Đã hoàn thành')
INSERT [dbo].[Appointments] ([AppointmentID], [AppointmentDate], [AppointmentTime], [Status]) VALUES (2, CAST(N'2025-03-10' AS Date), CAST(N'16:30:00' AS Time), N'Chờ xác nhận')
INSERT [dbo].[Appointments] ([AppointmentID], [AppointmentDate], [AppointmentTime], [Status]) VALUES (5, CAST(N'2025-05-15' AS Date), CAST(N'14:00:00' AS Time), N'Chờ xác nhận')
INSERT [dbo].[Appointments] ([AppointmentID], [AppointmentDate], [AppointmentTime], [Status]) VALUES (6, CAST(N'2025-05-16' AS Date), CAST(N'10:10:00' AS Time), N'Chờ xác nhận')
INSERT [dbo].[Appointments] ([AppointmentID], [AppointmentDate], [AppointmentTime], [Status]) VALUES (7, CAST(N'2025-05-18' AS Date), CAST(N'02:20:00' AS Time), N'Chờ xác nhận')
INSERT [dbo].[Appointments] ([AppointmentID], [AppointmentDate], [AppointmentTime], [Status]) VALUES (8, CAST(N'2025-05-13' AS Date), CAST(N'16:35:00' AS Time), N'Chờ xác nhận')
INSERT [dbo].[Appointments] ([AppointmentID], [AppointmentDate], [AppointmentTime], [Status]) VALUES (9, CAST(N'2025-05-13' AS Date), CAST(N'11:41:00' AS Time), N'Chờ xác nhận')
INSERT [dbo].[Appointments] ([AppointmentID], [AppointmentDate], [AppointmentTime], [Status]) VALUES (10, CAST(N'2025-05-13' AS Date), CAST(N'11:41:00' AS Time), N'Chờ xác nhận')
INSERT [dbo].[Appointments] ([AppointmentID], [AppointmentDate], [AppointmentTime], [Status]) VALUES (11, CAST(N'2025-05-18' AS Date), CAST(N'14:32:00' AS Time), N'Chờ xác nhận')
SET IDENTITY_INSERT [dbo].[Appointments] OFF
GO
SET IDENTITY_INSERT [dbo].[Banners] ON 

INSERT [dbo].[Banners] ([BannerID], [Image], [Title], [CreatedDate]) VALUES (1, N'/images/banners/11.jpg', N'Title 1', CAST(N'2025-02-26' AS Date))
INSERT [dbo].[Banners] ([BannerID], [Image], [Title], [CreatedDate]) VALUES (2, N'/images/banners/15.jpg', N'Title 2', CAST(N'2025-02-26' AS Date))
INSERT [dbo].[Banners] ([BannerID], [Image], [Title], [CreatedDate]) VALUES (3, N'/images/banners/12.jpg', N'Title 3', CAST(N'2025-02-26' AS Date))
SET IDENTITY_INSERT [dbo].[Banners] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [Type], [Description]) VALUES (1, N'Chó', NULL)
INSERT [dbo].[Categories] ([CategoryID], [Type], [Description]) VALUES (2, N'Mèo', NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoryServices] ON 

INSERT [dbo].[CategoryServices] ([CategoryServiceID], [CategoryServiceName], [Description]) VALUES (1, N'Spa & Grooming', NULL)
INSERT [dbo].[CategoryServices] ([CategoryServiceID], [CategoryServiceName], [Description]) VALUES (2, N'Pet & Daycare', NULL)
INSERT [dbo].[CategoryServices] ([CategoryServiceID], [CategoryServiceName], [Description]) VALUES (3, N'Pet health check', NULL)
SET IDENTITY_INSERT [dbo].[CategoryServices] OFF
GO
SET IDENTITY_INSERT [dbo].[Contacts] ON 

INSERT [dbo].[Contacts] ([ContactID], [Title], [Email], [Phone], [Address], [Content], [CreatedDate]) VALUES (2, N'Thảo', N'vuthao@gmail.com', N'0548957153', NULL, N'chó mèo', CAST(N'2025-06-01' AS Date))
INSERT [dbo].[Contacts] ([ContactID], [Title], [Email], [Phone], [Address], [Content], [CreatedDate]) VALUES (3, N'Thanh Thảo', N'vy@gmail.com', N'0353072340', NULL, N'corgi bị trắng miệng', CAST(N'2025-06-01' AS Date))
SET IDENTITY_INSERT [dbo].[Contacts] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [FullName], [Address], [Phone], [Email], [Password], [DateOfBirth], [RegistrationDate]) VALUES (2, N'Ngu Thư Hân', N'Thượng Hải', N'0387185955', N'han@gmail.com', N'2222', NULL, CAST(N'2025-03-01' AS Date))
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Address], [Phone], [Email], [Password], [DateOfBirth], [RegistrationDate]) VALUES (5, N'Vũ Thị Thanh Thảo', N'Hà nam', N'0353072340', N'vuthaooo@gmail.com', N'8888', NULL, CAST(N'2025-03-01' AS Date))
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Address], [Phone], [Email], [Password], [DateOfBirth], [RegistrationDate]) VALUES (6, N'cola', N'hà nam', N'0987654322', N'vuthao23102003@gmail.com', N'6666', NULL, CAST(N'2025-03-01' AS Date))
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Address], [Phone], [Email], [Password], [DateOfBirth], [RegistrationDate]) VALUES (7, N'Phan Thị Ngọc Hà', N'Hà Nam', N'0352458961', N'ha0404@gmail.com', N'9f8834ed4d5f4cede09a8aa0f4682689d48307493c627dc3304230ac7e769395', NULL, CAST(N'2025-03-04' AS Date))
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Address], [Phone], [Email], [Password], [DateOfBirth], [RegistrationDate]) VALUES (9, N'Ngân Nguyễn', N'Ninh Bình', N'0123456859', N'ngannguyen123@gmail.com', N'123456', NULL, CAST(N'2025-05-12' AS Date))
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Address], [Phone], [Email], [Password], [DateOfBirth], [RegistrationDate]) VALUES (10, N'Mỹ Tâm', N'Hà Nam', N'0254897652', N'tam@gmail.com', N'123456', NULL, CAST(N'2025-05-12' AS Date))
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Address], [Phone], [Email], [Password], [DateOfBirth], [RegistrationDate]) VALUES (11, N'Mĩ Tiên', N'Nam Định', N'0353697584', N'tien@gmail.com', N'123456', NULL, CAST(N'2025-05-12' AS Date))
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Address], [Phone], [Email], [Password], [DateOfBirth], [RegistrationDate]) VALUES (12, N'Tâm Tâm', N'Ninh Bình', N'0589756984', N'Tam123@gmail.com', N'123456', NULL, CAST(N'2025-05-12' AS Date))
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Address], [Phone], [Email], [Password], [DateOfBirth], [RegistrationDate]) VALUES (13, N'Khánh Huyền', N'Hải Phòng', N'0589742598', N'huyen@gmail.com', N'123456', NULL, CAST(N'2025-05-12' AS Date))
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Address], [Phone], [Email], [Password], [DateOfBirth], [RegistrationDate]) VALUES (14, N'Khánh Vy', N'Hà Nam', N'0353845965', N'vy@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, CAST(N'2025-05-12' AS Date))
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ServiceID], [PetID], [AppointmentID], [Quantity], [Price]) VALUES (1, 4, 2, NULL, NULL, 1, 150000)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ServiceID], [PetID], [AppointmentID], [Quantity], [Price]) VALUES (2, 4, 9, NULL, NULL, 1, 1500000)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ServiceID], [PetID], [AppointmentID], [Quantity], [Price]) VALUES (7, 10, 3, 6, 8, 1, 200000)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ServiceID], [PetID], [AppointmentID], [Quantity], [Price]) VALUES (8, 11, 21, 6, 9, 1, 500000)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ServiceID], [PetID], [AppointmentID], [Quantity], [Price]) VALUES (9, 12, 21, 6, 10, 1, 500000)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ServiceID], [PetID], [AppointmentID], [Quantity], [Price]) VALUES (10, 11, 13, 6, 9, 1, 1000000)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ServiceID], [PetID], [AppointmentID], [Quantity], [Price]) VALUES (11, 12, 13, 6, 10, 1, 1000000)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ServiceID], [PetID], [AppointmentID], [Quantity], [Price]) VALUES (12, 13, 2, 6, 11, 1, 150000)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [CustomerID], [StaffID], [PaymentMethodID], [OrderDate], [Status], [TotalAmount], [Notes]) VALUES (4, 2, NULL, NULL, CAST(N'2025-03-04' AS Date), N'Chờ xử lý', 1650000, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [StaffID], [PaymentMethodID], [OrderDate], [Status], [TotalAmount], [Notes]) VALUES (5, 14, NULL, NULL, CAST(N'2025-05-12' AS Date), N'Chờ xử lý', 700000, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [StaffID], [PaymentMethodID], [OrderDate], [Status], [TotalAmount], [Notes]) VALUES (6, 14, NULL, NULL, CAST(N'2025-05-12' AS Date), N'Chờ xử lý', 1500000, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [StaffID], [PaymentMethodID], [OrderDate], [Status], [TotalAmount], [Notes]) VALUES (7, 14, NULL, NULL, CAST(N'2025-05-12' AS Date), N'Chờ xử lý', 1650000, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [StaffID], [PaymentMethodID], [OrderDate], [Status], [TotalAmount], [Notes]) VALUES (8, 14, NULL, NULL, CAST(N'2025-05-12' AS Date), N'Chờ xử lý', 1700000, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [StaffID], [PaymentMethodID], [OrderDate], [Status], [TotalAmount], [Notes]) VALUES (9, 14, NULL, NULL, CAST(N'2025-05-12' AS Date), N'Chờ xử lý', 500000, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [StaffID], [PaymentMethodID], [OrderDate], [Status], [TotalAmount], [Notes]) VALUES (10, 14, NULL, NULL, CAST(N'2025-05-12' AS Date), N'Chờ xử lý', 200000, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [StaffID], [PaymentMethodID], [OrderDate], [Status], [TotalAmount], [Notes]) VALUES (11, 14, NULL, NULL, CAST(N'2025-05-13' AS Date), N'Chờ xử lý', 1500000, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [StaffID], [PaymentMethodID], [OrderDate], [Status], [TotalAmount], [Notes]) VALUES (12, 14, NULL, NULL, CAST(N'2025-05-13' AS Date), N'Chờ xử lý', 1500000, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [StaffID], [PaymentMethodID], [OrderDate], [Status], [TotalAmount], [Notes]) VALUES (13, 14, NULL, NULL, CAST(N'2025-05-13' AS Date), N'Chờ xử lý', 150000, NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Pets] ON 

INSERT [dbo].[Pets] ([PetID], [CustomerID], [CategoryID], [PetName], [Age], [Weight], [Color], [Notes]) VALUES (4, 12, 2, N'Mare', 1, 2, N'đen', NULL)
INSERT [dbo].[Pets] ([PetID], [CustomerID], [CategoryID], [PetName], [Age], [Weight], [Color], [Notes]) VALUES (5, 13, 1, N'Poster', 3, 12, N'trắng vàng', N'giống Nhật')
INSERT [dbo].[Pets] ([PetID], [CustomerID], [CategoryID], [PetName], [Age], [Weight], [Color], [Notes]) VALUES (6, 14, 2, N'Mare', 2, 4, N'trắng', NULL)
SET IDENTITY_INSERT [dbo].[Pets] OFF
GO
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([ServiceID], [CategoryServiceID], [ServiceName], [Description], [Price], [Status], [CreatedDate], [Image], [OldPrice]) VALUES (1, 1, N'Tắm cơ bản', N'Làm sạch lông, vệ sinh tai, cắt móng, làm sạch tuyến hôi.', 100000, N'Hoạt động', CAST(N'2025-02-27' AS Date), N'/img/imgpetcare/tamcoban.jpg', 120000)
INSERT [dbo].[Services] ([ServiceID], [CategoryServiceID], [ServiceName], [Description], [Price], [Status], [CreatedDate], [Image], [OldPrice]) VALUES (2, 1, N'Tắm dưỡng chuyên sâu', N' Dành cho thú cưng có da nhạy cảm, bị nấm, viêm da.', 150000, N'Hoạt động', CAST(N'2025-02-27' AS Date), N'/img/imgpetcare/tamchuyensau.jpg', 180000)
INSERT [dbo].[Services] ([ServiceID], [CategoryServiceID], [ServiceName], [Description], [Price], [Status], [CreatedDate], [Image], [OldPrice]) VALUES (3, 1, N'Cắt tỉa lông tạo kiểu', N'Tạo dáng lông theo yêu cầu, cắt theo mùa hoặc theo giống.', 200000, N'Hoạt động', CAST(N'2025-02-27' AS Date), N'/img/imgpetcare/cattia.jpg', 220000)
INSERT [dbo].[Services] ([ServiceID], [CategoryServiceID], [ServiceName], [Description], [Price], [Status], [CreatedDate], [Image], [OldPrice]) VALUES (4, 1, N'Dưỡng lông, hấp dầu', N'Giúp lông bóng mượt, không bị xơ rối.', 300000, N'Hoạt động', CAST(N'2025-02-27' AS Date), N'/img/imgpetcare/hapdau.jpg', 350000)
INSERT [dbo].[Services] ([ServiceID], [CategoryServiceID], [ServiceName], [Description], [Price], [Status], [CreatedDate], [Image], [OldPrice]) VALUES (5, 1, N'Vệ sinh tai – Cắt móng – Mài móng', N'Ngăn ngừa vi khuẩn, giảm nguy cơ viêm nhiễm.', 500000, N'Hoạt động', CAST(N'2025-02-27' AS Date), N'/img/imgpetcare/catmong.jpg', 550000)
INSERT [dbo].[Services] ([ServiceID], [CategoryServiceID], [ServiceName], [Description], [Price], [Status], [CreatedDate], [Image], [OldPrice]) VALUES (7, 3, N'Kiểm tra tổng quát', N'Cân nặng, răng miệng, da lông, mắt, tai.', 500000, N'Hoạt động', CAST(N'2025-02-27' AS Date), N'/img/imgpetcare/kiemtra.jpg', 600000)
INSERT [dbo].[Services] ([ServiceID], [CategoryServiceID], [ServiceName], [Description], [Price], [Status], [CreatedDate], [Image], [OldPrice]) VALUES (8, 3, N'Hỗ trợ điều trị bệnh lý da liễu, tiêu hóa, viêm nhiễm nhẹ.', NULL, 700000, N'Hoạt động', CAST(N'2025-02-27' AS Date), N'/img/imgpetcare/dalieu.jpg', 750000)
INSERT [dbo].[Services] ([ServiceID], [CategoryServiceID], [ServiceName], [Description], [Price], [Status], [CreatedDate], [Image], [OldPrice]) VALUES (9, 2, N'Chuồng VIP1', N'Chuồng có lông mềm giúp bé thoải mái ngủ.', 1500000, N'Hoạt động', CAST(N'2025-03-01' AS Date), N'/img/imgpetcare/chuong6.jpg', 2000000)
INSERT [dbo].[Services] ([ServiceID], [CategoryServiceID], [ServiceName], [Description], [Price], [Status], [CreatedDate], [Image], [OldPrice]) VALUES (10, 3, N'Tiêm vaccine, tẩy giun', N'Phòng tránh bệnh truyền nhiễm, ký sinh trùng.', 500000, N'Hoạt động', CAST(N'2025-05-13' AS Date), N'/img/imgpetcare/cattia.jpg', 700000)
INSERT [dbo].[Services] ([ServiceID], [CategoryServiceID], [ServiceName], [Description], [Price], [Status], [CreatedDate], [Image], [OldPrice]) VALUES (11, 3, N'Cân nặng, thân nhiệt, nhịp tim', N'Đo chính xác và so sánh với mức trung bình của giống loài.', 700000, N'Hoạt động', CAST(N'2025-05-13' AS Date), N'/img/imgpetcare/tamchuyensau.jpg', 900000)
INSERT [dbo].[Services] ([ServiceID], [CategoryServiceID], [ServiceName], [Description], [Price], [Status], [CreatedDate], [Image], [OldPrice]) VALUES (12, 3, N'Tư vấn chế độ ăn – vận động', N'Dựa trên giống loài, cân nặng và sức khỏe.', 650000, N'Hoạt động', CAST(N'2025-05-13' AS Date), N'/img/imgpetcare/tamcoban.jpg', 700000)
INSERT [dbo].[Services] ([ServiceID], [CategoryServiceID], [ServiceName], [Description], [Price], [Status], [CreatedDate], [Image], [OldPrice]) VALUES (13, 2, N'Phòng ở riêng biệt', N'Chó, mèo được giữ ở khu riêng; có khu riêng cho thú cưng cá biệt (hung dữ, trầm cảm).', 1000000, N'Hoạt động', CAST(N'2025-05-13' AS Date), N'/img/imgpetcare/dalieu.jpg', 2000000)
INSERT [dbo].[Services] ([ServiceID], [CategoryServiceID], [ServiceName], [Description], [Price], [Status], [CreatedDate], [Image], [OldPrice]) VALUES (14, 2, N'Chế độ ăn theo yêu cầu', N'Cho ăn đúng khẩu phần, tránh dị ứng; có thể dùng thức ăn của khách mang tới.', 560000, N'Hoạt động', CAST(N'2025-05-13' AS Date), N'/img/imgpetcare/hapdau.jpg', 750000)
INSERT [dbo].[Services] ([ServiceID], [CategoryServiceID], [ServiceName], [Description], [Price], [Status], [CreatedDate], [Image], [OldPrice]) VALUES (15, 2, N'Khu vui chơi trong nhà và ngoài trời', N'Có đồ chơi, cầu thang, bóng, khu leo trèo an toàn.', 900000, N'Hoạt động', CAST(N'2025-05-13' AS Date), N'/img/imgpetcare/tamchuyensau.jpg', 950000)
INSERT [dbo].[Services] ([ServiceID], [CategoryServiceID], [ServiceName], [Description], [Price], [Status], [CreatedDate], [Image], [OldPrice]) VALUES (16, 2, N'Đi dạo theo giờ cố định', N'Nhân viên dẫn đi dạo sáng/tối tại khu vực an toàn, không cho tiếp xúc thú lạ.', 500000, N'Hoạt động', CAST(N'2025-05-13' AS Date), N'/img/imgpetcare/catmong.jpg', 750000)
INSERT [dbo].[Services] ([ServiceID], [CategoryServiceID], [ServiceName], [Description], [Price], [Status], [CreatedDate], [Image], [OldPrice]) VALUES (17, 2, N'Camera theo dõi từ xa', N'Cung cấp link cho khách theo dõi trực tiếp thú cưng tại cửa hàng (nếu có).', 2000000, N'Hoạt động', CAST(N'2025-05-13' AS Date), N'/img/imgpetcare/hapdau.jpg', 2500000)
INSERT [dbo].[Services] ([ServiceID], [CategoryServiceID], [ServiceName], [Description], [Price], [Status], [CreatedDate], [Image], [OldPrice]) VALUES (18, 2, N'Ghi chú nhật ký sinh hoạt', N'Ghi lại giờ ăn, giờ đi vệ sinh, chơi, nghỉ ngơi của từng thú.', 900000, N'Hoạt động', CAST(N'2025-05-13' AS Date), N'/img/imgpetcare/tamcoban.jpg', 1000000)
INSERT [dbo].[Services] ([ServiceID], [CategoryServiceID], [ServiceName], [Description], [Price], [Status], [CreatedDate], [Image], [OldPrice]) VALUES (19, 2, N'Nhân viên chăm sóc chuyên nghiệp', N'Đào tạo xử lý khi thú bị hoảng loạn, cắn nhau hoặc ốm.', 1500000, N'Hoạt động', CAST(N'2025-05-13' AS Date), N'/img/imgpetcare/hapdau.jpg', 1700000)
INSERT [dbo].[Services] ([ServiceID], [CategoryServiceID], [ServiceName], [Description], [Price], [Status], [CreatedDate], [Image], [OldPrice]) VALUES (20, 2, N'Chia nhóm theo tính cách/kích thước', N'Tránh stress, ẩu đả; có bảng phân nhóm rõ ràng.', 650000, N'Hoạt động', CAST(N'2025-05-13' AS Date), N'/img/imgpetcare/cattia.jpg', 1000000)
INSERT [dbo].[Services] ([ServiceID], [CategoryServiceID], [ServiceName], [Description], [Price], [Status], [CreatedDate], [Image], [OldPrice]) VALUES (21, 1, N'Đánh giá tình trạng lông/da', N'Trước và sau dịch vụ ghi lại nhận xét để theo dõi cải thiện.', 500000, N'Hoạt động', CAST(N'2025-05-13' AS Date), N'/img/imgpetcare/dalieu.jpg', 650000)
INSERT [dbo].[Services] ([ServiceID], [CategoryServiceID], [ServiceName], [Description], [Price], [Status], [CreatedDate], [Image], [OldPrice]) VALUES (22, 1, N'Massage thư giãn', N'Kết hợp với dầu thơm nhẹ giúp thú cưng giảm căng thẳng, thư giãn cơ.', 760000, N'Hoạt động', CAST(N'2025-05-13' AS Date), N'/img/imgpetcare/kiemtra.jpg', 500000)
INSERT [dbo].[Services] ([ServiceID], [CategoryServiceID], [ServiceName], [Description], [Price], [Status], [CreatedDate], [Image], [OldPrice]) VALUES (23, 1, N'	Xịt khử mùi – diệt ve', N'Dùng dung dịch thiên nhiên hoặc thuốc diệt ký sinh trùng da.', 800000, N'Hoạt động', CAST(N'2025-05-13' AS Date), N'/img/imgpetcare/tamchuyensau.jpg', 900000)
INSERT [dbo].[Services] ([ServiceID], [CategoryServiceID], [ServiceName], [Description], [Price], [Status], [CreatedDate], [Image], [OldPrice]) VALUES (24, 1, N'Khăn – lược riêng biệt', N'	Đảm bảo vệ sinh và tránh lây nhiễm chéo.', 500000, N'Hoạt động', CAST(N'2025-05-13' AS Date), N'/img/imgpetcare/tamchuyensau.jpg', 650000)
INSERT [dbo].[Services] ([ServiceID], [CategoryServiceID], [ServiceName], [Description], [Price], [Status], [CreatedDate], [Image], [OldPrice]) VALUES (25, 3, N'	Hậu môn & tuyến hôi', N'Kiểm tra sưng viêm, tuyến hôi bị tắc, rối loạn tiêu hóa.', 150000, N'Hoạt động', CAST(N'2025-05-13' AS Date), N'/img/imgpetcare/catmong.jpg', 2500000)
INSERT [dbo].[Services] ([ServiceID], [CategoryServiceID], [ServiceName], [Description], [Price], [Status], [CreatedDate], [Image], [OldPrice]) VALUES (26, 3, N'Tiêu hóa – Bụng – Gan – Thận', N'Sờ nắn bụng phát hiện u cục, đau, đầy hơi, sình bụng.', 3500000, N'Hoạt động', CAST(N'2025-05-13' AS Date), N'/img/imgpetcare/tamcoban.jpg', 4500000)
INSERT [dbo].[Services] ([ServiceID], [CategoryServiceID], [ServiceName], [Description], [Price], [Status], [CreatedDate], [Image], [OldPrice]) VALUES (28, 3, N'	Tim - phổi', N'	Nghe tim, phổi phát hiện tiếng tim bất thường, khó thở, hen suyễn.', 980000, N'Hoạt động', CAST(N'2025-05-13' AS Date), N'/img/imgpetcare/cattia.jpg', 650000)
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
SET IDENTITY_INSERT [dbo].[Staffs] ON 

INSERT [dbo].[Staffs] ([StaffID], [FullName], [Phone], [Email], [DateOfBirth], [Salary]) VALUES (2, N'Ngu Thư Hân', N'0387185955', N'han@gmail.com', CAST(N'1997-09-01' AS Date), 8000000)
SET IDENTITY_INSERT [dbo].[Staffs] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Admins__A9D105344234F11D]    Script Date: 06/06/2025 11:37:05 CH ******/
ALTER TABLE [dbo].[Admins] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__5C7E359E5A61C451]    Script Date: 06/06/2025 11:37:05 CH ******/
ALTER TABLE [dbo].[Customers] ADD UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__A9D105341B085CA7]    Script Date: 06/06/2025 11:37:05 CH ******/
ALTER TABLE [dbo].[Customers] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Staffs__5C7E359EB47A5B26]    Script Date: 06/06/2025 11:37:05 CH ******/
ALTER TABLE [dbo].[Staffs] ADD UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Staffs__A9D10534BDC532A4]    Script Date: 06/06/2025 11:37:05 CH ******/
ALTER TABLE [dbo].[Staffs] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appointments] ADD  DEFAULT (N'Chờ xác nhận') FOR [Status]
GO
ALTER TABLE [dbo].[Banners] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Contacts] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Customers] ADD  DEFAULT (getdate()) FOR [RegistrationDate]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (N'Chờ xử lý') FOR [Status]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [TotalAmount]
GO
ALTER TABLE [dbo].[Reviews] ADD  DEFAULT (getdate()) FOR [ReviewDate]
GO
ALTER TABLE [dbo].[Services] ADD  DEFAULT (N'Hoạt động') FOR [Status]
GO
ALTER TABLE [dbo].[Services] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([AppointmentID])
REFERENCES [dbo].[Appointments] ([AppointmentID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([PetID])
REFERENCES [dbo].[Pets] ([PetID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ServiceID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([PaymentMethodID])
REFERENCES [dbo].[PaymentMethods] ([PaymentMethodID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staffs] ([StaffID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Pets]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Pets]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ServiceID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Services]  WITH CHECK ADD FOREIGN KEY([CategoryServiceID])
REFERENCES [dbo].[CategoryServices] ([CategoryServiceID])
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD CHECK  (([Status]=N'Huỷ' OR [Status]=N'Đã hoàn thành' OR [Status]=N'Đã xác nhận' OR [Status]=N'Chờ xác nhận'))
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([Status]=N'Huỷ' OR [Status]=N'Hoàn thành' OR [Status]=N'Đang thực hiện' OR [Status]=N'Chờ xử lý'))
GO
ALTER TABLE [dbo].[Services]  WITH CHECK ADD CHECK  (([Status]=N'Không hoạt động' OR [Status]=N'Hoạt động'))
GO
