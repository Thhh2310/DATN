USE [Pet_Care]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 27/02/2025 10:38:24 CH ******/
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
/****** Object:  Table [dbo].[Appointments]    Script Date: 27/02/2025 10:38:24 CH ******/
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
/****** Object:  Table [dbo].[Banners]    Script Date: 27/02/2025 10:38:24 CH ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 27/02/2025 10:38:24 CH ******/
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
/****** Object:  Table [dbo].[CategoryServices]    Script Date: 27/02/2025 10:38:24 CH ******/
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
/****** Object:  Table [dbo].[Contacts]    Script Date: 27/02/2025 10:38:24 CH ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 27/02/2025 10:38:24 CH ******/
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
/****** Object:  Table [dbo].[News]    Script Date: 27/02/2025 10:38:24 CH ******/
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
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 27/02/2025 10:38:24 CH ******/
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
	[SizeID] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [float] NOT NULL,
	[TotalPrice]  AS ([Quantity]*[Price]) PERSISTED,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 27/02/2025 10:38:24 CH ******/
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
/****** Object:  Table [dbo].[PaymentMethods]    Script Date: 27/02/2025 10:38:24 CH ******/
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
/****** Object:  Table [dbo].[Pets]    Script Date: 27/02/2025 10:38:24 CH ******/
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
/****** Object:  Table [dbo].[Reviews]    Script Date: 27/02/2025 10:38:24 CH ******/
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
/****** Object:  Table [dbo].[Services]    Script Date: 27/02/2025 10:38:24 CH ******/
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
PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 27/02/2025 10:38:24 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[SizeID] [int] IDENTITY(1,1) NOT NULL,
	[SizeName] [nvarchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[SizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staffs]    Script Date: 27/02/2025 10:38:24 CH ******/
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
INSERT [dbo].[Admins] ([AdminID], [AdminName], [Email], [Password], [Avatar]) VALUES (6, N'jungkook', N'jk@gmail.com', N'010998', N'/images/admin/v.jpg')
SET IDENTITY_INSERT [dbo].[Admins] OFF
GO
SET IDENTITY_INSERT [dbo].[Appointments] ON 

INSERT [dbo].[Appointments] ([AppointmentID], [AppointmentDate], [AppointmentTime], [Status]) VALUES (1, CAST(N'2025-02-28' AS Date), CAST(N'09:00:00' AS Time), N'Đã hoàn thành')
SET IDENTITY_INSERT [dbo].[Appointments] OFF
GO
SET IDENTITY_INSERT [dbo].[Banners] ON 

INSERT [dbo].[Banners] ([BannerID], [Image], [Title], [CreatedDate]) VALUES (1, N'/images/banners/11.jpg', N'Title 1', CAST(N'2025-02-26' AS Date))
INSERT [dbo].[Banners] ([BannerID], [Image], [Title], [CreatedDate]) VALUES (2, N'/images/banners/15.jpg', N'Title 2', CAST(N'2025-02-26' AS Date))
INSERT [dbo].[Banners] ([BannerID], [Image], [Title], [CreatedDate]) VALUES (3, N'/images/banners/12.jpg', N'Title 3', CAST(N'2025-02-26' AS Date))
SET IDENTITY_INSERT [dbo].[Banners] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoryServices] ON 

