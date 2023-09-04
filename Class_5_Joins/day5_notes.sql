create table exams (student_id int, subject varchar(20), marks int);

insert into exams values (1,'Chemistry',91),(1,'Physics',91),(1,'Maths',92)
,(2,'Chemistry',80),(2,'Physics',80)
,(3,'Chemistry',80),(3,'Maths',80)
,(4,'Chemistry',71),(4,'Physics',54)
,(5,'Chemistry',79);

select student_id,count(*) as no_of_subject, count(distinct marks) as distinct_marks
from exams
where subject in ('Chemistry','Physics')
group by student_id
having count(*) = 2 and count(distinct marks) = 1


--write a query to find students who have got same marks in Physics and Chemistry.
select *
from exams
where subject in ('Chemistry','Physics')

select student_id,marks, count(*) as grp_cnt
from exams
where subject in ('Chemistry','Physics')
group by student_id,marks
having count(*)=2;
----------------------------------join--------------
select * from orders;
select * from returns;

select --o.order_id,o.order_date,o.sales,r.return_reason
o.*,r.return_reason
from orders o
inner join returns r on o.order_id=r.order_id
where return_reason='Bad Quality'


select --o.order_id,o.order_date,o.sales,r.return_reason
o.*,r.return_reason
from orders o
inner join returns r on o.order_id=r.order_id


select o.order_id,o.order_date,o.sales,r.return_reason,r.order_id
--o.*,r.return_reason
from orders o
left join returns r on o.order_id=r.order_id


select 8- top 2 6- r.return_reason, sum(o.sales) as return_sales
1 - from orders o
2- left join returns r on o.order_id=r.order_id
3- where o.category='Furniture'
4- group by r.return_reason
5 --having
7- order by r.return_reason
---
create table employee(
    emp_id int,
    emp_name varchar(20),
    dept_id int,
    salary int,
    manager_id int,
    emp_age int
);


insert into employee values(1,'Ankit',100,10000,4,39);
insert into employee values(2,'Mohit',100,15000,5,48);
insert into employee values(3,'Vikas',100,10000,4,37);
insert into employee values(4,'Rohit',100,5000,2,16);
insert into employee values(5,'Mudit',200,12000,6,55);
insert into employee values(6,'Agam',200,12000,2,14);
insert into employee values(7,'Sanjay',200,9000,2,13);
insert into employee values(8,'Ashish',200,5000,2,12);
insert into employee values(9,'Mukesh',300,6000,6,51);
insert into employee values(10,'Rakesh',500,7000,6,50);
select * from employee;

create table dept(
    dep_id int,
    dep_name varchar(20)
);
insert into dept values(100,'Analytics');
insert into dept values(200,'IT');
insert into dept values(300,'HR');
insert into dept values(400,'Text Analytics');
select * from dept;
select * from employee


select e.* ,d.dep_name,d.dep_id
from employee e
right join dept d on e.dept_id=d.dep_id


select e.* ,d.dep_name,d.dep_id
from dept d
left join employee e on e.dept_id=d.dep_id

select e.* ,d.dep_name,d.dep_id
from employee e
full join dept d on e.dept_id=d.dep_id

--full outer join -> inner join + extra records in left table + extra records in right table

--cross join 
select e.* ,d.dep_name,d.dep_id
from employee e
cross join dept d 

select e.* ,d.dep_name,d.dep_id
from employee e
inner join dept d on 1=2

select e.* ,d.dep_name,d.dep_id
from employee e
full join dept d on e.dept_id=d.dep_id
where 1=2


--self join 

select e.emp_id, e.emp_name, e.salary as emp_salary, m.emp_name as manager_name , m.salary as manager_salary
from employee e
inner join employee m on e.manager_id=m.emp_id
where e.salary > m.salary

select --o.order_id,o.order_date,o.sales,r.return_reason
o.*,r.return_reason,p.manager
from orders o
left join returns r on o.order_id=r.order_id
left join people p on p.region=o.region

select * from people

create table people
(
manager varchar(20),
region varchar(10)
)

insert into people
values ('Ankit','West')
,('Deepak','East')
,('Vishal','Central')
,('Sanjay','South')

select --o.order_id,o.order_date,o.sales,r.return_reason
o.*,r.return_reason
from orders o,returns r
where o.order_id=r.order_id

select * 
from orders
where 1=2

