-- Ensure schema exists
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'bronze')
    EXEC('CREATE SCHEMA bronze');
GO

/* =========================
   DROP TABLES IF EXIST
========================= */

IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_cust_info;

IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_prd_info;

IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE bronze.crm_sales_details;

IF OBJECT_ID('bronze.erp_CUST_AZ12', 'U') IS NOT NULL
    DROP TABLE bronze.erp_CUST_AZ12;

IF OBJECT_ID('bronze.erp_LOC_A101', 'U') IS NOT NULL
    DROP TABLE bronze.erp_LOC_A101;

IF OBJECT_ID('bronze.erp_PX_CAT_G1V2', 'U') IS NOT NULL
    DROP TABLE bronze.erp_PX_CAT_G1V2;

GO

/* =========================
   CREATE TABLES
========================= */

CREATE TABLE bronze.crm_cust_info(
    cst_id INT PRIMARY KEY,
    cst_key NVARCHAR(50),
    cst_firstname NVARCHAR(50),
    cst_lastname NVARCHAR(50),
    cst_marital_status CHAR(50),
    cst_gndr NVARCHAR(1),
    cst_create_date DATE
);

CREATE TABLE bronze.crm_prd_info (
    prd_id INT,
    prd_key NVARCHAR(50),
    prd_nm NVARCHAR(50),
    prd_cost DECIMAL(10,2),
    prd_line NVARCHAR(1),
    prd_start_dt DATE,
    prd_end_dt DATE
);

CREATE TABLE bronze.crm_sales_details (
    sales_order_number NVARCHAR(20),
    product_key NVARCHAR(50),
    customer_id INT,
    order_date INT,
    ship_date INT,
    due_date INT,
    sales_amount DECIMAL(10,2),
    quantity INT,
    unit_price DECIMAL(10,2)
);

CREATE TABLE bronze.erp_CUST_AZ12(
    cid NVARCHAR(50),
    bdate DATE,
    gen NVARCHAR(10)
);

CREATE TABLE bronze.erp_LOC_A101 (
    cid NVARCHAR(50),
    cntry NVARCHAR(50)
);

CREATE TABLE bronze.erp_PX_CAT_G1V2 (
    id NVARCHAR(50),
    category NVARCHAR(50),
    subcategory NVARCHAR(50),
    maintenance_flag NVARCHAR(50)
);



