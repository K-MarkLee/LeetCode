# Write your MySQL query statement below
with Userrating as (
    select u.name as name, count(*) as count
    from Users u
    join MovieRating m
    on u.user_id = m.user_id
    group by u.name
),
Movierating as (
    select m.title as movie, avg(mr.rating) as average
    from Movies m
    join MovieRating mr
    on m.movie_id = mr.movie_id
    where date_format(created_at,'%Y-%m') = "2020-02"
    group by title
),

Userresult as(
select name  as results
from Userrating
where count = (select max(count) from Userrating)
order by name
limit 1
),


Movieresult as(
select movie as results
from Movierating
where average = (select max(average) from Movierating)
order by movie
limit 1
)

select results from Userresult
union all
select results from Movieresult