create database retail_capstone_db;
use retail_capstone_db;

create table customers
(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(100),
city VARCHAR(50),
state VARCHAR(50),
gender VARCHAR(10),
membership_type VARCHAR(30)
);

CREATE TABLE products
(
product_id INT PRIMARY KEY,
product_name VARCHAR(100),
category VARCHAR(50),
price DECIMAL(10,2)
);

CREATE TABLE orders
(
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
order_status VARCHAR(30),

constraint fk_orders_customer
foreign key(customer_id)
references customers(customer_id)
);

CREATE TABLE order_items
(
item_id INT PRIMARY KEY,
order_id INT,
product_id INT,
quantity INT,

constraint fk_orderitems_orders
foreign key(order_id)
references orders(order_id),

constraint fk_items_product
foreign key(product_id) 
references products(product_id)
);

CREATE TABLE payments ( payment_id INT PRIMARY KEY, order_id INT, payment_mode VARCHAR(30), payment_status VARCHAR(30), amount DECIMAL(10,2), CONSTRAINT fk_payments_order FOREIGN KEY (order_id) REFERENCES orders(order_id) );

CREATE TABLE deliveries ( delivery_id INT PRIMARY KEY, order_id INT, delivery_partner VARCHAR(50), delivery_status VARCHAR(30), delivery_city VARCHAR(50), CONSTRAINT fk_deliveries_order FOREIGN KEY (order_id) REFERENCES orders(order_id) );

INSERT INTO customers VALUES
(1, 'Ravi Kumar', 'Hyderabad', 'Telangana', 'Male', 'Gold'),
(2, 'Priya Sharma', 'Chennai', 'Tamil Nadu', 'Female', 'Silver'),
(3, 'Arjun Reddy', 'Bangalore', 'Karnataka', 'Male', 'Gold'),
(4, 'Sneha Patel', 'Mumbai', 'Maharashtra', 'Female', 'Platinum'),
(5, 'Karthik Raj', 'Hyderabad', 'Telangana', 'Male', 'Silver'),
(6, 'Meera Nair', 'Kochi', 'Kerala', 'Female', 'Gold'),
(7, 'Vikram Singh', 'Delhi', 'Delhi', 'Male', 'Silver'),
(8, 'Ananya Das', 'Kolkata', 'West Bengal', 'Female', 'Gold'),
(9, 'Rahul Verma', 'Hyderabad', 'Telangana', 'Male', 'Platinum'),
(10, 'Pooja Iyer', 'Chennai', 'Tamil Nadu', 'Female', 'Silver');

INSERT INTO products VALUES
(101, 'iPhone 15', 'Electronics', 75000.00),
(102, 'Samsung TV', 'Electronics', 45000.00),
(103, 'Nike Shoes', 'Fashion', 5000.00),
(104, 'Levis Jeans', 'Fashion', 2500.00),
(105, 'Dell Laptop', 'Electronics', 65000.00),
(106, 'Office Chair', 'Furniture', 7000.00),
(107, 'Study Table', 'Furniture', 12000.00),
(108, 'Boat Headphones', 'Electronics', 3000.00),
(109, 'Puma T-Shirt', 'Fashion', 1500.00),
(110, 'Smart Watch', 'Electronics', 8000.00);


INSERT INTO orders VALUES
(1001, 1, '2026-01-05', 'Delivered'),
(1002, 2, '2026-01-08', 'Delivered'),
(1003, 3, '2026-01-10', 'Pending'),
(1004, 4, '2026-01-11', 'Cancelled'),
(1005, 5, '2026-01-15', 'Delivered'),
(1006, 1, '2026-01-18', 'Pending'),
(1007, 6, '2026-01-20', 'Delivered'),
(1008, 7, '2026-01-22', 'Shipped'),
(1009, 8, '2026-01-25', 'Delivered'),
(1010, 9, '2026-01-27', 'Cancelled'),
(1011, 10, '2026-02-01', 'Pending'),
(1012, 3, '2026-02-03', 'Delivered'),
(1013, 2, '2026-02-05', 'Delivered'),
(1014, 5, '2026-02-07', 'Shipped'),
(1015, 1, '2026-02-10', 'Pending');

INSERT INTO order_items VALUES
(1, 1001, 101, 1),
(2, 1001, 108, 2),
(3, 1002, 103, 1),
(4, 1002, 104, 2),
(5, 1003, 105, 1),
(6, 1003, 110, 1),
(7, 1004, 102, 1),
(8, 1005, 109, 3),
(9, 1005, 103, 1),
(10, 1006, 106, 1),
(11, 1007, 107, 1),
(12, 1007, 108, 2),
(13, 1008, 110, 1),
(14, 1009, 101, 1),
(15, 1010, 104, 2),
(16, 1011, 105, 1),
(17, 1012, 102, 1),
(18, 1013, 103, 2),
(19, 1014, 106, 1),
(20, 1015, 108, 3);

