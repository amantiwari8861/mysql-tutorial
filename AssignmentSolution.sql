create database JohnsonBrothers;
use johnsonbrothers;

CREATE TABLE Stores (
    ID INT PRIMARY KEY,
    City VARCHAR(255),
    Address VARCHAR(255)
);
CREATE TABLE Departments (
    ID INT PRIMARY KEY,StoreID INT,Name VARCHAR(255),
    ManagerID INT,FOREIGN KEY (StoreID) REFERENCES Stores(ID)
);
CREATE TABLE Employees (
    ID INT PRIMARY KEY,FirstName VARCHAR(255),LastName VARCHAR(255),
    Salary DECIMAL(10, 2),DepartmentID INT
);

CREATE TABLE EmployeeDepartment (
    EmployeeID INT,
    DepartmentID INT,
    PRIMARY KEY (EmployeeID, DepartmentID), -- composite primary key
    FOREIGN KEY (EmployeeID) REFERENCES Employees(ID),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(ID)
);

CREATE TABLE Suppliers (
    ID INT PRIMARY KEY,
    Name VARCHAR(255),
    City VARCHAR(255),
    supplies_to_StoreID INT,
    FOREIGN KEY (supplies_to_StoreID) REFERENCES Stores(ID)
);

CREATE TABLE Products (
    ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Price DECIMAL(10, 2),
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(ID)
);

CREATE TABLE Sales (
    ID INT PRIMARY KEY,
    EmployeeID INT,
    ProductID INT,
    Date DATE,
    Quantity INT,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(ID),
    FOREIGN KEY (ProductID) REFERENCES Products(ID)
);

CREATE TABLE Debits (
    ID INT PRIMARY KEY,
    Date DATE,
    TotalAmount DECIMAL(10, 2),
    sale_id int,
    foreign key (sale_id) references sales(id)
);

CREATE TABLE Supplies (
    ID INT PRIMARY KEY,
    SupplierID INT,
    PartName VARCHAR(255),
    Weight DECIMAL(10, 2),
    Quantity INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(ID)
);


-- Insert into Stores
INSERT INTO Stores (ID, City, Address) VALUES
    (1, 'New York', '123 Main St'),
    (2, 'Los Angeles', '456 Elm St');

-- Insert into Departments
INSERT INTO Departments (ID, StoreID, Name, ManagerID) VALUES
    (1, 1, 'Electronics', 101),
    (2, 1, 'Clothing', 102),
    (3, 2, 'Appliances', 103),
    (4, 2, 'Shoes', 104),
    (5, 1, 'Books', 105),
    (6, 2, 'Toys', 106),
    (7, 1, 'Groceries', 107),
    (8, 2, 'Furniture', 108),
    (9, 1, 'Jewelry', 109),
    (49, 2, 'Beauty', 110),
    (10, 2, 'Beauty', 110);

-- Insert into Employees
INSERT INTO Employees (ID, FirstName, LastName, Salary, DepartmentID) VALUES
    (101, 'John', 'Doe', 60000, 1),
    (102, 'Jane', 'Smith', 55000, 2),
    (103, 'Michael', 'Johnson', 58000, 3),
    (104, 'Emily', 'Brown', 52000, 4),
    (105, 'Robert', 'Williams', 62000, 5),
    (106, 'Lisa', 'Jones', 57000, 6),
    (107, 'David', 'Miller', 59000, 7),
    (108, 'Sara', 'Taylor', 54000, 8),
    (109, 'Eric', 'Clark', 61000, 9),
    (110, 'Anna', 'White', 56000, 10);

-- Insert into EmployeeDepartment
INSERT INTO EmployeeDepartment (EmployeeID, DepartmentID) VALUES
    (101, 1),
    (102, 2),
    (103, 3),
    (104, 4),
    (105, 5),
    (106, 6),
    (107, 7),
    (108, 8),
    (109, 9),
    (110, 10);

-- Insert into Suppliers
INSERT INTO Suppliers (ID, Name, City, supplies_to_StoreID) VALUES
    (1, 'SupplierA', 'New York', 1),
    (2, 'SupplierB', 'Los Angeles', 2);

-- Insert into Products
INSERT INTO Products (ID, Name, Price, SupplierID) VALUES
    (1, 'TV', 500, 1),
    (2, 'Jeans', 50, 2),
    (3, 'Refrigerator', 800, 1),
    (4, 'Sneakers', 80, 2),
    (5, 'Novel', 20, 1),
    (6, 'Action Figure', 15, 2),
    (7, 'Apples', 2, 1),
    (8, 'Sofa', 700, 2),
    (9, 'Necklace', 300, 1),
    (10, 'Lipstick', 15, 2);

-- Insert into Sales
INSERT INTO Sales (ID, EmployeeID, ProductID, Date, Quantity, TotalAmount) VALUES
    (1, 101, 1, '2023-08-10', 2, 1000),
    (2, 102, 2, '2023-08-11', 3, 150),
    (3, 103, 3, '2023-08-12', 1, 800),
    (4, 104, 4, '2023-08-13', 2, 160),
    (5, 105, 5, '2023-08-14', 1, 20),
    (6, 106, 6, '2023-08-15', 4, 60),
    (7, 107, 7, '2023-08-16', 5, 10),
    (8, 108, 8, '2023-08-17', 1, 700),
    (9, 109, 9, '2023-08-18', 1, 300),
    (10, 110, 10, '2023-08-19', 2, 30);

