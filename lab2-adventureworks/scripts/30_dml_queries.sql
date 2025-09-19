-- Lab 2: SQL Server Fundamentals
-- Group Members: YungLun-Lee, Student #n01721599
-- SQL Server Version: Microsoft SQL Server 2019 (RTM-CU27-GDR) (KB5040948) - 15.0.4382.1 (X64) Jul 1 2024 20:03:23 Copyright (C) 2019 Microsoft Corporation Express Edition (64-bit) on Windows 10 Home 10.0 <X64> (Build 19045: ) (Hypervisor)
-- Date: 2025-09-17


USE AdventureWorks2019;


--Task 4: Data Manipulation (DML)
--INSERT: Add a new customer in Sales.Customer referencing an existing Person.BusinessEntityID.

INSERT INTO Sales.Customer (PersonID, StoreID, TerritoryID, rowguid, ModifiedDate)
VALUES (1, NULL, 1, NEWID(), GETDATE());

SELECT *
FROM Sales.Customer;



--Task 4: Data Manipulation (DML)
--UPDATE: Change the EmailAddress of a selected customer.

UPDATE Person.EmailAddress
SET EmailAddress = 'new_email@example.com',
    ModifiedDate = GETDATE()
WHERE BusinessEntityID = 1;


SELECT *
FROM Person.EmailAddress;



--Task 4: Data Manipulation (DML)
--DELETE: Remove a salesperson only if:
--TerritoryID IS NULL
--AND they do not exist in SalesOrderHeader.

select *
from Sales.SalesPerson;


DELETE FROM Sales.SalesPerson
WHERE TerritoryID IS NULL
  AND BusinessEntityID NOT IN (
        SELECT SalesPersonID
        FROM Sales.SalesOrderHeader
        WHERE SalesPersonID IS NOT NULL
    );

