/*
============================================================
PIZZA SALES DATA ANALYSIS
Database: pizzahut
Description: A collection of SQL queries ranging from basic 
             to advanced analysis of pizza sales data.
============================================================
*/

-- Use the database
USE pizzahut;

-- ---------------------------------------------------------
-- BASIC QUERIES
-- ---------------------------------------------------------

-- 1. Retrieve the total number of orders placed.
-- ----------------------------------------------

select count(order_id) as total_orders from orders;

-- 2. Calculate the total revenue generated from pizza sales.
-- -----------------------------------------------------------

select
round(sum(order_details.quantity * pizzas.price),2)
from	order_details join pizzas 
on pizzas.pizza_id = order_details.pizza_id;

-- 3. Identify the highest-priced pizza. 

select pizza_types.name as Pizza_name, max(pizzas.price) as Max_price
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
group by pizza_types.name 
order by Max_price desc 
limit  1;

-- 4. Identify the most common pizza size ordered.
-- ------------------------------------------------

select pizzas.size , count(order_details.order_details_id) as quantity
from pizzas 
join order_details on pizzas.pizza_id =  order_details.pizza_id
group by pizzas.size
order by quantity desc limit 1;

-- 5. List the top 5 most ordered pizza types along with their quantities.
-- -----------------------------------------------------------------------------

select pizza_types.name ,sum(order_details.quantity) as quantity
from pizza_types
join pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.name
order by quantity desc 
limit 5;
-- ---------------------------------------------------------
-- INTERMEDIATE QUERIES
-- ---------------------------------------------------------

-- 1. Join the necessary tables to find the total quantity of each pizza category ordered.
-- ---------------------------------------------------------------------------------------

select pizza_types.category , sum(order_details.quantity) as quantity
from pizza_types 
join pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id 
join order_details on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.category;zza_id = pizzas.pizza_id
GROUP BY pizza_types.category;

-- 2. Determine the distribution of orders by hour of the day.
-- -----------------------------------------------------------

select hour(order_time) as Time, count(order_id) as Orders from orders
group by Time
order by Orders desc;

-- 3. Join relevant tables to find the category-wise distribution of pizzas.
-- -----------------------------------------------------------------------------

select category , count(name) as types from pizza_types
group by category;

-- 4. Group the orders by date and calculate the average number of pizzas ordered per day.
-- --------------------------------------------------------------------------------------

select round(avg(daily_order),0) as  average_sells from
(select orders.order_date as date ,sum(order_details.quantity) as daily_order
from orders  
join order_details on orders.order_id =order_details.order_id
group by date) as daily_order_quantites;

-- 5. Determine the top 3 most ordered pizza types based on revenue.
-- -----------------------------------------------------------------

select pizza_types.name as Pizza_name, sum(order_details.quantity*pizzas.price) as Revenue 
from pizza_types join pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details on order_details.pizza_id = pizzas.pizza_id
group by Pizza_name
order by Revenue desc limit 3;

-- ---------------------------------------------------------
-- ADVANCED QUERIES
-- ---------------------------------------------------------

-- 1. Calculate the percentage contribution of each pizza type to total revenue.
-- -----------------------------------------------------------------------------

select new_table.category, (Revenue /  sum(Revenue) over())*100 as Revenue_Ratio_in_pecentage from
(select pizza_types.category , sum(order_details.quantity*pizzas.price) as Revenue
from pizza_types join pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details on pizzas.pizza_id = order_details.pizza_id
group by pizza_types.category) as new_table 

-- 2. Analyze the cumulative revenue generated over time.
-- This calculates a running total of revenue day-by-day.
-- ---------------------------------------------------------


select order_date , Revenue ,sum(Revenue) over(order by order_date) as cumulative_revenue 
from
(select orders.order_date , sum(order_details.quantity * pizzas.price) as Revenue 
from orders 
join order_details on order_details.order_id = orders.order_id
join pizzas on pizzas.pizza_id = order_details.pizza_id
group by orders.order_date) as sales;


-- 3. Determine the top 3 most ordered pizza types based on revenue for each pizza category.
-- Uses window functions (RANK) to categorize and rank performance within groups .
-- ----------------------------------------------------------------------------------------

select name, revenue from
(select category,name,revenue, rank() over(partition by category order by revenue desc ) as rank_on_sales from
(select pizza_types.category, pizza_types.name , sum(order_details.quantity*pizzas.price) as revenue
from pizza_types  join pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.category, pizza_types.name )  as a) as new_data 
where rank_on_sales <= 3;