INSERT [dbo].[CategoryServices] ([CategoryServiceID], [CategoryServiceName], [Description]) VALUES (1, N'Spa & Grooming', NULL)
INSERT [dbo].[CategoryServices] ([CategoryServiceID], [CategoryServiceName], [Description]) VALUES (2, N'Pet & Daycare', NULL)
INSERT [dbo].[CategoryServices] ([CategoryServiceID], [CategoryServiceName], [Description]) VALUES (3, N'Pet health check', NULL)
SET IDENTITY_INSERT [dbo].[CategoryServices] OFF
GO
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([ServiceID], [CategoryServiceID], [ServiceName], [Description], [Price], [Status], [CreatedDate]) VALUES (1, 1, N'Tắm cơ bản', N'Làm sạch lông, vệ sinh tai, cắt móng, làm sạch tuyến hôi.', 100000, N'Hoạt động', CAST(N'2025-02-27' AS Date))
INSERT [dbo].[Services] ([ServiceID], [CategoryServiceID], [ServiceName], [Description], [Price], [Status], [CreatedDate]) VALUES (2, 1, N'Tắm dưỡng chuyên sâu', N' Dành cho thú cưng có da nhạy cảm, bị nấm, viêm da.', 150000, N'Hoạt động', CAST(N'2025-02-27' AS Date))
INSERT [dbo].[Services] ([ServiceID], [CategoryServiceID], [ServiceName], [Description], [Price], [Status], [CreatedDate]) VALUES (3, 1, N'Cắt tỉa lông tạo kiểu', N'Tạo dáng lông theo yêu cầu, cắt theo mùa hoặc theo giống.', 200000, N'Hoạt động', CAST(N'2025-02-27' AS Date))
INSERT [dbo].[Services] ([ServiceID], [CategoryServiceID], [ServiceName], [Description], [Price], [Status], [CreatedDate]) VALUES (4, 1, N'Dưỡng lông, hấp dầu', N'Giúp lông bóng mượt, không bị xơ rối.', 300000, N'Hoạt động', CAST(N'2025-02-27' AS Date))
INSERT [dbo].[Services] ([ServiceID], [CategoryServiceID], [ServiceName], [Description], [Price], [Status], [CreatedDate]) VALUES (5, 1, N'Vệ sinh tai – Cắt móng – Mài móng', N'Ngăn ngừa vi khuẩn, giảm nguy cơ viêm nhiễm.', 500000, N'Hoạt động', CAST(N'2025-02-27' AS Date))
INSERT [dbo].[Services] ([ServiceID], [CategoryServiceID], [ServiceName], [Description], [Price], [Status], [CreatedDate]) VALUES (7, 3, N'Kiểm tra tổng quát', N'Cân nặng, răng miệng, da lông, mắt, tai.', 500000, N'Hoạt động', CAST(N'2025-02-27' AS Date))
INSERT [dbo].[Services] ([ServiceID], [CategoryServiceID], [ServiceName], [Description], [Price], [Status], [CreatedDate]) VALUES (8, 3, N'Hỗ trợ điều trị bệnh lý da liễu, tiêu hóa, viêm nhiễm nhẹ.', NULL, 700000, N'Hoạt động', CAST(N'2025-02-27' AS Date))
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
SET IDENTITY_INSERT [dbo].[Staffs] ON 

INSERT [dbo].[Staffs] ([StaffID], [FullName], [Phone], [Email], [DateOfBirth], [Salary]) VALUES (2, N'Ngu Thư Hân', N'0387185955', N'han@gmail.com', CAST(N'1997-09-01' AS Date), 8000000)
SET IDENTITY_INSERT [dbo].[Staffs] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Admins__A9D105344234F11D]    Script Date: 27/02/2025 10:38:24 CH ******/
ALTER TABLE [dbo].[Admins] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__5C7E359E5A61C451]    Script Date: 27/02/2025 10:38:24 CH ******/
ALTER TABLE [dbo].[Customers] ADD UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__A9D105341B085CA7]    Script Date: 27/02/2025 10:38:24 CH ******/
ALTER TABLE [dbo].[Customers] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Staffs__5C7E359EB47A5B26]    Script Date: 27/02/2025 10:38:24 CH ******/
ALTER TABLE [dbo].[Staffs] ADD UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Staffs__A9D10534BDC532A4]    Script Date: 27/02/2025 10:38:24 CH ******/
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
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([SizeID])
REFERENCES [dbo].[Sizes] ([SizeID])
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

ALTER TABLE OrderDetails DROP CONSTRAINT [FK__OrderDeta__SizeI__74AE54BC];
DROP TABLE Sizes;

ALTER TABLE OrderDetails DROP COLUMN SizeID;

ALTER TABLE Services
ADD Image NVARCHAR(MAX) NULL;
ALTER TABLE Services
ADD OldPrice float NULL;

--Tìm ràng buộc khoá ngoại
SELECT 
    f.name AS ForeignKeyName, 
    OBJECT_NAME(f.parent_object_id) AS TableName,
    COL_NAME(fc.parent_object_id, fc.parent_column_id) AS ColumnName
FROM sys.foreign_keys AS f
INNER JOIN sys.foreign_key_columns AS fc 
    ON f.object_id = fc.constraint_object_id
WHERE f.referenced_object_id = OBJECT_ID('Sizes');