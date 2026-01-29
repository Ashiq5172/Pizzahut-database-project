📊 Pizza Hut Sales Dataset
📌 Overview

This dataset contains realistic business records from a Pizza Hut–style pizza restaurant.
It is designed for SQL practice, data analysis, and beginner to intermediate analytics projects.

The data is stored in four CSV files and follows a relational database structure, making it ideal for practicing:

SQL JOINs

Aggregations

Revenue analysis

Time-based analysis

Business insights

📁 Dataset Files
File Name	Description
orders.csv	Stores order-level information such as order date and time.
order_details.csv	Stores item-level details for each order, including quantity.
pizzas.csv	Contains pizza size options and prices.
pizza_types.csv	Contains pizza names, categories, and ingredients.
🔑 Key Columns
orders.csv

order_id – Unique ID for each order

date – Order date

time – Order time

order_details.csv

order_id – References orders

pizza_id – References pizzas

quantity – Number of pizzas ordered

pizzas.csv

pizza_id – Unique pizza identifier

pizza_type_id – References pizza types

size – Pizza size (S, M, L, XL, etc.)

price – Price of the pizza

pizza_types.csv

pizza_type_id – Unique pizza type identifier

name – Pizza name

category – Pizza category (Classic, Veggie, Chicken, Supreme, etc.)

ingredients – Ingredients list

🔗 Database Schema & Relationships (Beginner-Friendly)

This dataset uses a relational schema, similar to real-world restaurant databases.

🧩 How the Tables Connect
orders
  |
  | order_id
  ↓
order_details
  |
  | pizza_id
  ↓
pizzas
  |
  | pizza_type_id
  ↓
pizza_types

📝 Explanation

orders stores when an order happened

order_details links orders to the pizzas bought

pizzas stores size and price information

pizza_types stores descriptive details about each pizza

The order_details table acts as a bridge table, connecting customer orders to pizza items and enabling accurate revenue and sales analysis.
