CREATE DATABASE RetailProject;
USE RetailProject;
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    SaleDate DATE,
    ProductID INT,
    Quantity INT,
    CustomerID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
INSERT INTO Products VALUES 
(101, 'Laptop', 'Electronics', 55000),
(102, 'Mouse', 'Electronics', 800),
(103, 'Office Chair', 'Furniture', 4500),
(104, 'Water Bottle', 'Home', 500);

INSERT INTO Sales VALUES 
(1, '2026-03-01', 101, 1, 501),
(2, '2026-03-02', 102, 2, 502),
(3, '2026-03-05', 101, 1, 503),
(4, '2026-03-10', 103, 1, 501),
(5, '2026-03-15', 104, 5, 504);
select * from RetailProject.Sales;
select * from RetailProject.Products;
SELECT SUM(p.Price * s.Quantity) AS Total_Revenue
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID;
SELECT p.Category, SUM(s.Quantity) AS Total_Sold
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY Total_Sold DESC;
SELECT s.CustomerID, SUM(p.Price * s.Quantity) AS Total_Spent
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY s.CustomerID
ORDER BY Total_Spent DESC;
