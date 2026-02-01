# Sales_Performance_Dashboard_PowerBI

**Project Overview**
This project demonstrates an end-to-end sales analytics workflow using Power BI, starting from data extraction from a MySQL database, through exploratory analysis in Excel, data transformation and modeling in Power BI, DAX calculations, and finally an interactive dashboard for business insights.

The data is simulated, but it was stored, queried, and extracted from a real MySQL database to closely mirror a real-world analytics environment.
________________________________________

Business Context & Objectives
Sales and operations teams often need fast, reliable answers to questions such as:
•	Where is revenue coming from?
•	Which products, cities, and sales representatives drive profitability?
•	Are high sales volumes translating into strong profits?
•	How do performance trends change over time and across sales channels?
This project was built to answer these questions using industry-standard BI tools and workflows.

This dashboard was built to provide clear, actionable answers to these questions through interactive visuals and KPIs.
________________________________________
Key Business Questions
The dashboard is designed to answer the following:
1.	How do revenue, cost (COGS), and profit perform overall?
2.	Which cities generate the highest revenue and profit?
3.	Which sales representatives contribute the most value?
4.	How do product categories perform in terms of sales volume vs profit?
5.	What seasonal or monthly revenue trends exist?
6.	How do sales channels (Online vs Store) compare?
7.	How does performance change when slicing by specific products and sales reps?

________________________________________

**Data Source & Database Design**
	Database: retail_db (MySQL)
   Data Type: Simulated transactional sales data
   Purpose: Portfolio and skills demonstration using real analytics workflows
Tables Used
1.	sales_transactions
   o	Transaction-level sales data (one row per product per sale)
2.	sales_rep_table
   o	Sales representative metadata and targets

________________________________________

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
________________________________________

<img width="642" height="388" alt="image" src="https://github.com/user-attachments/assets/3ce1e651-286d-4074-92d1-cfbb0e9791bb" />

Preview of the table Sales Dataset in Excel
________________________________________

<img width="201" height="109" alt="image" src="https://github.com/user-attachments/assets/4a86b940-fded-4f24-aed5-4b0e7c989e3a"  />

Preview Sales rep data in Excel.
________________________________________


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
________________________________________

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

________________________________________

<img width="786" height="335" alt="Screenshot 2026-02-01 210233" src="https://github.com/user-attachments/assets/8a7f2505-9135-4e06-8b56-203d0d5abda0" />

Final sales dataset in Power BI

________________________________________

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

The relationship uses single-direction filtering from Sales Reps to Sales Dataset
to ensure consistent aggregation and predictable filtering behavior.

________________________________________

**DAX Measures**

Core metrics were implemented as measures to ensure visuals remain filter-aware.

Total Revenue = SUM('Sales Dataset'[Revenue])

Total COGS = SUM('Sales Dataset'[COGS])

Total Profit = SUM('Sales Dataset'[Profit])

Sales Volume = SUM('Sales Dataset'[Quantity])

Profit Margin = DIVIDE([Total Profit], [Total Revenue])

________________________________________


**Dashboard Design & Interactivity**

The dashboard is designed to support both executive overview and detailed analysis.


Design Principles

KPI cards provide an immediate performance snapshot

Semantic color usage:

Revenue → Green

Profit → Green

COGS → Red (cost emphasis)

Combo charts are used to compare volume vs value

Tooltips added to explain anomalies without visual clutter

Slicers allow deep drill-down by:

1. Product
2 . Sales Representative
________________________________________

Dashboard overview
<img width="627" height="358" alt="Screenshot 2026-02-01 123851" src="https://github.com/user-attachments/assets/103ec053-7637-4914-b49b-d6ead8495b93" />
________________________________________

This view shows the report filtered by **Sales Rep = Chidinma** and **Product = Office Chair Pro**, demonstrating dynamic KPI updates and cross-filtering across visuals.

________________________________________

<img width="590" height="328" alt="image" src="https://github.com/user-attachments/assets/231a43e1-4e7c-4da0-a443-7fae5743ea39" />

________________________________________

Key Insights
1. Revenue and profit are concentrated in specific cities, highlighting regional opportunities.
2. High sales volume does not always equate to high profitability.
3. Sales representative performance varies significantly by product and region.
4. Monthly revenue spikes suggest seasonal or campaign-driven sales.
5. 	Online sales slightly outperform store sales for selected products.
________________________________________

Limitations
•	Data is simulated and does not represent real financial results.
•	Customer-level profitability is not included.
•	Marketing spend, returns, and operational overheads are excluded.
•	Limited time range restricts long-term trend analysis.
________________________________________

Future Enhancements
•	Add customer segmentation and lifetime value analysis
•	Incorporate profit margin trends by product and rep
•	Include sales targets vs actual performance
•	Expand dataset to cover a full fiscal year
•	Integrate forecasting and variance analysis
________________________________________
Tools Used
1. MySQL – Data storage and extraction
2. Excel – Exploratory analysis using Pivot Tables
3. Power BI – Data modeling, DAX, visualization
4. Power Query – Data transformation
5. SQL – Data extraction logic

________________________________________

## How to Run and Explore

1. Download and open the `.pbix` file in Power BI Desktop (minimum version: x.x).
2. Click on slicers (Product, Sales Rep) to filter visuals dynamically.
3. Hover over charts to see tooltips with supporting metrics.
4. Click different visuals to observe cross-filtering behavior.


________________________________________

Portfolio Note

This project is part of an ongoing effort to document analytics projects using realistic data pipelines and professional BI practices, providing a transparent record of skills development and analytical thinking.


