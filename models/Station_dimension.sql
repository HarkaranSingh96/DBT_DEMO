with bike as (

    select 
    start_station_id as station_id,
    start_station_name as start_station_name

    from {{ source('demo', 'bike') }}
    where bike_id !='bike_id'

    limit 10
)

select * from bike