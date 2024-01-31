DROP TABLE [dbo].[FOODPURCHASED];

CREATE TABLE FOODPURCHASED (
    ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Agency VARCHAR(200),
    Time_Period VARCHAR(200),
    Food_Product_Group VARCHAR(200),
    Food_Product_Category VARCHAR(200),
    Product_Name VARCHAR(200),
    Product_Type VARCHAR(200),
    Origin_Detail VARCHAR(200),
    Distributor VARCHAR(200),
	Vendor VARCHAR(200),
    Quantity_Units_Procured INT,
    Total_Weight_in_lbs INT,
    Total_Cost INT
);

SELECT TOP (1000) * FROM [dbo].[FOODPURCHASED];

--List All Agencies
SELECT DISTINCT Agency
FROM [dbo].[FOODPURCHASED];

--Total Cost Analysis by Agency
SELECT Agency,SUM(Total_Cost) AS TotalCost
FROM [dbo].[FOODPURCHASED]
GROUP BY Agency
ORDER BY TotalCost DESC;

--Top Food Product Categories by Total Weight
SELECT TOP 5 SUM(Total_Weight_in_lbs) AS TotalWeight ,	
Food_Product_Category
FROM [dbo].[FOODPURCHASED]
GROUP BY Food_Product_Category
ORDER BY TotalWeight DESC;

--Vendor-wise Procurement Summary
SELECT Vendor, COUNT(*) AS NumOfTransactions, SUM(Total_Cost) AS TotalCost
FROM [dbo].[FOODPURCHASED]
WHERE Total_Cost IS NOT NULL
GROUP BY Vendor
ORDER BY NumOfTransactions DESC;

--Products with Highest Unit Cost
SELECT TOP 10 Product_Name, Product_Type, MAX(Total_Cost /Quantity_Units_Procured) AS UnitCost
FROM [dbo].[FOODPURCHASED]
GROUP BY Product_Name, Product_Type
ORDER BY UnitCost DESC;

--Product_Type and calculate UnitCost based on conditions
SELECT Product_Type, 
CASE
        WHEN ISNULL(Total_Cost, '') = '' THEN 'No Cost'
        ELSE CAST(Total_Cost AS VARCHAR(20))  
    END AS UnitCost
FROM [dbo].[FOODPURCHASED]
GROUP BY Product_Type,Total_Cost
ORDER BY Total_Cost,UnitCost DESC;

--Total Cost Analysis by Food Product Category for 2018-2019 using CTE
WITH TotalCostAnalysis AS (
    SELECT
        Food_Product_Category,
        SUM(Total_Cost) AS TotalCost
    FROM
        [dbo].[FOODPURCHASED]
    WHERE
        Time_Period >= '2018-01-01' AND Time_Period <= '2019-12-31'
    GROUP BY
        Food_Product_Category
)

SELECT
    Food_Product_Category,
    TotalCost
FROM
    TotalCostAnalysis
ORDER BY
    TotalCost DESC;
