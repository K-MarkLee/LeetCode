# Write your MySQL query statement below
select distinct num as ConsecutiveNums
from 
(select num, lead(num, 1) over (order by id)as next, lead(num,2) over (order by id) as next2
 from Logs) as nums
 where num = next and next = next2