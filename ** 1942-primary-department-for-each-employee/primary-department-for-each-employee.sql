# Write your MySQL query statement below

-- Method 2 
with tbl as(
    select employee_id, department_id, primary_flag, 
    count(*) over(partition by employee_id) as 'num'
    from employee
)


select employee_id, department_id
from tbl
where primary_flag = 'Y' or num=1

/*
-- Method 1
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
*/

