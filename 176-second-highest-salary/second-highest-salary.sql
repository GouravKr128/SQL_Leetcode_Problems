# Write your MySQL query statement below
 
 select max(salary) as SecondHighestSalary
 from employee 
 where salary<(select max(salary) from employee)


/* 
with tbl as(
select id,salary,
dense_rank() over(order by salary desc) as rnk
from employee
)

select max(salary) as SecondHighestSalary
from tbl
where rnk=2
*/

/* 
with tbl as(
select id,salary,
dense_rank() over(order by salary desc) as rnk
from employee
)
select distinct 
case when count(*) =0 then null else salary end as SecondHighestSalary
from tbl
where rnk=2
*/
