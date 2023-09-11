-- Run the following command to add and update dob column in employee table
-- alter table  employee add dob date;
-- update employee set dob = dateadd(year,-1*emp_age,getdate())

-- 1- write a query to print emp name , their manager name and diffrence in their age (in days) 
-- for employees whose year of birth is before their managers year of birth

select e.emp_id, e.emp_name, m.emp_id as 'manager_id', m.emp_name, m.dob, e.dob ,abs(DATEDIFF(DAY, m.dob, e.dob)) as diff_in_days
from employee e
join employee m on e.manager_id = m.emp_id
where DATEDIFF(DAY, m.dob, e.dob) < 0

-- 2- write a query to find subcategories who never had any return orders in the month of november (irrespective of years)

select o.sub_category
from orders o
left join [returns] r on o.order_id = r.order_id
where r.order_id is null and MONTH(o.order_date) = 11
group by o.sub_category

-- 3- orders table can have multiple rows for a particular order_id when customers buys more than 1 product in an order.
-- write a query to find order ids where there is only 1 product bought by the customer.

select 
    o.order_id
    ,count(o.order_id) as count_of_product_in_order
from 
    orders o
group by 
    o.order_id
having 
    count(o.order_id) = 1

-- 4- write a query to print manager names along with the comma separated list(order by emp salary) of all employees directly reporting to him.

SELECT
    m.emp_name
    ,STRING_AGG(e.emp_name, ',') within GROUP (order by e.salary) as 'employees-reporting-directly'
from 
    employee e
JOIN
    employee m on e.manager_id = m.emp_id
group by
    m.emp_name

-- 5- write a query to get number of business days between order_date and ship_date (exclude weekends). 
-- Assume that all order date and ship date are on weekdays only

-- SELECT
--     o.order_date
--     ,o.ship_date
--     ,DATEDIFF(DAY, o.order_date, o.ship_date)
-- from
--     orders o

select order_id,order_date,ship_date ,datediff(day,order_date,ship_date)-2*datediff(week,order_date,ship_date) as no_of_business_days
from 
orders

-- 6- write a query to print 3 columns : category, total_sales and (total sales of returned orders)

SELECT
    o.category
    -- ,round(sum(o.sales), 2) as 'total_sales'
    ,round(sum(o.sales), 2) as 'total_sales'
    ,round(sum(CASE
        when r.order_id is not null then o.sales
        else 0
    end), 2) as 'total_returned_order_sales'
from 
    orders o
left join 
    [returns] r on r.order_id = o.order_id
group by  
    o.category

-- 7- write a query to print below 3 columns
-- category, total_sales_2019(sales in year 2019), total_sales_2020(sales in year 2020)

SELECT
    o.category
    ,round(
        sum(
            case
                when YEAR(o.order_date) = '2019' then o.sales
            end
            )
        ,2) as 'total_sales_2019'
    ,round(
        sum(
            case
                when YEAR(o.order_date) = '2020' then o.sales
            end
            )
        ,2) as 'total_sales_2020'
from
    orders o
group by
    o.category

-- 8- write a query print top 5 cities in west region by average no of days between order date and ship date.

SELECT
top 5
    o.city
    , AVG(DATEDIFF(DAY, o.order_date, o.ship_date)) as 'avg_days_order_to_ship'
from 
    orders o
where
    o.region = 'west'
group by
    o.city
order by
    AVG(DATEDIFF(DAY, o.order_date, o.ship_date)) desc

-- 9- write a query to print customer name and no of occurence of character 'n' in the customer name.
-- customer_name , count_of_occurence_of_n

SELECT
    o.customer_name
    -- ,len(o.customer_name)
    , len(o.customer_name) - len(REPLACE(o.customer_name, 'n', '')) as 'count_of_occurence_of_n'
from
    orders o
where
    o.customer_id LIKE '%n%'

-- 10- write a query to print first name and last name of a customer using orders table(everything after first space can be considered as last name)
-- customer_name, first_name,last_name

SELECT
    o.customer_name
    , left(o.customer_name, CHARINDEX(' ', o.customer_name)) as 'first_name'
    , RIGHT(o.customer_name, len(o.customer_name) - CHARINDEX(' ', o.customer_name)) as 'last_name'
FROM
    orders o
