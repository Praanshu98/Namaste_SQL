--data definition language DDL
create table amazon_orders
(
order_id integer, 
order_date date,
amount decimal(6,2),
product_name varchar(100),
customer_id varchar(20),
payment_mode varchar(10)
);

--delete table
--drop table amazon_orders
alter table


--DML -> data manipulation language
insert into amazon_orders values(1,'2023-07-25',3999.9,'baybee', 'ankitbansal6','UPI');
insert into amazon_orders values(2,'2023-07-25',5000,'baybee', 'rahulbansal','Credit');




insert into amazon_orders values('ank','2023-07-25',5000,'baybee', 'rahulbansal','Credit')

delete from amazon_orders where order_id=1;

update amazon_orders set payment_mode='Credit'
where order_id=2

--DQL -> data query language
select * 
from amazon_orders

select order_id,order_date,amount 
from amazon_orders
where order_id = 1

select *
from amazon_orders
order by amount desc



--data types 
whole number -> integer
date - > date
decimal(6,2)
13456.98
bigint
string - > varchar(100)