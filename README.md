# Pizzas_sales_Analysis
# MYSQL Project

 Dataset used for educational and analysis purposes

# Help me understand how to use this correctly in both Excel and MySQL

In Excel (Basic Guide)
Open your Excel file (pizza_sales_excel_file.xlsx)

Use formulas like:

Total Revenue: =SUM(total_price_column)

Total Orders: Use =SUM(1/COUNTIF(order_id_range, order_id_range)) or use PivotTable

PivotTables:

Go to Insert > PivotTable

Drag order_date to Rows

Drag order_id to Values (Count)

Use pizza_category or pizza_size to filter/group

✅ In MySQL (Best Practices)
Import the Excel data (as .csv) into a table like pizza_sales.

Use structured queries like:

sql
Copy
Edit
-- Total revenue
SELECT SUM(total_price) FROM pizza_sales;

-- Total orders
SELECT COUNT(DISTINCT order_id) FROM pizza_sales;

-- Pizzas sold by size
SELECT pizza_size, SUM(quantity) FROM pizza_sales GROUP BY pizza_size;
Avoid redundancy:

Don’t repeat GROUP BY unnecessarily.

Use ALIAS names for readability (AS total_orders).

# 🍕 Pizza Sales Analysis

This project analyzes pizza sales data from a fictional pizzeria to uncover trends, patterns, and insights. The dataset includes order information, pizza types, quantities, categories, sizes, and revenue over time.

---

## 📊 Features & Insights

The analysis covers:

- ✅ Total revenue generated
- ✅ Total number of orders placed
- ✅ Total pizzas sold
- ✅ Average pizzas per order
- ✅ Daily, hourly, and weekly sales trends
- ✅ Best and worst selling pizzas
- ✅ Sales breakdown by category and size

---

## 📁 Files Included

| File Name                          | Description                          |
|-----------------------------------|--------------------------------------|
| `pizza_sales_excel_file.xlsx`     | Raw dataset with pizza sales         |
| `pizza_sales_analysis.sql`        | MySQL queries used in analysis       |
| `README.md`                       | Project description and overview     |

---

## 🧠 Sample SQL Questions Answered

```sql
-- Total Revenue
SELECT SUM(total_price) FROM pizza_sales;

-- Average Pizzas per Order
SELECT SUM(quantity) / COUNT(DISTINCT order_id) FROM pizza_sales;

-- Top 5 Best Sellers
SELECT pizza_name, SUM(quantity) AS total_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_sold DESC
LIMIT 5;

