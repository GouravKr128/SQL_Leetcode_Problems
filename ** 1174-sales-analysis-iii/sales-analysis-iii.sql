# Write your MySQL query statement below

SELECT p.product_id, p.product_name
FROM Product AS p
JOIN Sales AS s
ON p.product_id = s.product_id
GROUP BY p.product_id
HAVING MIN(s.sale_date) >= '2019-01-01' AND MAX(s.sale_date) <= '2019-03-31';

/*
Method 2

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

*/