create database retail_db;
use retail_db;
--------------------------------
create table customers
(
customer_id INT,
customer_name VARCHAR(100),
city VARCHAR(50)
);

insert into customers values(1, 'Rahul', 'Hyderabad'),
(2, 'Priya', 'Bangalore'), (3, 'Amit', 'Mumbai');

select * from customers;
set SQL_SAFE_UPDATES = 0;
------------------------------------------------------
update customers set city='Chennai' where customer_id = 1;
delete from customers where city = 'Bangalore';

set SQL_SAFE_UPDATES = 1;
--------------------------------------------------------
create table Products
(
product_id INT PRIMARY KEY,
product_name VARCHAR(100),
category VARCHAR(50),
price DECIMAL(10,2),
stock_quantity INT,
supplier_city VARCHAR(50)
);

insert into Products values(1, 'Laptop', 'Electronics', 55000,10,'Hyderabad'),
(2, 'TV', 'Electronics', 60000, 20,'Coimbatore');

select * from Products;

update Products set price = 80000 where product_id = 1;
update Products set price = 80000 where product_name = 'TV';

delete from Products where product_id = 1;

drop table Products;
CREATE TABLE products
(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price DECIMAL(10,2),
    stock_quantity INT,
    supplier_city VARCHAR(30)
);

INSERT INTO products VALUES
(1,'Laptop','Electronics',55000,10,'Hyderabad'),
(2,'Mobile','Electronics',25000,25,'Bangalore'),
(3,'Printer','Electronics',18000,8,'Pune'),
(4,'Office Chair','Furniture',7500,15,'Mumbai'),
(5,'Desk','Furniture',12000,5,'Chennai'),
(6,'Notebook','Stationery',80,200,'Hyderabad'),
(7,'Pen','Stationery',20,500,'Delhi'),
(8,'Water Bottle','Accessories',500,50,'Bangalore');

select * from products;

select product_name, price from products;

select distinct category from products;
select * from products where category='Electronics';

select * from products where price>10000;
select * from products where stock_quantity < 20;

select * from products where category = 'Electronics'
and price > 20000;

select * from products where supplier_city='Hyderabad' or 
supplier_city='Bangalore';

select * from products where not category = 'Electronics';

select * from products where supplier_city in ('Hyderabad','Delhi');

select * from products where price between 500 and 20000;

select * from products where product_name like 'P%';

select * from products where product_name like '%k';

select * from products where product_name like '%top%';

select product_name AS Product, price AS ProductPrice
from products;

select * from products order by price;

select * from products order by price desc;

select count(*) from products;

select count(*) from products where category='Electronics';

select sum(price) from products;

select count(*) as TotalProducts,
sum(price) as TotalPrice,
avg(price) as AveragePrice,
max(price) as HighestPrice,
min(price) as LowestPrice
from products;

select category, count(*) as ProductCount
from products group by category;

select category, sum(price) as TotalPrice
from products group by category;










