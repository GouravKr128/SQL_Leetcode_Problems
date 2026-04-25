# Write your MySQL query statement below
with tbl as (
select sale_id, product_id, year, quantity,price,
dense_rank() over(partition by product_id order by year asc) as 'year_rnk'
from sales
)

select product_id, year as first_year, quantity, price
from tbl
where year_rnk=1