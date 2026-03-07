select distinct
    crash_date as date_day,
    extract(year from crash_date) as year_number,
    extract(month from crash_date) as month_number,
    extract(day from crash_date) as day_number,
    format_date('%A', crash_date) as day_name
from {{ ref('stg_nyc_collisions') }}
where crash_date is not null