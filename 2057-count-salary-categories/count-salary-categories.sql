# Write your MySQL query statement below
with tbl1 as(
select *, case 
    when income<20000 then 'Low Salary'
    when income>50000 then 'High Salary'
    else 'Average Salary'
    end as 'category'
from Accounts
),
tbl2 as(
    (select 'Low Salary' as 'category', 0 as 'accounts_count')
    union
    (select 'High Salary' as 'category', 0 as 'accounts_count')
    union
    (select 'Average Salary' as 'category', 0 as 'accounts_count')
)

(select category, count(account_id) as accounts_count
from tbl1
group by category)
union
(select * from tbl2
where category not in (select distinct category from tbl1) )