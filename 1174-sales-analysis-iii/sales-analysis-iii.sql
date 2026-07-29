# Write your MySQL query statement below
with tbl as(
    (select distinct product_id 
    from sales 
    where sale_date between '2019-01-01' and '2019-03-31')
    except
    (select distinct product_id 
    from sales
    where sale_date not between '2019-01-01' and '2019-03-31')
)

select p.product_id, product_name
from product p
inner join tbl t
on p.product_id = t.product_id