# Sales_Performance_Dashboard_PowerBI

**Project Overview**
This project demonstrates an end-to-end sales analytics workflow using Power BI, starting from data extraction from a MySQL database, through exploratory analysis in Excel, data transformation and modeling in Power BI, DAX calculations, and finally an interactive dashboard for business insights.

The data is simulated, but it was stored, queried, and extracted from a real MySQL database to closely mirror a real-world analytics environment.

Business Context & Objectives
Sales and operations teams often need fast, reliable answers to questions such as:
•	Where is revenue coming from?
•	Which products, cities, and sales representatives drive profitability?
•	Are high sales volumes translating into strong profits?
•	How do performance trends change over time and across sales channels?
This project was built to answer these questions using industry-standard BI tools and workflows.

This dashboard was built to provide clear, actionable answers to these questions through interactive visuals and KPIs.

Key Business Questions

Key Business Questions
The dashboard is designed to answer the following:
1.	How do revenue, cost (COGS), and profit perform overall?
2.	Which cities generate the highest revenue and profit?
3.	Which sales representatives contribute the most value?
4.	How do product categories perform in terms of sales volume vs profit?
5.	What seasonal or monthly revenue trends exist?
6.	How do sales channels (Online vs Store) compare?
7.	How does performance change when slicing by specific products and sales reps?


**Data Source & Database Design**
•	Database: retail_db (MySQL)
•	Data Type: Simulated transactional sales data
•	Purpose: Portfolio and skills demonstration using real analytics workflows
Tables Used
1.	sales_transactions
   o	Transaction-level sales data (one row per product per sale)
2.	sales_rep_table
   o	Sales representative metadata and targets



**Data Acquisition (MySQL)**

Data was extracted directly from the MySQL database using SQL queries.

Sales Transactions Extraction
SELECT
    Date,
    City,
    CustomerType,
    Channel,
    Product,
    Category,
    UnitPrice,
    Quantity,
    Discount,
    CostPrice,
    SalesRepID
FROM sales_transactions;

Sales Representatives Extraction
SELECT
    SalesRepID,
    Sales_rep,
    Region,
    Target
FROM sales_rep_table
WHERE SalesRepID BETWEEN 1 AND 6;


Tables Extracted from MySQL
1.	sales_transactions (Sales Dataset / Fact Table)
Transaction-level sales data.
2.	sales_rep_table (Sales Reps / Dimension Table)
Sales rep metadata and performance targets.
These datasets were exported and loaded into Excel and Power BI for further analysis.

<img width="642" height="388" alt="image" src="https://github.com/user-attachments/assets/3ce1e651-286d-4074-92d1-cfbb0e9791bb" caption="Sales Dataset in excel"/>
<img width="201" height="109" alt="image" src="https://github.com/user-attachments/assets/4a86b940-fded-4f24-aed5-4b0e7c989e3a" caption="Sales rep data in excel" />



**Exploratory Analysis (Excel)**

Before building the Power BI dashboard, a quick exploratory analysis was conducted in Excel using Pivot Tables.

Purpose of Excel Analysis

Validate data quality after extraction

Identify key KPIs (Revenue, COGS, Profit, Sales Volume)

Understand high-level trends by:

City

Product category

Sales representative

Channel

Determine which insights and comparisons would be most valuable to visualize in Power BI

This step helped define dashboard focus areas and prevented unnecessary or redundant visuals later in Power BI.

**Data Transformation (Power Query – ETL)**
Transformations were performed in Power Query to prepare the dataset for analysis and reporting.
Key steps
•	Enforced correct data types (Date, numeric columns)
•	Standardized categorical values (City, Product, Category, Channel)
•	Created calculated fields used throughout the dashboard:
•	Revenue = Unit Price × Quantity
•	COGS = Cost Price × Quantity
•	Profit = Revenue − COGS
•	Created date attributes:
•	Month Name
•	Month Number (for chronological sorting)
•	Year
•	Prepared sales rep data for relationship modeling
(These fields appear in the final Power BI table view and are used across measures and visuals.)

<img width="786" height="335" alt="Screenshot 2026-02-01 210233" src="https://github.com/user-attachments/assets/8a7f2505-9135-4e06-8b56-203d0d5abda0" caption="final sales dataset in powerbi"/>


Data Modeling (Power BI)

The Power BI model uses two tables:

Tables in the Model

Sales Dataset (Fact table): transactional sales data from sales_transactions

Sales Reps (Dimension table): rep metadata from sales_rep_table

Relationship

Sales Reps[SalesRepID] = Primary Key (1 side)

Sales Dataset[SalesRepID] = Foreign Key (many side)

This relationship enables filtering and drill-down, such as:

Selecting a Sales Rep slicer value (e.g., Chidinma) and having all KPIs/visuals update accordingly

Analyzing product performance by rep, region, and city without duplicating data.

DATA MODEL DIAGRAM 
<img width="508" height="334" alt="image" src="https://github.com/user-attachments/assets/f6e7421a-46d5-464a-b748-79f9884d4dd3" />


**DAX Measures**
Core metrics were implemented as measures to ensure visuals remain filter-aware.

Total Revenue = SUM('Sales Dataset'[Revenue])

Total COGS = SUM('Sales Dataset'[COGS])

Total Profit = SUM('Sales Dataset'[Profit])

Sales Volume = SUM('Sales Dataset'[Quantity])

Profit Margin = DIVIDE([Total Profit], [Total Revenue])

Dashboard overview
<img width="627" height="358" alt="Screenshot 2026-02-01 123851" src="https://github.com/user-attachments/assets/103ec053-7637-4914-b49b-d6ead8495b93" />

This view shows the report filtered by **Sales Rep = Chidinma** and **Product = Office Chair Pro**, demonstrating dynamic KPI updates and cross-filtering across visuals.

<img width="590" height="328" alt="image" src="https://github.com/user-attachments/assets/231a43e1-4e7c-4da0-a443-7fae5743ea39" />


## How to Run and Explore

1. Download and open the `.pbix` file in Power BI Desktop (minimum version: x.x).
2. Click on slicers (Product, Sales Rep) to filter visuals dynamically.
3. Hover over charts to see tooltips with supporting metrics.
4. Click different visuals to observe cross-filtering behavior.


