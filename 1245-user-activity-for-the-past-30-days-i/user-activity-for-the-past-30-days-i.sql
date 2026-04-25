# Write your MySQL query statement below
with tbl as(
    select distinct user_id, session_id, activity_date, activity_type
    from activity
)

select activity_date as day, count(distinct user_id) as active_users
from tbl
where datediff('2019-07-27',activity_date)<30 and activity_date<='2019-07-27'
group by activity_date
