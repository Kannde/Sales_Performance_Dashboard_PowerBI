# DAX Measures (Power BI)

This document lists the core measures used in the Sales Performance Dashboard.
All measures are designed to be **filter-aware**, meaning they update dynamically
based on slicers (e.g., Product, Sales Rep) and chart interactions.

---

## Base Measures

### Total Revenue
**Purpose:** Total revenue generated for the current filter context (city, product, rep, channel, month, etc.).  
**Used in:** KPI card, city chart, rep chart, category chart, channel chart, monthly trend.

```DAX
Total Revenue = SUM('Sales Dataset'[Revenue])

Total COGS

Purpose: Total cost of goods sold for the current filter context.
Used in: KPI card, COGS vs Revenue by City chart.

Total COGS = SUM('Sales Dataset'[COGS])
Total Profit

Purpose: Total profit for the current filter context.
Used in: KPI card, profit visuals across the dashboard.

Total Profit = SUM('Sales Dataset'[Profit])

Sales Volume

Purpose: Total units sold (quantity) for the current filter context.
Used in: KPI card, category total sales.

Sales Volume = SUM('Sales Dataset'[Quantity])

I have not added these to the current dashboard 
Revenue MTD (Month-to-Date)
Revenue MTD =
TOTALMTD(
  [Total Revenue],
  'Date'[Date]
)

Revenue MoM % Change
Revenue MoM % =
VAR PrevMonthRevenue =
    CALCULATE([Total Revenue], DATEADD('Date'[Date], -1, MONTH))
RETURN
    DIVIDE([Total Revenue] - PrevMonthRevenue, PrevMonthRevenue)
