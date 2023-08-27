-- ddl crete table , alter table drop table
-- dmls --inserts, delete updates
-- dql -> select 
select *
from orders;

select order_date,product_name,order_id
from orders;

select top 5 order_date,order_id
from orders;

select * 
from orders
order by order_date desc,customer_id 

select top 10 * 
from orders
order by order_date desc ;

-- from 
-- select 
-- order by
-- top 


-- where clause
select order_id,order_date,category,sales 
from orders
where category='Furniture';

select order_id,order_date,category,sales 
from orders
where category in ('Furniture','Technology');


select order_id,order_date,category,sales ,quantity
from orders
where quantity!=3;


select order_id,order_date,category,sales ,quantity
from orders
where quantity in (4,5,6,7,8);


select order_id,order_date,category,sales ,quantity
from orders
where quantity between 4 and 8;

select distinct category
from orders;

select distinct quantity
from orders
where quantity between 4 and 8
order by quantity;

select order_id,order_date,category,sales ,quantity
from orders
where quantity not between 4 and 8;


select order_id,order_date,category,sales 
from orders
where category not in ('Furniture','Technology');

-- not , !

select order_id,order_date,category,sales 
from orders
where order_date = '2019-10-11';


select order_id,order_date,category,sales 
from orders
where order_date between '2020-01-01' and '2020-01-31'
order by order_date ;

select order_id,order_date,category,segment,sales 
from orders
where category='Furniture' and segment='Consumer';

select order_id,order_date,category,segment,sales 
from orders
where category='Furniture' or category='Technology';


select order_id,order_date,category,segment,sales ,quantity
from orders
where (category='Furniture' and quantity between 3 and 5) 
or (order_date between '2020-01-01' and '2020-01-31' and segment='Consumer');

select order_id,order_date,category,sales 
from orders
where order_date between '2020-01-01' and '2020-01-31';

select * from orders
where postal_code=NULL;

-- update orders set postal_code = null where row_id in (3,5,7)

-- update orders set city = null where row_id in (1,5,7)
select * from orders 
where city is not null and quantity=3;

select order_id,customer_name,order_date,quantity
from orders
where customer_name like '%ab%' ;


select order_id,customer_name,order_date,quantity
from orders
where customer_name like 'm_t%' ;


select order_id,customer_name,order_date,quantity
from orders
where customer_name not like '%e_g%' ;


select order_id,customer_name,order_date,quantity
from orders
where customer_name like '%e[i apq][anc]g%' ;


select order_id,customer_name,order_date,quantity
from orders
where customer_name not like '%e[^ ]g%' ;



select order_id,customer_name,order_date,quantity
from orders
where customer_name not like '%e[a-d]g%' ;



select order_id,customer_name,order_date,quantity
from orders
where customer_name like 'a[a-f]%' ;

where customer_name like '%a%a%';


-- from
-- where 
-- select distinct 
-- order by
-- top 




