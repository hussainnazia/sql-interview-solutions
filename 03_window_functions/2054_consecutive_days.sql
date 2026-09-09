--Find all the users who were active for 3 consecutive days or more.

--Table
--sf_events

solution
with daily_activity as
(select distinct record_date, user_id from sf_events),

lagged as(
select record_date, user_id,
lag(record_date)
over(partition by user_id
order by record_date) as previous_date
from daily_activity
),
grouped as(
select  record_date, user_id,
sum(case
when previous_date is null
or record_date>previous_date+ interval '1 day'
then 1
else 0
end
)
over(partition by user_id
order by record_date) as grp
from lagged
)
select user_id
from grouped 
group by user_id, grp
having count(*)>=3
