# SQL_Developer_Day_5_Task_5
Fifth Task of SQL Developer  Internship @ Elevate Labs

Project Steps

1.Table Creation

Dropped existing orders and products tables (if they exist).

Created products table with product details (Product Line, Category, Group, Supplier info).

Created orders table with customer and order details (Customer Status, Order Dates, Quantity, Price).

Added a foreign key in orders linking Product_ID to products.

2.Data Exploration & Cleaning (EDA)

Standardized Customer_Status values for consistency:

Changed GOLD → Gold

Changed PLATINUM → Platinum

Changed SILVER → Silver

3.SQL Joins & Analysis

INNER JOIN

Joined orders with products on Product_ID.

Counted total orders per Customer_Status.

Sorted results by order volume (descending).

4.LEFT JOIN

Joined all orders with product details (even if some products missing).

Calculated total sales (SUM of Total_Retail_Price_for_This_Order) by Customer_Status and Product_Line.

Sorted by customer type (asc) and sales (desc).

5.RIGHT JOIN

Ensured all product categories appear, even if no orders exist.

Summed sales by Product_Category with COALESCE to replace missing sales with 0.

Ordered by sales (desc).

6.FULL JOIN

Combined all products and orders (even unmatched ones).

Summed sales by Product_Name, replacing NULLs with 0.

Ranked products by total sales (desc).
