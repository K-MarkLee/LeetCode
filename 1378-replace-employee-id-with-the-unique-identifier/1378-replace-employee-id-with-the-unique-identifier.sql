# Write your MySQL query statement below
select
case 
    when u.id is not null 
    then u.unique_id
    else null
end as unique_id,
e.name
from Employees e
left join EmployeeUNI u
on e.id = u.id