INSERT INTO payments VALUES
(5001, 1001, 'UPI', 'Successful', 81000.00),
(5002, 1002, 'Credit Card', 'Successful', 10000.00),
(5003, 1003, 'Net Banking', 'Pending', 73000.00),
(5004, 1004, 'UPI', 'Successful', 45000.00),
(5005, 1005, 'Debit Card', 'Successful', 9500.00),
(5006, 1006, 'UPI', 'Failed', 7000.00),
(5007, 1007, 'Credit Card', 'Successful', 18000.00),
(5008, 1008, 'UPI', 'Successful', 8000.00),
(5009, 1009, 'Net Banking', 'Successful', 75000.00),
(5010, 1010, 'Debit Card', 'Failed', 5000.00),
(5011, 1011, 'UPI', 'Pending', 65000.00),
(5012, 1012, 'Credit Card', 'Successful', 45000.00),
(5013, 1013, 'UPI', 'Successful', 10000.00),
(5014, 1014, 'Net Banking', 'Successful', 7000.00),
(5015, 1015, 'Debit Card', 'Pending', 9000.00);


INSERT INTO deliveries VALUES
(7001, 1001, 'BlueDart', 'Delivered', 'Hyderabad'),
(7002, 1002, 'DTDC', 'Delivered', 'Chennai'),
(7003, 1003, 'Delhivery', 'Pending', 'Bangalore'),
(7004, 1004, 'Ecom Express', 'Cancelled', 'Mumbai'),
(7005, 1005, 'BlueDart', 'Delivered', 'Hyderabad'),
(7006, 1006, 'DTDC', 'Pending', 'Hyderabad'),
(7007, 1007, 'Delhivery', 'Delivered', 'Kochi'),
(7008, 1008, 'BlueDart', 'Shipped', 'Delhi'),
(7009, 1009, 'Ecom Express', 'Delivered', 'Kolkata'),
(7010, 1010, 'DTDC', 'Cancelled', 'Hyderabad'),
(7011, 1011, 'Delhivery', 'Pending', 'Chennai'),
(7012, 1012, 'BlueDart', 'Delivered', 'Bangalore'),
(7013, 1013, 'DTDC', 'Delivered', 'Chennai'),
(7014, 1014, 'Ecom Express', 'Shipped', 'Hyderabad'),
(7015, 1015, 'BlueDart', 'Pending', 'Hyderabad');

-- BASIC QUERIES

select * from customers;

select customer_name, city, membership_type from customers;

select * from products order by price desc; 

select * from customers where city = 'Hyderabad';

select * from customers where membership_type = 'Gold';

select * from products where price between 500 and 5000;

select * from products where category in('Electronics','Fashion');

select * from orders where order_date > '2026-01-01';

select * from payments where payment_mode = 'UPI';

select * from deliveries where delivery_status = 'Pending';


-- AGGREGATE QUERIES

select count(*) as TotalCustomers from customers;

select count(*) as TotalOrders from orders;

select count(*)  as TotalProducts from products;

select sum(amount) as TotalRevenue from payments where payment_status='Successful';

select avg(amount) as AverageAmount from payments;

select max(amount) as HighestAmount from payments;

select min(amount) as LowestAmount from payments;

select city, count(*) as NumberOfCustomers from customers
group by city;

select category, count(*) as ProductCount from products
group by category;

select order_status, count(*) as OrderCount from orders
group by order_status;

-- JOINS

select c.customer_name,o.order_id,o.order_date
from customers c inner join orders o
on c.customer_id = o.customer_id;

select o.order_id, p.product_name,o.quantity,p.price
from order_items o inner join products p
on o.product_id = p.product_id;

select c.customer_name,
p.product_name,
oi.quantity,
o.order_date
from customers c join orders o
on c.customer_id = o.customer_id
join order_items oi
on o.order_id = oi.order_id
join products p
on oi.product_id = p.product_id;

select o.order_id,
p.payment_mode,
p.payment_status,
p.amount
from orders o join payments p
on o.order_id = p.order_id;

select o.order_id,
d.delivery_partner, d.delivery_status
from orders o join deliveries d
on o.order_id = d.order_id;

