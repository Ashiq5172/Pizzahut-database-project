# 🍕 Pizza Hut Sales Analysis SQL Project

## Project Overview

**Project Title:** Pizza Hut Sales Analysis
**Level:** Beginner – Intermediate
**Database:** pizza_hut_db

This project demonstrates practical **MySQL** skills using a real-world **Pizza Hut sales dataset**. The analysis focuses on sales performance, customer ordering behavior, and product trends through structured SQL queries. The workflow includes database setup, data cleaning, exploratory data analysis (EDA), and business-focused insights.

This repository is suitable for beginners aiming to build a **job-ready SQL portfolio project** for internships or entry-level data analyst roles.

---

## Objectives

1. **Set up the Pizza Hut sales database**
   Create and populate tables for orders, pizzas, pizza types, and order details.

2. **Data Cleaning**
   Detect and handle missing, NULL, or inconsistent values.

3. **Exploratory Data Analysis (EDA)**
   Explore order trends, revenue distribution, and pizza categories.

4. **Business Analysis**
   Answer real business questions using SQL to derive actionable insights.

---

## Dataset Description

The dataset consists of the following tables:

* **orders** – Order date and time information
* **order_details** – Quantity of pizzas per order
* **pizzas** – Pizza size and price details
* **pizza_types** – Pizza name, category, and ingredients

---

## SQL Analysis Questions

### 🔹 Basic Level

1. Retrieve the **total number of orders placed**.
2. Calculate the **total revenue** generated from pizza sales.
3. Identify the **highest-priced pizza**.
4. Identify the **most common pizza size ordered**.
5. List the **top 5 most ordered pizza types** along with their quantities.

---

### 🔹 Intermediate Level

6. Join the necessary tables to find the **total quantity of each pizza category ordered**.
7. Determine the **distribution of orders by hour of the day**.
8. Join relevant tables to find the **category-wise distribution of pizzas**.
9. Group the orders by date and calculate the **average number of pizzas ordered per day**.
10. Determine the **top 3 most ordered pizza types based on revenue**.

---

### 🔹 Advanced Level

11. Calculate the **percentage contribution of each pizza type to total revenue**.
12. Analyze the **cumulative revenue generated over time**.
13. Determine the **top 3 most ordered pizza types based on revenue for each pizza category**.

---

## SQL Concepts Used

* `SELECT`, `WHERE`, `ORDER BY`
* `GROUP BY`, `HAVING`
* `JOIN` (INNER JOIN)
* Aggregate functions: `SUM`, `COUNT`, `AVG`
* Subqueries
* Window functions
* Date and time functions

---

## Project Structure

```
📂 pizza-hut-sales-sql
 ├── schema.sql        -- Database and table creation
 ├── insert.sql        -- Data insertion
 ├── queries.sql       -- Business analysis queries
 ├── README.md         -- Project documentation
 ├── data/             -- CSV files (orders, order_details, etc.)
 └── screenshots/      -- Query outputs and error screenshots
```

---

## Sample Query

```sql
SELECT pt.category,
       SUM(od.quantity * p.price) AS total_revenue
FROM pizza_types pt
JOIN pizzas p ON pt.pizza_type_id = p.pizza_type_id
JOIN order_details od ON p.pizza_id = od.pizza_id
GROUP BY pt.category
ORDER BY total_revenue DESC;
```

---

## Tools Used

* MySQL
* MySQL Workbench
* GitHub

---

## How to Run This Project

1. Create a database named `pizza_hut_db`
2. Execute `schema.sql` to create tables
3. Run `insert.sql` to populate data
4. Run analysis queries from `queries.sql`

---

## Author

**Md. Ashiqur Rahman**
Aspiring Data Analyst | SQL Enthusiast

---

⭐ If you find this project useful, feel free to **star the repository**!
