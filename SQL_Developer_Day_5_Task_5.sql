
drop table if exists orders
create table orders
(Customer_ID int,
Customer_Status varchar(50),
Date_Order_was_placed varchar(50),
Delivery_Date varchar(50),
Order_ID varchar(60),
Product_ID varchar(60),
Quantity_Ordered int,
Total_Retail_Price_for_This_Order float,
Cost_Price_Per_Unit float,
constraint fk_product_id foreign key(Product_ID) references products(Product_ID)
);

drop table if exists products
create table products
(Product_ID varchar(60) primary key,
Product_Line varchar(100),
Product_Category varchar(100),
Product_Group varchar(100),
Product_Name varchar(150),
Supplier_Country varchar(10),
Supplier_Name varchar(150),
Supplier_ID varchar(50)
);

select*from orders
select*from products

--EDA--
update orders
set customer_status='Gold'
where customer_status='GOLD'

update orders
set customer_status='Platinum'
where customer_status='PLATINUM'

update orders
set customer_status='Silver'
where customer_status='SILVER'

--1. inner join
select
o.customer_status,
count(o.product_id) as total_orders
from 
orders as o
join
products as p
on
o.Product_ID=p.Product_ID
group by o.customer_status
order by total_orders desc

--2. left join
select
o.customer_status,
p.product_line,
round(sum(o.Total_Retail_Price_for_This_Order)::numeric,2) as total_sales
from orders as o
left join
products as p
on
o.Product_ID=p.Product_ID
group by 1,2
order by 1 asc,3 desc

--3. Right Join
select
p.product_category,
coalesce(round(sum(o.Total_Retail_Price_for_This_Order)::numeric,2),0) as total_sales
from orders as o
right join
products as p
on
o.Product_ID=p.Product_ID
group by 1
order by total_sales desc

--4. Full join
select
p.product_name,
coalesce(round(sum(o.Total_Retail_Price_for_This_Order)::numeric,2),0) as total_sales
from orders as o
full join
products as p
on
o.Product_ID=p.Product_ID
group by 1
order by 2 desc

