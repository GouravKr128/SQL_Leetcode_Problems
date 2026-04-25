# Write your MySQL query statement below
with tbl as(
select num
from mynumbers
group by num
having count(num) = 1)

select max(num) as num
from tbl

/*
with tbl as(
select num
from mynumbers
group by num
having count(num) = 1)

select 
case 
    when count(*) = 0 then null
    else max(num)
end as num
from tbl
*/