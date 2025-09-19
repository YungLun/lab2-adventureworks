-- Lab 2: SQL Server Fundamentals
-- Group Members: YungLun-Lee, Student #n01721599
-- SQL Server Version: Microsoft SQL Server 2019 (RTM-CU27-GDR) (KB5040948) - 15.0.4382.1 (X64) Jul 1 2024 20:03:23 Copyright (C) 2019 Microsoft Corporation Express Edition (64-bit) on Windows 10 Home 10.0 <X64> (Build 19045: ) (Hypervisor)
-- Date: 2025-09-17


USE AdventureWorks2019;


--Task 3: Basic SELECT Queries
--Query total and average sales amount per CustomerID where order count > 3.

SELECT CustomerID,
       SUM(TotalDue) AS TotalSales,
       AVG(TotalDue) AS AvgSales,
       COUNT(SalesOrderID) AS OrderCount
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
HAVING COUNT(SalesOrderID) > 3;




--Task 3: Basic SELECT Queries
--List the top 5 products by quantity sold company-wide.

SELECT TOP 5 ProductID,
       SUM(OrderQty) AS TotalQuantity
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY SUM(OrderQty) DESC;



--Task 3: Basic SELECT Queries
--Compute average order total per territory, filtered to those > $1000.

SELECT TerritoryID,
       AVG(TotalDue) AS AvgOrderTotal
FROM Sales.SalesOrderHeader
GROUP BY TerritoryID
HAVING AVG(TotalDue) > 1000;