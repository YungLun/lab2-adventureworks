-- Lab 2: SQL Server Fundamentals
-- Group Members: YungLun-Lee, Student #n01721599
-- SQL Server Version: Microsoft SQL Server 2019 (RTM-CU27-GDR) (KB5040948) - 15.0.4382.1 (X64) Jul 1 2024 20:03:23 Copyright (C) 2019 Microsoft Corporation Express Edition (64-bit) on Windows 10 Home 10.0 <X64> (Build 19045: ) (Hypervisor)
-- Date: 2025-09-17


USE AdventureWorks2019;

--Task 5: Aggregate Filtering with HAVING
--Use GROUP BY with HAVING to display only those customers with more than 5 orders.

SELECT CustomerID,
       COUNT(SalesOrderID) AS OrderCount
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
HAVING COUNT(SalesOrderID) > 5;



--Task 5: Aggregate Filtering with HAVING
--Use aggregate functions: SUM, COUNT, AVG.

SELECT CustomerID,
       COUNT(SalesOrderID) AS OrderCount,
       SUM(TotalDue) AS TotalSales,
       AVG(TotalDue) AS AvgSales
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
HAVING COUNT(SalesOrderID) > 5;