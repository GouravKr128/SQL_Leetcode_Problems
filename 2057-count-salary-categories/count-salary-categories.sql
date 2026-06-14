# Write your MySQL query statement below
# Method 1 
SELECT 'Low Salary' AS category,
       COUNT(*) AS accounts_count
FROM Accounts
WHERE income < 20000

UNION

SELECT 'Average Salary' AS category,
       COUNT(*) AS accounts_count
FROM Accounts
WHERE income BETWEEN 20000 AND 50000

UNION

SELECT 'High Salary' AS category,
       COUNT(*) AS accounts_count
FROM Accounts
WHERE income > 50000;



/* Method 2

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

*/