# Write your MySQL query statement below
with sum as (
    select turn, 
    sum(weight) over (order by turn) as total_weight
    from Queue
)

select q.person_name
from Queue q
join sum s
on q.turn = s.turn
where s.total_weight <= 1000
order by s.total_Weight desc limit 1