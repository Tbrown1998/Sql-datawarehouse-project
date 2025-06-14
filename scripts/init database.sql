/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.
	
WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/


-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Switch to the master database to ensure we're not in a user-defined DB
USE master;
GO

-- Create the DataWarehouse database
CREATE DATABASE DataWarehouse;
GO

-- Switch to the newly created DataWarehouse database
USE DataWarehouse;
GO

-- Create the BRONZE schema for raw/staging data
CREATE SCHEMA BRONZE;
GO

-- Create the SILVER schema for cleansed and transformed data
CREATE SCHEMA SILVER;
GO

-- Create the GOLD schema for business-ready, curated data
CREATE SCHEMA GOLD;
GO