select
c.customer_name, c.city,
o.order_id, o.order_date,
p.product_name,p.category,
oi.quantity, p.price, pa.payment_status, d.delivery_status
from customers c join orders o
on c.customer_id = o.customer_id
join order_items oi
on o.order_id = oi.order_id
join products p
on oi.product_id = p.product_id
join payments pa
on o.order_id = pa.order_id
join deliveries d
on o.order_id = d.order_id;


-- GROUP BY & HAVING

select c.city, sum(p.amount) as TotalRevenue
from customers c join orders o
on c.customer_id = o.customer_id
join payments p
on o.order_id = p.order_id
where p.payment_status = 'Successful'
group by c.city;

select
c.customer_name, sum(p.amount) as TotalRevenue
from customers c join orders o
on c.customer_id = o.customer_id
join payments p
on o.order_id = p.order_id
where p.payment_status = 'Successful'
group by c.customer_name;

select p.product_name, sum(o.quantity) as TotalQuantitySold
from products p join order_items o
on p.product_id = o.product_id
group by p.product_name;


SELECT p.category,
       SUM(p.price * oi.quantity) AS total_revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.category;

select c.customer_id, c.customer_name, count(*) as NumberOfOrders
from customers c join orders o
on c.customer_id = o.customer_id
group by c.customer_id;

select c.customer_id, c.customer_name, count(*) as NumberOfOrders
from customers c join orders o
on c.customer_id = o.customer_id
group by c.customer_id
having count(*)>1;

select p.category, sum(p.price * i.quantity) as TotalRevenue
from products p join order_items i
on p.product_id = i.product_id
group by p.category
having sum(p.price * i.quantity) > 10000;


select city, count(*) as TotalCustomers
from customers group by city having count(*)>2;

select p.product_id, p.product_name, sum(o.quantity) as ProductsSold
from products p join order_items o
on p.product_id = o.product_id
group by p.product_id, p.product_name
having sum(o.quantity)>3;

-- SUBQUERIES

select customer_name from customers where customer_id in
( select customer_id from orders);

select customer_name from customers where customer_id not in
(select customer_id from orders);

select product_id, product_name from products where product_id not in
(select product_id from order_items);

select order_id,amount from payments where amount >
(select avg(amount) from payments);


select c.customer_id, c.customer_name, p.amount
from customers c join orders o
on c.customer_id = o.customer_id
join payments p
on o.order_id = p.order_id
where p.amount = 
(select max(amount) from payments);


SELECT product_id,
       product_name,
       price
FROM products
WHERE price >
(
    SELECT AVG(price)
    FROM products
);


SELECT DISTINCT c.customer_id,
                c.customer_name
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
WHERE oi.product_id IN
(
    SELECT product_id
    FROM products
    WHERE category = 'Electronics'
);


SELECT order_id
FROM orders
WHERE order_id IN
(
    SELECT order_id
    FROM payments
    WHERE payment_status = 'Successful'
);


SELECT order_id
FROM orders
WHERE order_id IN
(
    SELECT order_id
    FROM deliveries
    WHERE delivery_status != 'Delivered'
);


SELECT c.customer_id,
       c.customer_name,
       SUM(p.amount) AS total_spending
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN payments p
ON o.order_id = p.order_id
WHERE p.payment_status = 'Successful'
GROUP BY c.customer_id, c.customer_name
HAVING SUM(p.amount) >
(
    SELECT AVG(customer_total)
    FROM
    (
        SELECT SUM(amount) AS customer_total
        FROM payments p
        JOIN orders o
        ON p.order_id = o.order_id
        WHERE p.payment_status = 'Successful'
        GROUP BY o.customer_id
    ) AS avg_spending
);

-- DATA QUALITY CHECKS

SELECT order_id
FROM orders
WHERE order_id NOT IN
(
    SELECT order_id
    FROM payments
);

SELECT order_id
FROM orders
WHERE order_id NOT IN
(
    SELECT order_id
    FROM deliveries
);

SELECT *
FROM payments
WHERE amount IS NULL
OR amount = 0;


SELECT o.order_id,
       o.order_status,
       p.payment_status
FROM orders o
JOIN payments p
ON o.order_id = p.order_id
WHERE o.order_status = 'Cancelled'
AND p.payment_status = 'Successful';

SELECT o.order_id,
       d.delivery_status,
       p.payment_status
FROM orders o
JOIN deliveries d
ON o.order_id = d.order_id
JOIN payments p
ON o.order_id = p.order_id
WHERE d.delivery_status = 'Delivered'
AND p.payment_status = 'Failed';

SELECT *
FROM order_items
WHERE product_id NOT IN
(
    SELECT product_id
    FROM products
);

SELECT *
FROM orders
WHERE customer_id NOT IN
(
    SELECT customer_id
    FROM customers
);
