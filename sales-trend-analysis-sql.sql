-- creating databases 
create database SalesTrendDB;

-- use database
use SalesTrendDB;

-- creating the table 
create table orders (order_id int primary key, order_date date,amount decimal(10,2), product_id int ); 

-- inserting sample data
insert into orders values
(101,'2025-01-05',500,11),
(102,'2025-01-08',800,14),
(103,'2025-01-15',900,12),
(104,'2025-02-05',1200,11),
(105,'2025-02-18',750,15),
(106,'2025-03-02',1600,13),
(107,'2025-03-12',950,11),
(108,'2025-03-28',1400,18),
(109,'2025-04-06',2200,17),
(110,'2025-04-17',1800,14),
(111,'2025-05-04',2100,11),
(112,'2025-05-20',1900,16),
(113,'2025-06-10',2500,18),
(114,'2025-06-18',1700,12),
(115,'2025-06-25',900,14);

-- displaying data
select * from orders;

-- extract month
select month(order_date) as Month from orders;

-- monthly revenue
select year(order_date) as Year,
month(order_date) as Month,
sum(amount) as Monthly_Revenue
from orders
group by Year, Month
order by Year, Month;

-- monthly order volume
select year(order_date) as Year,
month(order_date) as Month,
count(distinct order_id) as Total_Orders
from orders
group by Year, Month
order by Year, Month;

-- revenue + orders together
select year(order_date) as Year,
month(order_date) as Month,
sum(amount) as Revenue,
count(distinct order_id) as Total_Orders
from orders
group by Year, Month
order by Year, Month;

-- specific time period
select year(order_date) as Year,
month(order_date) as Month,
sum(amount) as Revenue
from orders
where order_date between '2025-01-01' and '2025-03-31'
group by Year, Month
order by Year, Month;

-- highest sales month
select year(order_date) as Year,
month(order_date) as Month,
sum(amount) as Revenue
from orders
group by Year, Month
order by Revenue desc
limit 3;

-- average monthly revenue 
select year(order_date),
month(order_date),
avg(amount) as Average_Revenue
from orders
group by Year(order_date), Month(order_date)
order by Year(order_date), Month(order_date);

-- maximum sale
select year(order_date),
month(order_date),
max(amount) as Highest_Order
from orders
group by Year(order_date), Month(order_date);

-- minimum slae
select year(order_date),
month(order_date),
min(amount) as Lowest_Order
from orders
group by Year(order_date), Month(order_date);

-- total revenue
select sum(amount) as Total_Revenue from orders;

-- Total orders
select count(*) as Total_Orders from orders;

-- avergae order values
select avg(amount) as Average_Order_value from orders;

-- highest order amount
select max(amount) as Highest_Order from orders;

-- Lowest order amount
select min(amount) as Lowest_order from orders;

-- total revenue by product
select product_id, sum(amount) as Revenue 
from orders
group by product_id 
order by Revenue desc;

-- numbers of orders per product
select product_id , count(order_id) as Orders
from orders
group by product_id
order by orders desc;


-- average revenue per product
select product_id, avg(amount) as Average_revenue
from orders
group by product_id
order by product_id;

-- revenue for each year
select Year(order_date) as Year,
sum(amount) as Revenue 
from orders
group by Year(order_date);

-- orders in each year
select Year(order_date) as Year,
count(order_id) as Orders 
from orders
group by Year(order_date);

-- reevenue in a specific month
select sum(amount) as June_Revenue
from orders
where Month(order_date)=6;

-- orders above 1000
select * from orders where amount >1000;

-- orders below 1000
select * from orders where amount <1000;

-- find top selling product 
select product_id,
sum(amount) as Revenue 
from orders
group by product_id
order by Revenue desc
limit 1;

-- find bottom selling product
select product_id,
sum(amount) as Revenue 
from orders
group by product_id
order by Revenue asc
limit 1;

