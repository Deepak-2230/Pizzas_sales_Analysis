create  database Pizzas_sales;
use Pizzas_sales;
 
CREATE TABLE pizza1 (
    pizza_id INT,
    order_id INT,
    pizza_name_id VARCHAR(50),
    quantity INT,
    order_date DATE,
    order_time TIME,
    unit_price DECIMAL(6,2),
    total_price DECIMAL(7,2),
    pizza_size VARCHAR(5),
    pizza_category VARCHAR(20),
    pizza_ingredients TEXT,
    pizza_name VARCHAR(100)
);

-- The sum of the total price of all pizza orders. 
SELECT SUM(total_price) AS total_sales
FROM pizza1;

-- The average amount spent per order, calculate by dividing 
-- the total revenue by the total number of orders. 

SELECT 
    SUM(total_price) / COUNT(DISTINCT order_id) AS avg_amount_per_order
FROM 
    pizza1;

-- The total number of orders placed.
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM pizza1;

-- The sum of the quantities of all pizzas sol. 
 
SELECT SUM(quantity) AS total_pizzas_sold
FROM pizza1;

--  The average number of pizzas sold per order. Calculated by dividing. 
-- The total number of pizzas sold by the total number of orders.

SELECT 
    SUM(quantity) / COUNT(DISTINCT order_id) AS avg_pizzas_per_order
FROM 
    pizza1;

    
-- Daily trend total Orders by Day of Week (With Day Index for Sorting)
SELECT 
    DAYNAME(order_date) AS day_of_week,
    COUNT(DISTINCT order_id) AS total_orders,
    DAYOFWEEK(order_date) AS day_index
FROM 
    pizza1
GROUP BY 
    day_of_week, day_index
ORDER BY 
    day_index;
    
    -- Hourly Trend 
    SELECT 
    HOUR(order_time) AS hour_of_day,
    SUM(quantity) AS total_pizzas_sold
FROM 
    pizza1
GROUP BY 
    HOUR(order_time)
ORDER BY 
    hour_of_day;

-- Percentage of sales by pizza category 

SELECT 
    pizza_category,
    ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza1), 2) AS sales_percentage
FROM 
    pizza1
GROUP BY 
    pizza_category
ORDER BY 
    sales_percentage DESC; 
    
    -- Percentage of sales by pizza size
    
    SELECT 
    pizza_size,
    ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza1), 2) AS sales_percentage
FROM 
    pizza1
GROUP BY 
    pizza_size
ORDER BY 
    sales_percentage DESC;

-- Total pizzas sold by pizza category

SELECT 
    pizza_category,
    SUM(quantity) AS total_pizzas_sold
FROM 
    pizza1
GROUP BY 
    pizza_category
ORDER BY 
    total_pizzas_sold DESC;

-- Top 5 Best sellers by Total pizzas sold.

SELECT 
    pizza_name,
    SUM(quantity) AS total_pizzas_sold
FROM 
    pizza1
GROUP BY 
    pizza_name
ORDER BY 
    total_pizzas_sold DESC
LIMIT 5;
 
 -- Bottom 5 worst sellers by total pizzas sold.
 
SELECT 
    pizza_name,
    SUM(quantity) AS total_pizzas_sold
FROM 
    pizza1
GROUP BY 
    pizza_name
ORDER BY 
    total_pizzas_sold ASC
LIMIT 5;


