# Write your MySQL query statement below
# Method 3
select id, 
    CASE 
        WHEN id % 2 = 0 THEN LAG(student) OVER(order by id) 
        ELSE COALESCE(LEAD(student) OVER(order by id), student)
    END AS student
from Seat

/* Method 2

with tbl as (
select *, lag(student) over() as d, lead(student) over() as u
from seat
)

select id, case
    when id%2 !=0 and id = (select max(id) from seat) then student
    when id%2 !=0 then u
    else d
    end as student
from tbl
order by id asc

*/

/* Method 1

with tbl as(
(select id+1 as id, student from seat where id%2!=0
and id != (select count(*) from seat))
union
(select * from seat where id%2!=0
and id = (select count(*) from seat))
union
(select id-1 as id, student from seat where id%2=0)
)

select * 
from tbl
order by id asc

*/




