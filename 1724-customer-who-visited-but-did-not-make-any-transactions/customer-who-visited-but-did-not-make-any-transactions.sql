# Write your MySQL query statement below
select customer_id , count(visit_id) as 'count_no_trans'
from visits
where visit_id not in (select distinct visit_id from transactions)
group by customer_id 

/*
select v.customer_id, count(v.visit_id) as count_no_trans
from visits v
left join transactions t
on v.visit_id = t.visit_id
where t.transaction_id is null
group by v.customer_id
*/
