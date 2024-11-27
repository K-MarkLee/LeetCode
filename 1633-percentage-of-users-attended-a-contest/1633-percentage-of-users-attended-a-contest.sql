# Write your MySQL query statement below
with total as (
    select count(*) as total
    from Users
),
contest as (
    select contest_id, count(user_id) as contest_registered
    from Register
    group by contest_id
),
percentage as (
    select c.contest_id, round((c.contest_registered * 100)/ t.total , 2) as percentage
    from contest c 
    cross join total t
)
select contest_id, percentage
from percentage
order by percentage desc, contest_id asc