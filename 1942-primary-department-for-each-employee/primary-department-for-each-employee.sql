# Write your MySQL query statement below
with tbl as(
    select employee_id, department_id
    from employee
    group by employee_id
    having count(*) = 1
)

(select * from tbl)
union
(select employee_id, department_id
from employee 
where primary_flag = 'Y')


