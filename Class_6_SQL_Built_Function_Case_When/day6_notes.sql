select *
from employee
group by dept_id

100, ankit,mohit ,vikas,rohit

select dept_id, string_agg(emp_name,',') within group (order by emp_name) as emp_names, string_agg(salary,',') within group (order by emp_name) as emp_sal
from employee
group by dept_id;

--100 , ankit,mohit,vikas,rohit
--date functions---
select row_id,order_id,order_date,ship_date--,profit,sales,profit/sales as ratio
--,order_date-ship_date as days_it
,FORMAT(order_date,'yyyyM') as my_order
,DATENAME(month,order_date) order_month
,datediff(day,order_date,ship_date) as date_diff
,datediff(week,order_date,ship_date) as date_diff_week
,datepart(year,order_date) as order_year
,datepart(month,order_date) as order_month
,datepart(week,order_date) as order_week
,dateadd(day,5,order_date) as order_date_5
,dateadd(year,-5,order_date) as order_date_5_year
,dateadd(day,row_id,order_date) as order_date_add_months
,dateadd(week,row_id,order_date) as order_date_add_months
,GETDATE() as current_day
from orders
--where FORMAT(order_date,'yyyyM') = '202011'
where datepart(year,order_date)=2020 and datepart(month,order_date)=11
--where order_date between '2020-01-01' and '2020-12-31'
;

select order_id,customer_name,state
,replace(customer_name,'te','fm') as cust_replace
,len(customer_name) as len_customer
,left(customer_name,4) as left4_cust
,right(customer_name,3) as left4_cust
,SUBSTRING(customer_name,3,4) as cust_34
,CHARINDEX('a',customer_name) as a_position
,upper(customer_name) as u_cust
,lower(customer_name) as u_cust
,SUBSTRING(customer_name,2,len(customer_name)-2) as middle_cust
,concat(order_id,' ',customer_name) as concat_id_name
, order_id+' '+customer_name as concat_id_name
--,order_id + sales as id_sales
from orders
---case 
split_part(email_id,'@',1)
split_part(email_id,'@',2)
ankit@gmail.com

ankit , bansal
a,nkit,b,ansal
Ankit Bansal

---case when 

select order_id,profit,sales
,case
when profit<0 then 'loss'
when profit<=50 then 'low profit'
when profit<=100 then 'medium profit'
when profit<=150 then 'high profit'
else 'very high profit'
end as profit_grouping
from orders;

select order_id,profit,sales
,case
when profit<0 then 'loss'
when profit between 51 and 100 then 'medium profit'
when profit between 0 and 50 then 'low profit'
when profit between 101 and 150  then 'high profit'
else 'very high profit'
end as profit_grouping
from orders
order by profit_grouping

select case
when profit<0 then 'loss'
when profit between 51 and 100 then 'medium profit'
when profit between 0 and 50 then 'low profit'
when profit between 101 and 150  then 'high profit'
else 'very high profit'
end as profit_grouping
,sum(profit) as total_profit
from orders
group by
case
when profit<0 then 'loss'
when profit between 51 and 100 then 'medium profit'
when profit between 0 and 50 then 'low profit'
when profit between 101 and 150  then 'high profit'
else 'very high profit'
end
order by profit_grouping


profit_grouping
profit<0 -> loss
profit<50 -> low profit
profit<100 -> medium profit
profit<150 -> high profit
-> very high profit





ankit
5-2
nki



















