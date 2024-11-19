# Write your MySQL query statement below
with duration as (
    select a1.machine_id, a1.process_id, (a2.timestamp - a1.timestamp) as time
    from Activity a1
    join Activity a2
    on a1.machine_id = a2.machine_id
    where a1.activity_type = "start" and a2.activity_type = "end"
)
select machine_id, round(avg(time),3) as processing_time
from duration
group by machine_id