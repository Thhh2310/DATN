
CREATE DATABASE Pet_Care;
GO

USE Pet_Care;
GO

-- Bảng khách hàng
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,
    Address NVARCHAR(150),
    Phone NVARCHAR(10) UNIQUE NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    Password NVARCHAR(255) NOT NULL,
    DateOfBirth DATE,
    RegistrationDate DATE DEFAULT GETDATE()
);

-- Bảng nhân viên
CREATE TABLE Staffs (
    StaffID INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,
    Phone NVARCHAR(10) UNIQUE NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    DateOfBirth DATE,
    Salary FLOAT NOT NULL
);

-- Bảng loại dịch vụ
CREATE TABLE CategoryServices (
    CategoryServiceID INT PRIMARY KEY IDENTITY(1,1),
    CategoryServiceName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX),
);

--Bảng dịch vụ
CREATE TABLE Services (
    ServiceID INT PRIMARY KEY IDENTITY(1,1),
    CategoryServiceID INT,
    ServiceName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX),
    Price FLOAT NOT NULL,
    Status NVARCHAR(50) DEFAULT N'Hoạt động' CHECK (Status IN (N'Hoạt động', N'Không hoạt động')),
    CreatedDate DATE DEFAULT GETDATE(),
    FOREIGN KEY (CategoryServiceID) REFERENCES CategoryServices (CategoryServiceID),
);

-- Bảng danh mục (Chó - Mèo - Chuột...)
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    Type NVARCHAR(20),
    Description NVARCHAR(MAX)
);

-- Bảng thú cưng
CREATE TABLE Pets (
    PetID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    CategoryID INT,
    PetName NVARCHAR(100) NOT NULL,
    Age INT,
    Weight FLOAT,
	Color NVARCHAR(20),
    Notes NVARCHAR(MAX),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID) ON DELETE CASCADE
);

-- Bảng phương thức thanh toán
CREATE TABLE PaymentMethods (
    PaymentMethodID INT PRIMARY KEY IDENTITY(1,1),
    MethodName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX)
);

-- Bảng Order (đặt dịch vụ)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    StaffID INT,
    PaymentMethodID INT,
    OrderDate DATE DEFAULT GETDATE(),
    Status NVARCHAR(50) DEFAULT N'Chờ xử lý' CHECK (Status IN (N'Chờ xử lý', N'Đang thực hiện', N'Hoàn thành', N'Huỷ')),
    TotalAmount FLOAT DEFAULT 0,
    Notes NVARCHAR(MAX),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE SET NULL,
    FOREIGN KEY (StaffID) REFERENCES Staffs(StaffID) ON DELETE SET NULL,
    FOREIGN KEY (PaymentMethodID) REFERENCES PaymentMethods(PaymentMethodID) ON DELETE SET NULL
);

-- Bảng đặt lịch hẹn
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY IDENTITY(1,1),
    AppointmentDate DATE NOT NULL,
    AppointmentTime TIME NOT NULL,
    Status NVARCHAR(50) DEFAULT N'Chờ xác nhận' CHECK (Status IN (N'Chờ xác nhận', N'Đã xác nhận', N'Đã hoàn thành', N'Huỷ')),
);

-- Bảng kích thước chuồng
CREATE TABLE Sizes (
    SizeID INT PRIMARY KEY IDENTITY(1,1),
    SizeName NVARCHAR(50) NOT NULL, 
    Price FLOAT NOT NULL,
    Description NVARCHAR(MAX),
);

-- Bảng chi tiết đơn hàng
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ServiceID INT,
    PetID INT,
    AppointmentID INT,
    SizeID INT,
    Quantity INT DEFAULT 1,
    Price FLOAT NOT NULL,
    TotalPrice AS (Quantity * Price) PERSISTED,
     FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
     FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID),
     FOREIGN KEY (PetID) REFERENCES Pets(PetID),
     FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID),
     FOREIGN KEY (SizeID) REFERENCES Sizes(SizeID)
);

-- Bảng đánh giá dịch vụ
CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    ServiceID INT,
    Comment NVARCHAR(MAX),
    ReviewDate DATE DEFAULT GETDATE(),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE,
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID) ON DELETE CASCADE
);

-- Bảng tin tức
CREATE TABLE News (
    NewsID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(255) NOT NULL,
    Content NVARCHAR(MAX)
);

-- Bảng quản trị viên
CREATE TABLE Admins (
    AdminID INT PRIMARY KEY IDENTITY(1,1),
    AdminName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    Password NVARCHAR(255) NOT NULL,
    Avatar NVARCHAR(MAX)
);

-- Bảng liên hệ
CREATE TABLE Contacts (
    ContactID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(255) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    Phone NVARCHAR(15),
    Address NVARCHAR(100),
    Content NVARCHAR(MAX),
    CreatedDate DATE DEFAULT GETDATE()
);

-- Bảng banner
CREATE TABLE Banners (
    BannerID INT PRIMARY KEY IDENTITY(1,1),
    Image NVARCHAR(MAX) NOT NULL,
    Title NVARCHAR(255),
    CreatedDate DATE DEFAULT GETDATE()
);


