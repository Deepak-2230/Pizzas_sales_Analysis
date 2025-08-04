# Pizzas_sales_Analysis
Dataset used for educational and analysis purposes

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

