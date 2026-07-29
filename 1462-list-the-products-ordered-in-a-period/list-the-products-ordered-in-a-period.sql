# Write your MySQL query statement below
with tbl as(
select product_id, sum(unit) as 'unit'
from orders o
where year(order_date)='2020' and month(order_date) = '02'
group by product_id
having sum(unit)>99
)

select p.product_name, unit
from tbl
inner join products p
on p.product_id = tbl.product_id
