# Write your MySQL query statement below
with tbl as(
select *, sum(weight) over(order by turn asc rows between unbounded preceding and current row) as "cum_sum"
from queue
order by turn asc
)

select person_name
from tbl
where cum_sum <= 1000
order by cum_sum desc
limit 1