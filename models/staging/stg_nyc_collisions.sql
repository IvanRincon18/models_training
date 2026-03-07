with source as (

    select * 
    from {{ source('nyc_raw', 'nyc_source') }}

),

renamed as (

    select
        cast(`COLLISION_ID` as string) as collision_id,
        `CRASH DATE` as crash_date,
        `CRASH TIME` as crash_time,
        nullif(trim(`BOROUGH`), '') as borough,
        cast(`ZIP CODE` as string) as zip_code,
        cast(`LATITUDE` as float64) as latitude,
        cast(`LONGITUDE` as float64) as longitude,
        `LOCATION` as location,
        `ON STREET NAME` as on_street_name,
        `CROSS STREET NAME` as cross_street_name,
        `OFF STREET NAME` as off_street_name,
        cast(`NUMBER OF PERSONS INJURED` as int64) as number_of_persons_injured,
        cast(`NUMBER OF PERSONS KILLED` as int64) as number_of_persons_killed,
        cast(`NUMBER OF PEDESTRIANS INJURED` as int64) as number_of_pedestrians_injured,
        cast(`NUMBER OF PEDESTRIANS KILLED` as int64) as number_of_pedestrians_killed,
        cast(`NUMBER OF CYCLIST INJURED` as int64) as number_of_cyclist_injured,
        cast(`NUMBER OF CYCLIST KILLED` as int64) as number_of_cyclist_killed,
        cast(`NUMBER OF MOTORIST INJURED` as int64) as number_of_motorist_injured,
        cast(`NUMBER OF MOTORIST KILLED` as int64) as number_of_motorist_killed,
        `CONTRIBUTING FACTOR VEHICLE 1` as contributing_factor_vehicle_1,
        `CONTRIBUTING FACTOR VEHICLE 2` as contributing_factor_vehicle_2,
        `CONTRIBUTING FACTOR VEHICLE 3` as contributing_factor_vehicle_3,
        `CONTRIBUTING FACTOR VEHICLE 4` as contributing_factor_vehicle_4,
        `CONTRIBUTING FACTOR VEHICLE 5` as contributing_factor_vehicle_5,
        `VEHICLE TYPE CODE 1` as vehicle_type_code_1,
        `VEHICLE TYPE CODE 2` as vehicle_type_code_2,
        `VEHICLE TYPE CODE 3` as vehicle_type_code_3,
        `VEHICLE TYPE CODE 4` as vehicle_type_code_4,
        `VEHICLE TYPE CODE 5` as vehicle_type_code_5
    from source

)

select *
from renamed