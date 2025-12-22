-- KPI
-- Total Revenue: The sum of the total prize of all pizza orders
Select sum(total_price) as Total_revenue from pizza_sales

-- Average Order Value: The average amount spent per order, calculate by dividing the total revenue by the total number of orders
Select Sum(total_price)/Count(Distinct order_id) as Avg_Order_Value from pizza_sales

--Total Pizza Sold: The Sum of the quantites of all pizza sold
Select Sum(quantity) as Total_Pizza_Sold from pizza_sales

--Total Orders: The total number of orders placed
Select Count(Distinct(order_id)) as Total_orders from pizza_sales order by Total_orders

--Average Pizza Per Order: The average number of pizza sold per order, calculated by dividing the total number of pizzas sold by the total numbers of orders
Select Cast(Sum(quantity) ) /Count(Distinct(order_id)) as Avg_Pizza_Per_Order from pizza_sales

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Charts Data Requirement

-- Daily Trend For Total Orders
Select DATENAME(dw,order_date) as WKDAY , count(Distinct order_id) from pizza_sales Group by DATENAME(dw,order_date) 

-- Monthly Trend For Total Orders
Select DATENAME(m,order_date) as Month , count(Distinct order_id) as Total_order from pizza_sales Group by DATENAME(m,order_date) 

-- Percentage of Sales By Pizza Category
Select pizza_category , Sum(Total_price) * 100 /( Select Sum(Total_price) from pizza_sales) from pizza_sales Group by pizza_category

-- Percentage of Sales By Pizza Siza
Select pizza_size , Sum(Total_price) * 100 /( Select Sum(Total_price) from pizza_sales) from pizza_sales Group by pizza_size

-- Top 5 Best Sellers By revenue, Total Quantity and Total orders

Select Sum(total_price) as Revenue , quantity, order_id from pizza_sales Group by quantity,order_id
