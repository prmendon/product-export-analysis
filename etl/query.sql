-- ============================================
-- Created by : Prajna Mendon
-- Creation Date : 12 March 2026
-- Description : Merge the export data for FY23-FY25, cleaning and creating fact & dimension tables.
-- NOTE : All the 3 csv files are imported using the "Import Flat File" option under the "Tasks" inorder to work further.
-- ============================================
-- 1. Union all the Product Export Analysis
-- ============================================
USE [Sanford Product Analysis]

Select 
       [Species]
      ,[Product]
      ,[Country]
      ,CAST([Volume] AS DECIMAL(18,2)) AS Volume
      ,CAST([Value] AS DECIMAL(18,2)) AS Price
      ,CAST(2023 as INT) as [Year]
  INTO stg_exports
  FROM [Sanford Product Analysis].[dbo].[exports-by-product-jul-23]
  UNION ALL

  Select 
       [Species]
      ,[Product]
      ,[Country]
      ,CAST([Volume] AS DECIMAL(18,2)) AS Volume
      ,CAST([Value] AS DECIMAL(18,2)) AS Price
      ,CAST(2024 as INT) as [Year]
  FROM [Sanford Product Analysis].[dbo].[exports-by-product-jul-24]
  UNION ALL
  
  Select 
       [Species]
      ,[Product]
      ,[Country]
      ,CAST([Volume] AS DECIMAL(18,2)) AS Volume
      ,CAST([Value] AS DECIMAL(18,2)) AS Price
      ,CAST(2025 as INT) as [Year]
  FROM [Sanford Product Analysis].[dbo].[exports-by-product-jul-25]

-- ============================================
-- 2. Check for NUll values
-- ============================================

--To check any Null values. If there are any , will remove that from the dataset 
Select * from stg_exports
WHERE [Species] is NULL
OR  [Product] IS NULL
OR [Country] IS NULL

Select * from stg_exports
WHERE [Volume]=0 OR [Price] =0

-- ============================================
-- 3.Creating dimension tables for Country & Product
-- ============================================
--Country
SELECT 
    ROW_NUMBER() OVER (ORDER BY COUNTRY) AS Country_id,
    Country
INTO dim_country
FROM (
SELECT DISTINCT Country
FROM stg_exports
WHERE Country IS NOT NULL)t ;

--Product/Species
SELECT 
    ROW_NUMBER() OVER (ORDER BY Species,Product) AS Product_id
    ,Species
    ,Product
INTO  dim_product
FROM (
SELECT DISTINCT Species,Product
FROM stg_exports
WHERE Species IS NOT NULL
AND Product IS NOT NULL) t ;

-- ============================================
-- 4.Creating fact table
-- ============================================
SELECT       
       [Year]
       ,c.Country_id
       ,p.product_id
       ,s.volume
       ,s.Price
       ,ROUND(s.Price/NULLIF(s.volume,0),2) as Price_per_kg
INTO fact_exports
FROM stg_exports s
       JOIN dim_country c ON s.Country=c.Country
       JOIN dim_product p ON p.Species=s.Species AND s.Product = p.Product;
       
