use Namaste_SQL;

-- 1- write a update statement to update city as null for order ids :  CA-2020-161389 , US-2021-156909

UPDATE dbo.orders
set city = null
where order_id in ('CA-2020-161389' , 'US-2021-156909');

SELECT * from orders where order_id in ('CA-2020-161389','US-2021-156909')

-- 2- write a query to find orders where city is null (2 rows)

SELECT * from orders where city is null;

-- 3- write a query to get total profit, first order date and latest order date for each category

select sum(profit), min(order_date), max(order_date)
from orders
group by category

-- 4- write a query to find sub-categories where average profit is more than the half of the max profit in that sub-category

select sub_category
from orders
group by sub_category
having avg(profit) > max(profit) * 0.5

-- 5- create the exams table with below script;
create table exams (student_id int, subject varchar(20), marks int);

insert into exams values (1,'Chemistry',91),(1,'Physics',91),(1,'Maths',92)
,(2,'Chemistry',80),(2,'Physics',90)
,(3,'Chemistry',80),(3,'Maths',80)
,(4,'Chemistry',71),(4,'Physics',54)
,(5,'Chemistry',79);

select * from exams

-- write a query to find students who have got same marks in Physics and Chemistry.

select student_id, marks -- ,exams.subject
from exams
where exams.subject in ('Physics', 'Chemistry')
group by marks, student_id
having count(student_id) > 1

-- 6- write a query to find total number of products in each category.

-- select category, product_id, count(product_id) as product_count
-- from orders
-- group by category, product_id
-- order by category, product_id
-- Above was my query and was wrong

select category,count(distinct product_id) as no_of_products
from orders
group by category

-- 7- write a query to find top 5 sub categories in west region by total quantity sold

select top 5 sub_category, sum(quantity) as total_quantity
from orders
where region = 'West'
group by sub_category
order by total_quantity desc

-- 8- write a query to find total sales for each region and ship mode combination for orders in year 2020

select region, ship_mode, round(sum(sales), 2) as total_sales
from orders
where YEAR(order_date) = '2020'
group by region, ship_mode
order by region, ship_mode