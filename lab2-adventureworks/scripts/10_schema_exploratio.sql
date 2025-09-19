-- Lab 2: SQL Server Fundamentals
-- Group Members: YungLun-Lee, Student #n01721599
-- SQL Server Version: Microsoft SQL Server 2019 (RTM-CU27-GDR) (KB5040948) - 15.0.4382.1 (X64) Jul 1 2024 20:03:23 Copyright (C) 2019 Microsoft Corporation Express Edition (64-bit) on Windows 10 Home 10.0 <X64> (Build 19045: ) (Hypervisor)
-- Date: 2025-09-17



USE AdventureWorks2019;


--Task 2: Schema and Datatype Discovery
--List all tables that contain nvarchar or varbinary columns.

select table_name, column_name, data_type
from information_schema.columns
where data_type in ('nvarchat', 'varbinary');



--Task 2: Schema and Datatype Discovery
--Explore the Person.Person table:
--Display all column names, data types, and nullability.

select column_name,data_type, is_nullable
from information_schema.columns
where table_name='person'
    and table_schema='person';



--Task 2: Schema and Datatype Discovery
--Identify primary and foreign keys using sys.foreign_keys.

--foreign keys
SELECT f.name AS ForeignKeyName,
       OBJECT_NAME(f.parent_object_id) AS TableName,
       OBJECT_NAME(f.referenced_object_id) AS ReferencedTable
FROM sys.foreign_keys f
WHERE f.parent_object_id = OBJECT_ID('Person.Person');


--primary keys
SELECT kc.name AS PrimaryKeyName,       
       c.name  AS ColumnName            
FROM sys.key_constraints kc
JOIN sys.index_columns ic
     ON kc.parent_object_id = ic.object_id
    AND kc.unique_index_id = ic.index_id
JOIN sys.columns c
     ON ic.object_id = c.object_id
    AND ic.column_id = c.column_id
WHERE kc.parent_object_id = OBJECT_ID('Person.Person')
  AND kc.type = 'PK';



