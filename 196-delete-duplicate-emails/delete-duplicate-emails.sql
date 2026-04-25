# Write your MySQL query statement below
with tbl as(
    select min(id) as id,email
    from person 
    group by email
)
delete 
from person 
where (id,email) not in (select id,email from tbl)