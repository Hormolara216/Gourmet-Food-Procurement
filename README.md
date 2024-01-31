# Gourmet Food Procurement 

# Overview
This project involves the procurement analysis of gourmet food data, sourced from Kaggle. The dataset spans the time period of 2018-2019 and covers various aspects such as agency, food product details, distributors, vendors, quantities, weights, and costs.

# Technologies Used
**Azure Blob Storage:** The raw dataset was initially stored in Azure Blob Storage, providing a scalable and secure storage solution.

**Azure SQL Database:** The dataset was then copied from Azure Blob Storage to Azure SQL Database using a pipeline in Azure Data Factory. Azure SQL Database offers a reliable and managed database service for storing and querying structured data.

**Azure Data Factory:** The ETL (Extract, Transform, Load) process was orchestrated using Azure Data Factory. This involved defining a pipeline with activities for sourcing data from Azure Blob Storage, applying transformations, and sinking the results back to Azure Blob Storage.

# Data Source
The raw dataset, obtained from (Kaggle)[https://www.kaggle.com/datasets/anoopjohny/gourmet-food-procurement-data], invites you to delve into the intricacies of nutrition procurement. This comprehensive dataset provides a detailed exploration of food product acquisition by various agencies during the 2018-2019 period. The dataset offers valuable insights into the procurement landscape, enabling thorough analysis and understanding of food product dynamics within this timeframe.

# Project Flow
**Data Ingestion:** The raw dataset was ingested into Azure Blob Storage for initial storage and accessibility.

**Data Migration:** Using Azure Data Factory, the dataset was migrated from Azure Blob Storage to Azure SQL Database for structured storage.

**Data Transformation:** Azure Data Factory's dataflow capabilities were utilized for transformations, including source, filter, sort, and sink operations. These transformations aimed to prepare the data for procurement analysis.

**Food Procurement Analysis Queries:** SQL queries were developed within Azure SQL Database to perform in-depth procurement analysis, extracting valuable insights from the transformed data.

# Conclusion
This project showcases the end-to-end process of handling gourmet food procurement data. Leveraging cloud services like Azure Blob Storage, Azure SQL Database, and Azure Data Factory provides a scalable and efficient solution for managing, transforming, and analyzing large datasets.

