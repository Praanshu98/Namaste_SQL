-- Note: please do not use any functions which are not taught in the class. you need to solve the questions only with the
-- concepts that have been discussed so far.

-- 1- write a query to get region wise count of return orders

select o.region, count(distinct o.order_id) as return_count
from orders o
join dbo.returns r on o.order_id = r.order_id
group by o.region

-- 2- write a query to get category wise sales of orders that were not returned

select o.category, sum(o.sales) as total_sales
from dbo.orders o
left join dbo.returns r on o.order_id = r.order_id
-- where r.order_id is null -- [Missing in my query]
group by o.category

-- 3- write a query to print dep name and average salary of employees in that dep .

select d.dep_id , avg(e.salary) as avg_salary
from dbo.employee e
join dbo.dept d on e.dept_id = d.dep_id
group by d.dep_id

-- 4- write a query to print dep names where none of the emplyees have same salary.

-- select * from dept
-- SELECT * from employee

select min(d.dep_name) -- , e.dept_id ,count(distinct salary) as 'distinct salary count' ,count(salary) as 'salary count'
from dbo.employee as e
left join dbo.dept as d on e.dept_id = d.dep_id
group by dept_id
having count(distinct salary) = count(salary)

-- 5- write a query to print sub categories where we have all 3 kinds of returns (others,bad quality,wrong items)

select * from [orders]
select * from [returns]

select o.sub_category -- ,count(distinct r.return_reason) as 'reason count'
from orders as o
join [returns] as r on o.order_id = r.order_id
group by o.sub_category
HAVING count(distinct r.return_reason) = 3

-- 6- write a query to find cities where not even a single order was returned.

select o.city -- ,count(distinct r.return_reason) as 'reason count'
from orders as o
left join [returns] as r on o.order_id = r.order_id
group by o.city
HAVING count(distinct r.return_reason) = 0

-- 7- write a query to find top 3 subcategories by sales of returned orders in east region

select distinct region from orders

select top 3 o.sub_category -- ,sum(o.sales) as  'total sales'
from orders as o
join [returns] as r on o.order_id = r.order_id
where o.region = 'East'
group by o.sub_category
order by sum(o.sales) desc

-- 8- write a query to print dep name for which there is no employee

select min(d.dep_name) as 'dept name'-- d.dep_id, COUNT(e.emp_id)
from employee as e
right join dept as d on e.dept_id = d.dep_id
group by d.dep_id
having COUNT(e.emp_id) = 0

-- 9- write a query to print employees name where dep id is not avaiable in dept table

-- select min(d.dep_name), d.dep_id, min(e.dept_id)
-- from employee as e
-- right join dept as d on e.dept_id = d.dep_id
-- group by d.dep_id -- , e.dept_id
-- having min(e.dept_id) is null

select e.*
from employee e 
left join dept d  on e.dept_id=d.dep_id
where d.dep_id is null;

-- 10-write a query to print emp name , their manager name and diffrence in their age for employees whose age is less then their manager's age 

select e.emp_name as employee, m.emp_name as manager, m.emp_age - e.emp_age -- , e.emp_id as employee_id, m.emp_id as manager_id, e.emp_age, m.emp_age
from dbo.employee e
inner join dbo.employee m on e.manager_id = m.emp_id
where e.emp_age < m.emp_age
-- order by manager_id

select *
from employee

-- 11-write a query to print emp name, manager name and senior manager name (senior manager is manager's manager)

select e.emp_id as e_id, m.emp_id as m_id, sm.emp_id as sm_id, e.emp_name as e_name, m.emp_name as m_name, sm.emp_name as sm_name
from employee e
join employee m on m.emp_id = e.manager_id
join employee sm on sm.emp_id = m.manager_id
order by e.emp_id, m.emp_id, sm.emp_id
