with cte as (

select 
start_time,
to_timestamp('5/9/2022 11:09', 'DD/MM/YY HH:MI') as time_started,
date(to_timestamp('5/9/2022 11:09', 'DD/MM/YY HH:MI')) as date_started_at,
Hour(to_timestamp('5/9/2022 11:09', 'DD/MM/YY HH:MI')) as hour_started_at,
Dayname(to_timestamp('5/9/2022 11:09', 'DD/MM/YY HH:MI')) as Day_name,


case when Dayname(to_timestamp('5/9/2022 11:09', 'DD/MM/YY HH:MI')) in ('Mon')
then 'Weekday'
else 'Business day'
end as day_type

from 
{{ source('demo', 'bike') }}


)

select * 
from cte 




