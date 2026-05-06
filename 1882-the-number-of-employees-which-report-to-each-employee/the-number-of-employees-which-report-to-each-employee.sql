# Write your MySQL query statement below   
with tbl as( 
    select reports_to, count(employee_id) as 'reports_count', round(avg(age)) as 'average_age'
    from employees
    where reports_to is not null
    group by reports_to
)

select t.reports_to as employee_id, e.name, reports_count, average_age
from tbl t
inner join employees e
on t.reports_to = e.employee_id
order by employee_id