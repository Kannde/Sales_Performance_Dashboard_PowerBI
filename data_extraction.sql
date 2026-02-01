/*
  Project: Sales Performance Dashboard (Power BI)
  Database: retail_db (MySQL)
  Notes:
  - Data is simulated, but stored and queried from a real MySQL database.
  - Two extracts were used:
      1) sales_transactions  (fact / transactional sales)
      2) sales_rep_table     (dimension / sales reps metadata)
  - SalesRepID is the relationship key:
      sales_rep_table.SalesRepID = PK
      sales_transactions.SalesRepID = FK
*/

USE retail_db;

-- 1) Extract transactional sales data
SELECT
    Date,
    City,
    Channel,
    Product,
    Category,
    Unit_Price,
    Quantity,
    Cost_Price,
    SalesRepID
FROM sales_transactions;

-- 2) Extract sales rep metadata (limited to IDs used in the report)
SELECT
    SalesRepID,
    Sales_rep,
    Region,
    Target
FROM sales_rep_table
WHERE SalesRepID BETWEEN 1 AND 6;

/*
  Optional validation queries (not required, but useful during extraction)

  -- Check row counts
  SELECT COUNT(*) AS transaction_rows FROM sales_transactions;
  SELECT COUNT(*) AS rep_rows FROM sales_rep_table WHERE SalesRepID BETWEEN 1 AND 6;

  -- Check SalesRepID coverage in transactions
  SELECT SalesRepID, COUNT(*) AS transactions
  FROM sales_transactions
  GROUP BY SalesRepID
  ORDER BY SalesRepID;

  -- Detect missing rep IDs (transactions referencing reps not in the rep table extract)
  SELECT DISTINCT t.SalesRepID
  FROM sales_transactions t
  LEFT JOIN sales_rep_table r
      ON t.SalesRepID = r.SalesRepID
  WHERE r.SalesRepID IS NULL;
*/
