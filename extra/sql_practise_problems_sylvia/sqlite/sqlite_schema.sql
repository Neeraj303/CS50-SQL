-- Drop database if exists (SQLite doesn't support this, so we'll skip it)

-- Create tables
CREATE TABLE Categories (
    CategoryID INTEGER PRIMARY KEY AUTOINCREMENT,
    CategoryName TEXT NOT NULL UNIQUE,
    Description TEXT
);

CREATE TABLE Customers (
    CustomerID TEXT PRIMARY KEY,
    CompanyName TEXT NOT NULL,
    ContactName TEXT,
    ContactTitle TEXT,
    Address TEXT,
    City TEXT,
    Region TEXT,
    PostalCode TEXT,
    Country TEXT,
    Phone TEXT,
    Fax TEXT
);

CREATE TABLE Employees (
    EmployeeID INTEGER PRIMARY KEY AUTOINCREMENT,
    LastName TEXT NOT NULL,
    FirstName TEXT NOT NULL,
    Title TEXT,
    TitleOfCourtesy TEXT,
    BirthDate TEXT,
    HireDate TEXT,
    Address TEXT,
    City TEXT,
    Region TEXT,
    PostalCode TEXT,
    Country TEXT,
    HomePhone TEXT,
    Extension TEXT,
    Photo TEXT,
    Notes TEXT,
    ReportsTo INTEGER,
    PhotoPath TEXT
);

CREATE TABLE Shippers (
    ShipperID INTEGER PRIMARY KEY AUTOINCREMENT,
    CompanyName TEXT NOT NULL,
    Phone TEXT
);

CREATE TABLE Orders (
    OrderID INTEGER PRIMARY KEY AUTOINCREMENT,
    CustomerID TEXT,
    EmployeeID INTEGER NOT NULL,
    OrderDate TEXT,
    RequiredDate TEXT,
    ShippedDate TEXT,
    ShipVia INTEGER NOT NULL,
    Freight REAL DEFAULT 0,
    ShipName TEXT,
    ShipAddress TEXT,
    ShipCity TEXT,
    ShipRegion TEXT,
    ShipPostalCode TEXT,
    ShipCountry TEXT,
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID),
    FOREIGN KEY (ShipVia) REFERENCES Shippers (ShipperID)
);

CREATE TABLE Suppliers (
    SupplierID INTEGER PRIMARY KEY AUTOINCREMENT,
    CompanyName TEXT NOT NULL,
    ContactName TEXT,
    ContactTitle TEXT,
    Address TEXT,
    City TEXT,
    Region TEXT,
    PostalCode TEXT,
    Country TEXT,
    Phone TEXT,
    Fax TEXT,
    HomePage TEXT
);

CREATE TABLE Products (
    ProductID INTEGER PRIMARY KEY AUTOINCREMENT,
    ProductName TEXT NOT NULL,
    SupplierID INTEGER NOT NULL,
    CategoryID INTEGER NOT NULL,
    QuantityPerUnit TEXT,
    UnitPrice REAL DEFAULT 0,
    UnitsInStock INTEGER DEFAULT 0,
    UnitsOnOrder INTEGER DEFAULT 0,
    ReorderLevel INTEGER DEFAULT 0,
    Discontinued INTEGER DEFAULT 0 NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers (SupplierID)
);

CREATE TABLE OrderDetails (
    OrderID INTEGER NOT NULL,
    ProductID INTEGER NOT NULL,
    UnitPrice REAL DEFAULT 0 NOT NULL,
    Quantity INTEGER DEFAULT 1 NOT NULL,
    Discount REAL DEFAULT 0 NOT NULL,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
);

CREATE TABLE CustomerGroupThresholds (
    CustomerGroupName TEXT,
    RangeBottom REAL,
    RangeTop REAL
);

-- Create indexes
CREATE INDEX idx_customers_city ON Customers(City);
CREATE INDEX idx_customers_companyname ON Customers(CompanyName);
CREATE INDEX idx_customers_postalcode ON Customers(PostalCode);
CREATE INDEX idx_customers_region ON Customers(Region);
CREATE INDEX idx_employees_lastname ON Employees(LastName);
CREATE INDEX idx_orders_orderdate ON Orders(OrderDate);
CREATE INDEX idx_orders_shippeddate ON Orders(ShippedDate);
CREATE INDEX idx_orders_shippostalcode ON Orders(ShipPostalCode);
CREATE INDEX idx_products_productname ON Products(ProductName);
