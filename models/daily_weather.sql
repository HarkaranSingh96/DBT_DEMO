with daily_weather as (

select 
try_to_number(clouds),
date(time) as daily_weather,
weather,
temp,
pressure,
humidity


from {{ source('demo', 'weather') }} 



),

daily_weather_agg as (

select daily_weather,
avg(weather),
avg(temp),
avg(pressure),
avg(humidity)

from daily_weather

group by daily_weather, weather

qualify row_number() over(partition by daily_weather order by count(weather) desc) = 1


)

select * from daily_weather_agg