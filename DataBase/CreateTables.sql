USE Reservations;
GO

CREATE TABLE Restaurants (
RestaurantId INT PRIMARY KEY IDENTITY(1,1),
Name NVARCHAR(100) NOT NULL,
Address NVARCHAR(255),
PhoneNumber NVARCHAR(20),
OpeningHours NVARCHAR(100)
);
GO

CREATE TABLE Customers (
CustomerId INT PRIMARY KEY IDENTITY(1,1),
FirstName NVARCHAR(50) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
Email NVARCHAR(100),
PhoneNumber NVARCHAR(20)
);
GO

CREATE TABLE Employees (
EmployeeId INT PRIMARY KEY IDENTITY(1,1),
RestaurantId INT NOT NULL, --FK
FirstName NVARCHAR(50) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
Position NVARCHAR(50),

CONSTRAINT FK_Employees_Restaurants
FOREIGN KEY (RestaurantId)
REFERENCES Restaurants(RestaurantId)
);
GO

CREATE TABLE Tables (
TableId INT PRIMARY KEY IDENTITY(1,1),
RestaurantId INT NOT NULL, --FK
Capacity INT NOT NULL,

CONSTRAINT FK_Tables_Restaurants
FOREIGN KEY (RestaurantId)
REFERENCES Restaurants(RestaurantId)
);
GO

CREATE TABLE Reservations (
ReservationId INT PRIMARY KEY IDENTITY(1,1),
CustomerId INT NOT NULL,  --FK
RestaurantId INT NOT NULL, --FK
TableId INT NOT NULL,  --FK
ReservationDate DATETIME NOT NULL,
PartySize INT NOT NULL,

CONSTRAINT FK_Reservations_Customers
FOREIGN KEY (CustomerId)
REFERENCES Customers(CustomerId),

CONSTRAINT FK_Reservations_Restaurants
FOREIGN KEY (RestaurantId)
REFERENCES Restaurants(RestaurantId),

CONSTRAINT FK_Reservations_Tables
FOREIGN KEY (TableId)
REFERENCES Tables(TableId)
);
GO

CREATE TABLE MenuItems (
ItemId INT PRIMARY KEY IDENTITY(1,1),
RestaurantId INT NOT NULL,
Name NVARCHAR(100) NOT NULL,
Description NVARCHAR(255),
Price DECIMAL(10,2) NOT NULL,

CONSTRAINT FK_MenuItems_Restaurants
FOREIGN KEY (RestaurantId)
REFERENCES Restaurants(RestaurantId)
);
GO

CREATE TABLE Orders (
OrderId INT PRIMARY KEY IDENTITY(1,1),
ReservationId INT NOT NULL,
EmployeeId INT NOT NULL,
OrderDate DATETIME NOT NULL,
TotalAmount DECIMAL(10,2) NOT NULL,

CONSTRAINT FK_Orders_Reservations
FOREIGN KEY (ReservationId)
REFERENCES Reservations(ReservationId),

CONSTRAINT FK_Orders_Employees
FOREIGN KEY (EmployeeId)
REFERENCES Employees(EmployeeId)
);
GO

CREATE TABLE OrderItems (
OrderItemId INT PRIMARY KEY IDENTITY(1,1),
OrderId INT NOT NULL,
ItemId INT NOT NULL,
Quantity INT NOT NULL,

CONSTRAINT FK_OrderItems_Orders
FOREIGN KEY (OrderId)
REFERENCES Orders(OrderId),

CONSTRAINT FK_OrderItems_MenuItems
FOREIGN KEY (ItemId)
REFERENCES MenuItems(ItemId)
);
GO