-- Create a database
CREATE DATABASE CoffeeShop;

-- Use the database
USE CoffeeShop;

-- Create a table for menu items
CREATE TABLE MenuItems (
    ItemID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(5, 2) NOT NULL
);

-- Create a table for customers
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    RegistrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create a table for orders
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(7, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create a table for order details
CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    ItemID INT NOT NULL,
    Quantity INT NOT NULL,
    Subtotal DECIMAL(7, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ItemID) REFERENCES MenuItems(ItemID)
);

-- Insert demo data into MenuItems
INSERT INTO MenuItems (Name, Description, Price) VALUES
('Espresso', 'Rich and bold espresso shots.', 2.50),
('Cappuccino', 'A perfect balance of espresso, steamed milk, and foam.', 3.50),
('Latte', 'Silky smooth milk with a shot of espresso.', 4.00),
('Mocha', 'Chocolatey goodness with espresso and steamed milk.', 4.50);

-- Insert demo data into Customers
INSERT INTO Customers (Name, Email, Phone) VALUES
('Alice Johnson', 'alice@example.com', '1234567890'),
('Bob Smith', 'bob@example.com', '0987654321');

-- Insert demo data into Orders
INSERT INTO Orders (CustomerID, TotalAmount) VALUES
(1, 7.00),
(2, 9.50);

-- Insert demo data into OrderDetails
INSERT INTO OrderDetails (OrderID, ItemID, Quantity, Subtotal) VALUES
(1, 1, 1, 2.50),
(1, 2, 1, 3.50),
(2, 3, 1, 4.00),
(2, 4, 1, 4.50);

-- Query to display all menu items
SELECT * FROM MenuItems;

-- Query to display all customers
SELECT * FROM Customers;

-- Query to display all orders with details
SELECT o.OrderID, c.Name AS CustomerName, o.OrderDate, od.Quantity, m.Name AS ItemName, od.Subtotal
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN MenuItems m ON od.ItemID = m.ItemID;

-- Query to calculate total revenue
SELECT SUM(TotalAmount) AS TotalRevenue FROM Orders;
