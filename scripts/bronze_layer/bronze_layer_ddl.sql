-- Check if the table 'crm_cust_info' exists in the 'bronze' schema; if it does, drop it
IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_cust_info;
GO

-- Create 'crm_cust_info' table to store raw customer information
CREATE TABLE bronze.crm_cust_info (
    cst_id              INT,              -- Customer ID
    cst_key             NVARCHAR(50),     -- Unique customer key
    cst_firstname       NVARCHAR(50),     -- Customer first name
    cst_lastname        NVARCHAR(50),     -- Customer last name
    cst_marital_status  NVARCHAR(50),     -- Marital status
    cst_gndr            NVARCHAR(50),     -- Gender
    cst_create_date     DATE              -- Account creation date
);
GO

-- Check if the table 'crm_prd_info' exists in the 'bronze' schema; if it does, drop it
IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_prd_info;
GO

-- Create 'crm_prd_info' table to store raw product information
CREATE TABLE bronze.crm_prd_info (
    prd_id       INT,             -- Product ID
    prd_key      NVARCHAR(50),    -- Unique product key
    prd_nm       NVARCHAR(50),    -- Product name
    prd_cost     INT,             -- Product cost
    prd_line     NVARCHAR(50),    -- Product line or category
    prd_start_dt DATETIME,        -- Product start date (availability)
    prd_end_dt   DATETIME         -- Product end date (discontinued or promotion end)
);
GO

-- Check if the table 'crm_sales_details' exists in the 'bronze' schema; if it does, drop it
IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE bronze.crm_sales_details;
GO

-- Create 'crm_sales_details' table to store raw sales transaction details
CREATE TABLE bronze.crm_sales_details (
    sls_ord_num  NVARCHAR(50),    -- Sales order number
    sls_prd_key  NVARCHAR(50),    -- Product key
    sls_cust_id  INT,             -- Customer ID
    sls_order_dt INT,             -- Order date (as integer)
    sls_ship_dt  INT,             -- Shipping date (as integer)
    sls_due_dt   INT,             -- Due date (as integer)
    sls_sales    INT,             -- Sales amount
    sls_quantity INT,             -- Quantity sold
    sls_price    INT              -- Price per unit
);
GO

-- Check if the table 'erp_loc_a101' exists in the 'bronze' schema; if it does, drop it
IF OBJECT_ID('bronze.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE bronze.erp_loc_a101;
GO

-- Create 'erp_loc_a101' table to store raw ERP location data
CREATE TABLE bronze.erp_loc_a101 (
    cid    NVARCHAR(50),         -- Customer or company ID
    cntry  NVARCHAR(50)          -- Country
);
GO

-- Check if the table 'erp_cust_az12' exists in the 'bronze' schema; if it does, drop it
IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE bronze.erp_cust_az12;
GO

-- Create 'erp_cust_az12' table to store raw ERP customer demographics
CREATE TABLE bronze.erp_cust_az12 (
    cid    NVARCHAR(50),         -- Customer or company ID
    bdate  DATE,                 -- Birthdate
    gen    NVARCHAR(50)          -- Gender
);
GO

-- Check if the table 'erp_px_cat_g1v2' exists in the 'bronze' schema; if it does, drop it
IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE bronze.erp_px_cat_g1v2;
GO

-- Create 'erp_px_cat_g1v2' table to store raw ERP product category data
CREATE TABLE bronze.erp_px_cat_g1v2 (
    id           NVARCHAR(50),   -- Item or product ID
    cat          NVARCHAR(50),   -- Category
    subcat       NVARCHAR(50),   -- Subcategory
    maintenance  NVARCHAR(50)    -- Maintenance-related info
);
GO