-- Insert into Debits
INSERT INTO Debits (ID, Date, TotalAmount, sale_id) VALUES
    (1, '2023-08-10', 1000, 1),
    (2, '2023-08-11', 150, 2),
    (3, '2023-08-12', 800, 3),
    (4, '2023-08-13', 160, 4),
    (5, '2023-08-14', 20, 5),
    (6, '2023-08-15', 60, 6),
    (7, '2023-08-16', 10, 7),
    (8, '2023-08-17', 700, 8),
    (9, '2023-08-18', 300, 9),
    (10, '2023-08-19', 30, 10);

-- Insert into Supplies
INSERT INTO Supplies (ID, SupplierID, PartName, Weight, Quantity) VALUES
    (1, 1, 'TV Screen', 2.5, 10),
    (2, 2, 'Denim Fabric', 0.8, 20),
    (3, 1, 'Compressor', 5, 5),
    (4, 2, 'Rubber Sole', 0.2, 30),
    (5, 1, 'Ink Pen', 0.02, 100),
    (6, 2, 'Plastic Figure', 0.1, 50),
    (7, 1, 'Red Apples', 0.2, 200),
    (8, 2, 'Sofa Frame', 15, 10),
    (9, 1, 'Diamond Pendant', 0.5, 7),
    (10, 2, 'Red Lipstick', 0.05, 40);

-- Select from Stores
SELECT * FROM Stores;

-- Select from Departments
SELECT * FROM Departments;

-- Select from Employees
SELECT * FROM Employees;

-- Select from EmployeeDepartment
SELECT * FROM EmployeeDepartment;

-- Select from Suppliers
SELECT * FROM Suppliers;

-- Select from Products
SELECT * FROM Products;

-- Select from Sales
SELECT * FROM Sales;

-- Select from Debits
SELECT * FROM Debits;

-- Select from Supplies
SELECT * FROM Supplies;









-- Query 1
SELECT * FROM Employees;

-- Query 2
SELECT Name FROM Departments;

-- Query 3
SELECT PartName FROM Supplies WHERE Quantity = 0;

-- Query 4
SELECT * FROM Employees WHERE Salary BETWEEN 10000 AND 12000;

-- Query 5
SELECT Products.Name, Products.Price, Products.Price * 1.1 AS IncreasedPrice
FROM Products
INNER JOIN Departments ON Products.DepartmentID = Departments.ID
WHERE Departments.ID = 49;

-- Query 6
SELECT FirstName, LastName, Salary FROM Employees WHERE LastName LIKE 'S%';

-- Query 7 (Using Subquery)
SELECT PartName, Weight
FROM Supplies
WHERE SupplierID = (SELECT ID FROM Suppliers WHERE Name = 'DEC');

-- Query 8 (Without Subquery)
SELECT Supplies.PartName, Supplies.Weight
FROM Supplies
JOIN Suppliers ON Supplies.SupplierID = Suppliers.ID
WHERE Suppliers.Name = 'DEC';

-- Query 9 (Using Subquery)
SELECT PartName, Color
FROM Parts
WHERE Weight > (SELECT Weight FROM Parts WHERE PartName = 'Black Tape Drive');

-- Query 10 (Without Subquery)
SELECT PartName, Color
FROM Parts AS p1
JOIN Parts AS p2 ON p1.PartName = 'Black Tape Drive'
WHERE p1.Weight > p2.Weight;

-- Query 11
SELECT AVG(e1.Salary) AS AvgSalary
FROM Employees AS e1
JOIN Employees AS e2 ON e1.ManagerID = e2.ID
WHERE e2.ID = 199;

-- Query 12
SELECT Suppliers.Name, COUNT(DISTINCT Products.ID) AS NumItemsSupplied
FROM Suppliers
JOIN Products ON Suppliers.ID = Products.SupplierID
GROUP BY Suppliers.Name;

-- Query 13
SELECT Suppliers.Name, SUM(Supplies.Weight) AS TotalWeight
FROM Suppliers
JOIN Supplies ON Suppliers.ID = Supplies.SupplierID
WHERE Suppliers.City = 'Mass'
GROUP BY Suppliers.Name;

-- Query 14
INSERT INTO Suppliers (ID, Name, City, supplies_to_StoreID) VALUES
    (3, 'New Supplier', 'New City', 1);

-- Query 15 (Update and Retrieve)
SELECT * FROM Departments WHERE StoreID = 8;
UPDATE Employees
SET Salary = Salary * 1.05
WHERE DepartmentID IN (SELECT ID FROM Departments WHERE StoreID = 8);
SELECT * FROM Employees WHERE DepartmentID IN (SELECT ID FROM Departments WHERE StoreID = 8);


