
/* =====================================================
   1. CREATE DATABASE IF NOT EXISTS
===================================================== */

USE master;
GO

IF NOT EXISTS (
    SELECT name 
    FROM sys.databases 
    WHERE name = 'DataWarehouse'
)
BEGIN
    CREATE DATABASE DataWarehouse;
END
GO


/* =====================================================
   2. SWITCH TO DATABASE
===================================================== */

USE DataWarehouse;
GO


/* =====================================================
   3. CREATE SCHEMAS (BRONZE / SILVER / GOLD)
===================================================== */

-- Bronze Layer (Raw Data)
IF NOT EXISTS (
    SELECT * 
    FROM sys.schemas 
    WHERE name = 'bronze'
)
BEGIN
    EXEC('CREATE SCHEMA bronze');
END
GO


-- Silver Layer (Cleaned / Transformed)
IF NOT EXISTS (
    SELECT * 
    FROM sys.schemas 
    WHERE name = 'silver'
)
BEGIN
    EXEC('CREATE SCHEMA silver');
END
GO


-- Gold Layer (Analytics / Reporting)
IF NOT EXISTS (
    SELECT * 
    FROM sys.schemas 
    WHERE name = 'gold'
)
BEGIN
    EXEC('CREATE SCHEMA gold');
END
GO
