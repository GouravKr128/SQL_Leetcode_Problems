# Write your MySQL query statement below
with tbl as(
select id,salary,
dense_rank() over(order by salary desc) as rnk
from employee
)
select distinct 
case when count(*) =0 then null else salary end as SecondHighestSalary
from tbl
where rnk=2
