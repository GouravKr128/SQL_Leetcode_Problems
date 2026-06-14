# Write your MySQL query statement below
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





