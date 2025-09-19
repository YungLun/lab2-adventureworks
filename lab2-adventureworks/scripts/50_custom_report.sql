-- Lab 2: SQL Server Fundamentals
-- Group Members: YungLun-Lee, Student #n01721599
-- SQL Server Version: Microsoft SQL Server 2019 (RTM-CU27-GDR) (KB5040948) - 15.0.4382.1 (X64) Jul 1 2024 20:03:23 Copyright (C) 2019 Microsoft Corporation Express Edition (64-bit) on Windows 10 Home 10.0 <X64> (Build 19045: ) (Hypervisor)
-- Date: 2025-09-17


USE AdventureWorks2019;


--Task 6: Practice ¡X Create Your Own Report
--Show a report of each product subcategory including:
--Product count
--Average standard cost
--Filter for subcategories where the product count > 10 and cost > 100

SELECT *
FROM Production.Product;

SELECT *
FROM Production.ProductSubcategory;




SELECT ps.Name AS SubcategoryName,
       COUNT(p.ProductID) AS ProductCount,
       AVG(p.StandardCost) AS AvgStandardCost
FROM Production.Product p
JOIN Production.ProductSubcategory ps
     ON p.ProductSubcategoryID = ps.ProductSubcategoryID
GROUP BY ps.Name
HAVING COUNT(p.ProductID) > 10
   AND AVG(p.StandardCost) > 100;