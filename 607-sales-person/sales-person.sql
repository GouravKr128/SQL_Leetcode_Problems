# Write your MySQL query statement below
with tbl as(
select distinct o.sales_id
from orders o
inner join company c
on o.com_id=c.com_id and c.name = 'RED'
)

select name
from salesperson
where sales_id not in (select sales_id from tbl)


