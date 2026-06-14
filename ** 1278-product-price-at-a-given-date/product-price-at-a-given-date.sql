# Write your MySQL query statement below
with tbl as(
select product_id, new_price, change_date, row_number() over(
    partition by product_id order by change_date desc
) as 'rnk'
from products
where change_date <= '2019-08-16'
)


(
    select product_id, new_price as 'price'
    from tbl
    where rnk = 1
)
union
(
    select product_id, 10 as 'price'
    from products
    where product_id not in (select distinct product_id from tbl)
)



