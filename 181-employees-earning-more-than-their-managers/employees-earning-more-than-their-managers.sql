# Write your MySQL query statement below
with tbl as(
    select e.id, e.name as employee, e.salary as e_salary, e.managerid, m.salary as m_salary
    from employee e
    inner join employee m
    on e.managerid = m.id
)

select employee 
from tbl
where e_salary>m_salary
